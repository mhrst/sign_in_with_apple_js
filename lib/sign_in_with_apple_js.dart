library sign_in_with_apple_js;

import 'dart:async';
import 'dart:html' as html;

import 'apple_id_auth_js.dart' as apple_id_auth;

export 'apple_id_auth_js.dart' hide signIn, init;

StreamSubscription _subAppleIDSignInOnSuccess, _subAppleIDSignInOnFailure;

/// Initialize Sign in with Apple JS using a configuration object
///
/// Calling [initSignInWithApple] is optional if these options are
/// specified in your html.
void initSignInWithApple(apple_id_auth.ClientConfigI options) =>
    apple_id_auth.init(options);

/// Listen to the failure event from Sign in with Apple JS
StreamSubscription<html.Event> listenAppleIDSignInOnFailure(
    Function(html.Event) callback) {
  _subAppleIDSignInOnFailure?.cancel();
  return _subAppleIDSignInOnFailure ??=
      html.document.on['AppleIDSignInOnFailure'].listen(callback);
}

/// Listen to the success event from Sign in with Apple JS
StreamSubscription<html.Event> listenAppleIDSignInOnSuccess(
    Function(html.Event) callback) {
  _subAppleIDSignInOnSuccess?.cancel();
  return _subAppleIDSignInOnSuccess =
      html.document.on['AppleIDSignInOnSuccess'].listen(callback);
}

/// Make asynchronous call to Sign in with Apple
///
/// Returns a [Future] that resolves to a sign-in response from Apple
Future<apple_id_auth.SignInResponseI> signInWithApple() =>
    apple_id_auth.signIn();
