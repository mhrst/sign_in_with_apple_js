import 'dart:async';

import 'apple_id_js.dart';

StreamSubscription<dynamic> listenAppleIDSignInOnFailure(Function callback) =>
    throw UnsupportedError('Listening to html events requires dart:html');

StreamSubscription<dynamic> listenAppleIDSignInOnSuccess(Function callback) =>
    throw UnsupportedError('Listening to html events requires dart:html');

Future<SignInResponseI> signInWithApple() =>
    throw UnsupportedError('Signing in with Apple JS requires dart:html');
