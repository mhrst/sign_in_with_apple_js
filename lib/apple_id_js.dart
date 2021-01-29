@JS('AppleID')
library apple_id;

import '_js_stub.dart'
    // ignore: uri_does_not_exist
    if (dart.library.html) 'package:js/js.dart';

/// A reference to the `AppleID.auth` object
@JS()
AuthI auth;

/// The interface used to authenticate a user.
///
/// https://developer.apple.com/documentation/sign_in_with_apple/authi
@JS()
@anonymous
class AuthI {
  /// Initialize the authentication object with a configuration object.
  ///
  /// https://developer.apple.com/documentation/sign_in_with_apple/authi/3230945-init
  external void init(ClientConfigI options);

  /// Sign in using the configuration object.
  ///
  /// https://developer.apple.com/documentation/sign_in_with_apple/authi/3261300-signin
  external Object signIn();
}

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

/// An object that contains error information.
///
/// https://developer.apple.com/documentation/sign_in_with_apple/signinerrori
@JS()
@anonymous
class SignInErrorI {
  external String get error;
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
