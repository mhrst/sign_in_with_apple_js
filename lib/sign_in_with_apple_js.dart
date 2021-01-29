library sign_in_with_apple_js;

import 'dart:async';
import 'dart:html' as html;

import '_js_util_stub.dart'
    // ignore: uri_does_not_exist
    if (dart.library.html) 'package:js/js_util.dart';
import 'apple_id_js.dart' as apple_id;

export 'apple_id_js.dart';

StreamSubscription _subAppleIDSignInOnSuccess, _subAppleIDSignInOnFailure;

/// Initialize Sign in with Apple JS using a configuration object
///
/// Calling [initSignInWithApple] is optional if these options are
/// specified in your html.
void initSignInWithApple(apple_id.ClientConfigI options) =>
    apple_id.auth.init(options);

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

/// Calls the JS interop for `AppleID.auth.signIn()` and translates
/// the returned Javascript Promise into a Dart [Future].
Future<apple_id.SignInResponseI> signInWithApple() =>
    promiseToFuture(apple_id.auth.signIn());
