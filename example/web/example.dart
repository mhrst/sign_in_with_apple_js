import 'package:sign_in_with_apple_js/apple_id_js.dart';
import 'package:sign_in_with_apple_js/sign_in_with_apple_js.dart';
import 'dart:html' as html;

void main() async {
  initSignInWithApple(ClientConfigI(
    clientId: '', // TODO: Add your own client-id
    scope: 'name email',
    redirectURI: '', // TODO: Add your own redirect-uri
    usePopup: true,
  ));

  html.document
      .getElementById('appleid-signin')
      ?.onClick
      .listen((event) => signInWithApple());
}
