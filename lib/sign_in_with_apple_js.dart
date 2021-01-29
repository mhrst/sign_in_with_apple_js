library sign_in_with_apple_js;

import 'dart:async';
import 'dart:html' as html;

import 'apple_id_auth_js.dart' as apple_id_auth;

StreamSubscription _subAppleIDSignInOnSuccess, _subAppleIDSignInOnFailure;

StreamSubscription<html.Event> listenAppleIDSignInOnSuccess(
    Function(html.Event) callback) {
  _subAppleIDSignInOnSuccess?.cancel();
  return _subAppleIDSignInOnSuccess =
      html.document.on['AppleIDSignInOnSuccess'].listen(callback);
}

StreamSubscription<html.Event> listenAppleIDSignInOnFailure(
    Function(html.Event) callback) {
  _subAppleIDSignInOnFailure?.cancel();
  return _subAppleIDSignInOnFailure ??=
      html.document.on['AppleIDSignInOnFailure'].listen(callback);
}

void initSignInWithApple(apple_id_auth.ClientConfigI options) =>
    apple_id_auth.init(options);

Future<apple_id_auth.SignInResponseI> signInWithApple() =>
    apple_id_auth.signIn();
