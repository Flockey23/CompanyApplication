import 'package:mobx/mobx.dart';
import 'package:myapp/data/api/model/api_user.dart';
import 'package:myapp/domain/repository/authorization_repository.dart';

part 'authorization_state.g.dart';

class AuthorizationState = AuthorizationStateBase with _$AuthorizationState;

abstract class AuthorizationStateBase with Store {
  AuthorizationStateBase(this._authorizationRepository);

  final AuthorizationRepository _authorizationRepository;

  @observable
  ApiUser user = ApiUser(
      login: "login",
      password: "password"
  );

  @observable
  int statusCode = 0;

  @action
  Future authorize() async{
    statusCode = await _authorizationRepository.authorize(user);
  }
}