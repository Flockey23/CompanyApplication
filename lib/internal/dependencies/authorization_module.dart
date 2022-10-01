import 'package:myapp/domain/state/authorization/authorization_state.dart';
import 'package:myapp/internal/dependencies/repository_module.dart';

class AuthorizationModule {
  static AuthorizationState authorizationState() {
    return AuthorizationState(RepositoryModule.authorizationRepository());
  }
}