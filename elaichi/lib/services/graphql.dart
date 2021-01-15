import 'dart:async';
import 'dart:io';

import 'package:elaichi/app/locator.dart';
import 'package:elaichi/app/logger.dart';
import 'package:elaichi/datamodels/auth_user.dart';
import 'package:elaichi/datamodels/response.dart' as elaichi_res;
import 'package:elaichi/graphql/mutations.data.gql.dart';
import 'package:elaichi/graphql/mutations.req.gql.dart';
import 'package:elaichi/graphql/mutations.var.gql.dart';
import 'package:elaichi/services/local_db.dart';
import 'package:elaichi/strings.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:gql_error_link/gql_error_link.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:gql_link/gql_link.dart';
import 'package:gql_transform_link/gql_transform_link.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

/// Service which handles all `GraphQL` operations including `query` and
/// `mutation`.
///
/// Initialize the client using [initGraphQL] before using.
@singleton
class GraphQL {
  final Logger _logger = getLogger("GraphQL");
  Client _client;

  /// Initializes class variables for further operations
  ///
  /// String `token` is JWT token from Firebase.user
  Future<void> initGraphQL(
      {@required String token, http.Client httpClient}) async {
    final _HttpAuthLink httpLink = _HttpAuthLink(
        getToken: () {
          if (token == null) {
            throw Exception("Auth token not set");
          }
          return token;
        },
        graphQLEndpoint: Strings.GRAPHQL_URL,
        httpClient: httpClient);

    final LocalDb localDb = locator<LocalDb>();
    localDb.initLocalDb(boxesToOpen: [LocalDbBoxes.cache]);
    final Box box = await localDb.clearAndGetCacheBox();
    final HiveStore hiveStore = HiveStore(box);
    final Cache cache = Cache(store: hiveStore);

    _client = Client(link: httpLink, cache: cache);
  }

  /// Authorize or sign in the user at graphql endpoint.
  Future<AuthUser> authUser(
      {@required String username,
      @required String name,
      @required String email,
      @required String mobile,
      @required String displayPicture}) async {
    final GAuthUsersReq gAuthUsersReq = GAuthUsersReq((input) => input
      ..vars.userInput.username = username
      ..vars.userInput.name = name
      ..vars.userInput.gmailAuthMail = email
      ..vars.userInput.mobile = mobile
      ..vars.userInput.displayPicture = displayPicture);

    AuthUser authUser;
    final Stream<OperationResponse<GAuthUsersData, GAuthUsersVars>>
        responseStream = _client.request(gAuthUsersReq);
    final v = await responseStream
        .listen((res) => _logger.i(res.data.toJson()))
        .asFuture()
        .then((res) {
      _logger.i(res.data.toJson());
      return AuthUser.fromJson(res.data.authUser.toJson());
    });
    return authUser;
    //     .onData((data) =>
    //   return data.data.authUser;
    // ).onError(() {
    //   _logger.e("GraphQL request and parsing error", error, stacktrace);
    //   throw Failure(0, "Error");
    // });
  }
}

/// Handle header for GraphQL queries and mutations.
class _HttpAuthLink extends Link {
  Function getToken;
  String graphQLEndpoint;
  http.Client httpClient;

  String _token;

  Link _link;

  _HttpAuthLink({this.getToken, this.graphQLEndpoint, this.httpClient}) {
    _link = Link.from([
      TransformLink(requestTransformer: transformRequest),
      ErrorLink(onException: handleException),
      HttpLink(graphQLEndpoint, httpClient: httpClient),
    ]);
  }

  Future<void> updateToken() async {
    _token = getToken() as String;
  }

  Stream<Response> handleException(
    Request request,
    NextLink forward,
    LinkException exception,
  ) async* {
    if (exception is HttpLinkServerException &&
        exception.response.statusCode == 401) {
      await updateToken();

      yield* forward(request);

      return;
    }

    final message = exception is HttpLinkServerException
        ? exception.response.reasonPhrase
        : exception.toString();

    Zone.current.handleUncaughtError(message, StackTrace.fromString(''));

    throw exception;
  }

  Request transformRequest(Request request) =>
      request.updateContextEntry<HttpLinkHeaders>(
        (headers) => HttpLinkHeaders(
          headers: <String, String>{
            ...headers?.headers ?? <String, String>{},
            "authorization": _token,
          },
        ),
      );

  @override
  // ignore: type_annotate_public_apis
  Stream<Response> request(Request request, [forward]) async* {
    if (_token == null) {
      await updateToken();
    }

    yield* _link.request(request, forward);
  }
}
