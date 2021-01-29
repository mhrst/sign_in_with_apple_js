# **sign_in_with_apple_js**

A Dart wrapper for the [Sign in with Apple JS](https://developer.apple.com/documentation/sign_in_with_apple/sign_in_with_apple_js/) framework. Also contains some helper functions to abstract javascript calls.

## Setup

From [Apple docs](https://developer.apple.com/documentation/sign_in_with_apple/sign_in_with_apple_js/configuring_your_webpage_for_sign_in_with_apple):

1. Include the script tag and link to Apple’s hosted version of the Sign in with Apple JS framework in your web page:
```html
<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
```
2. Configure the authorization object using only markup by setting the meta tags in the header section and displaying a Sign in with Apple button, as in the following example:
> This step can be skipped by explicitly setting these options using `AppleID.auth.init()` (see below).
```html
    <head>
        <meta name="appleid-signin-client-id" content="[CLIENT_ID]">
        <meta name="appleid-signin-scope" content="[SCOPES]">
        <meta name="appleid-signin-redirect-uri" content="[REDIRECT_URI]">
        <meta name="appleid-signin-state" content="[STATE]">
        <meta name="appleid-signin-nonce" content="[NONCE]">
        <meta name="appleid-signin-use-popup" content="true"> <!-- or false defaults to false -->
    </head>
```

## Initialization
> This step can be skipped by setting the above `meta` tags in the `<head>` section of your html document (see above).

1. Import the package:
```dart
import 'package:apple_sign_in_js/sign_in_with_apple_js.dart';
```
2. Call `init` with the necessary options:
> Any required options specified in html `<meta>` tags can be omitted.
```dart
  initSignInWithApple(ClientConfigI(
    clientId: [CLIENT_ID], // required (Apple ServiceID)
    redirectURI: [REDIRECT_URI], // required
    scope: [SCOPES], // space-delimited list (i.e. "name email")
    state: [STATE],
    nonce: [NONCE]
    usePopup: [USE_POPUP], // defaults to false
  ));
```

## Handling the Authorization Response
1. Import the interop library for `AppleID.auth`:
```dart
import 'package:sign_in_with_apple_js/sign_in_with_apple_js.dart';
```
2. Make asynchronous call to `signInWithApple()`:
```dart
SignInResponseI response = await signInWithApple();
```
3. Use the id-token or authorization-code from `SignInResponseI` to create a session on your server.
> The data returned in `SignInResponseI` from `signInWithApple` is short-lived (5 minutes).

## Listening to Events
1. Import the package:
```dart
import 'package:sign_in_with_apple_js/sign_in_with_apple_js.dart';
```
2. Add callbacks for success and failure events:
```dart
/// on `AppleIDSignInOnSuccess`
final streamSub = listenAppleIDSignInOnSuccess((event) => print("Success."));

/// on `AppleIDSignInOnFailure`
final streamSub = listenAppleIDSignInOnFailure((event) => print("Failure."))
```

## Using the Javascript Wrapper Directly

Alternative, if you'd just like access to Sign in with Apple JS on your page, you can directly import the wrapper:

```dart
import 'package:sign_in_with_apple_js/apple_id_auth_js.dart';
```