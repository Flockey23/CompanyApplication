import 'package:myapp/domain/models/user.dart';

abstract class AuthorizationRepository{
  Future <int> authorize(User user);
}