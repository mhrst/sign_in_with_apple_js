library sign_in_with_apple_js;

import 'dart:async';

import '_web_only_stub.dart'
    // ignore: uri_does_not_exist
    if (dart.library.html) '_web_only.dart' as web_only;
import 'apple_id_js.dart' as apple_id;

export 'apple_id_js.dart';

/// Initialize Sign in with Apple JS using a configuration object
///
/// Calling [initSignInWithApple] is optional if these options are
/// specified in your html.
void initSignInWithApple(apple_id.ClientConfigI options) =>
    apple_id.auth.init(options);

/// Listen to the failure event from Sign in with Apple JS
StreamSubscription<dynamic> listenAppleIDSignInOnFailure(
        void Function(dynamic) callback) =>
    web_only.listenAppleIDSignInOnFailure(callback);

/// Listen to the success event from Sign in with Apple JS
StreamSubscription<dynamic> listenAppleIDSignInOnSuccess(
        void Function(dynamic) callback) =>
    web_only.listenAppleIDSignInOnSuccess(callback);

/// Calls the JS interop for `AppleID.auth.signIn()` and translates
/// the returned Javascript Promise into a Dart [Future].
Future<apple_id.SignInResponseI> signInWithApple() =>
    web_only.signInWithApple();
