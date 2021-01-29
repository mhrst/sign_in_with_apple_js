@JS('AppleID.auth')
library apple_id_auth;

import 'dart:js_util';

import '_js_stub.dart'
    // ignore: uri_does_not_exist
    if (dart.library.html) 'package:js/js.dart';

/// Initialize the authentication object with a configuration object.
///
/// https://developer.apple.com/documentation/sign_in_with_apple/authi/3230945-init
@JS()
external void init(ClientConfigI options);

/// Calls the JS interop for `AppleID.auth.signIn()` and translates
/// the returned Javascript Promise into a Dart [Future].
Future<SignInResponseI> signIn() => promiseToFuture(_signIn());

/// Sign in using the configuration object.
///
/// https://developer.apple.com/documentation/sign_in_with_apple/authi/3261300-signin
@JS('signIn')
external dynamic _signIn();

/// An object that contains a user’s authorization information.
///
/// https://developer.apple.com/documentation/sign_in_with_apple/authorizationi
@JS()
@anonymous
class AuthorizationI {
  external String get code;
  external String get id_token;
  external String get state;
}

/// An object that contains a user’s configuration information.
///
/// https://developer.apple.com/documentation/sign_in_with_apple/clientconfigi
@JS()
@anonymous
class ClientConfigI {
  external factory ClientConfigI({
    String clientId,
    String scope,
    String redirectURI,
    String state,
    String nonce,
    bool usePopup = false,
  });
}

/// An object that contains the user’s full name.
///
/// https://developer.apple.com/documentation/sign_in_with_apple/namei
@JS()
@anonymous
class NameI {
  external String get firstName;
  external String get lastName;
}

/// An object that contains the response to a sign-in request.
///
/// https://developer.apple.com/documentation/sign_in_with_apple/signinresponsei
@JS()
@anonymous
class SignInResponseI {
  external AuthorizationI get authorization;
  external UserI get user;
}

/// An object that contains the user’s name and email address.
///
/// https://developer.apple.com/documentation/sign_in_with_apple/useri
@JS()
@anonymous
class UserI {
  external String get email;
  external NameI get name;
}
