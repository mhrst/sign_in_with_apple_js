import 'package:sign_in_with_apple_js/apple_id_auth_js.dart';
import 'package:sign_in_with_apple_js/sign_in_with_apple_js.dart';

void main() {
  /// Initialize
  initSignInWithApple(ClientConfigI(
    clientId: '', // TODO:
    scope: 'name email',
    redirectURI: '', // TODO:
    usePopup: true,
  ));
}
