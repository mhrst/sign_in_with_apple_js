import 'dart:async';
import 'dart:html';

import 'package:js/js_util.dart';

import 'apple_id_js.dart' as apple_id;

StreamSubscription<Event>? _subAppleIDSignInOnSuccess,
    _subAppleIDSignInOnFailure;

StreamSubscription<Event> listenAppleIDSignInOnFailure(
    Function(Event) callback) {
  _subAppleIDSignInOnFailure?.cancel();
  return _subAppleIDSignInOnFailure ??=
      document.on['AppleIDSignInOnFailure'].listen(callback);
}

StreamSubscription<Event> listenAppleIDSignInOnSuccess(
    Function(Event) callback) {
  _subAppleIDSignInOnSuccess?.cancel();
  return _subAppleIDSignInOnSuccess =
      document.on['AppleIDSignInOnSuccess'].listen(callback);
}

Future<apple_id.SignInResponseI?> signInWithApple() async {
  try {
    return await promiseToFuture(apple_id.auth.signIn());
  } catch (_) {
    return null;
  }
}
