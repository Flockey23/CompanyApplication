import 'package:myapp/data/api/api_util.dart';
import 'package:myapp/domain/models/user.dart';
import 'package:myapp/domain/repository/authorization_repository.dart';

class AuthorizationDataRepository extends AuthorizationRepository{
  final ApiUtil _apiUtil;

  AuthorizationDataRepository(this._apiUtil);

  @override
  Future <int> authorize(User user) async{
    return await _apiUtil.authorize(user);
  }
}