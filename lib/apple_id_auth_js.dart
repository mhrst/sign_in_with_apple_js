@JS('AppleID.auth')
library apple_id_auth;

import 'dart:js_util';

import 'package:js/js.dart';

@JS()
external void init(ClientConfigI options);

/// Returns a Promise for the below authorization response:
/// {
///  "authorization": {
///    "state": "[STATE]",
///    "code": "[CODE]",
///    "id_token": "[ID_TOKEN]"
///  },
///  "user": {
///    "email": "[EMAIL]",
///    "name": {
///      "firstName": "[FIRST_NAME]",
///      "lastName": "[LAST_NAME]"
///  }
/// }
@JS('signIn')
external dynamic _signIn();

/// Calls the JS interop for `AppleID.auth.signIn()` and translates
/// the returned Javascript Promise into a Dart [Future].
Future<SignInResponseI> signIn() => promiseToFuture(_signIn());

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

@JS()
@anonymous
class SignInResponseI {
  external AuthorizationI get authorization;
  external UserI get user;
}

@JS()
@anonymous
class AuthorizationI {
  external String get state;
  external String get code;
  external String get id_token;
}

@JS()
@anonymous
class UserI {
  external NameI get name;
  external String get email;
}

@JS()
@anonymous
class NameI {
  external String get firstName;
  external String get lastName;
}
