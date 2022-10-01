import 'package:myapp/data/api/api_util.dart';
import 'package:myapp/data/api/service/authorization_rest_api.dart';
import 'package:myapp/data/api/service/company_rest_api.dart';

class ApiModule {
  static ApiUtil? _apiUtil;

  static ApiUtil apiUtil() {
    _apiUtil ??= ApiUtil(CompanyRestApi(),AuthorizationRestApi());
    return _apiUtil!;
  }
}