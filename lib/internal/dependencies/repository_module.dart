import 'package:myapp/data/repository/authorization_data_repository.dart';
import 'package:myapp/data/repository/company_data_repository.dart';
import 'package:myapp/domain/repository/authorization_repository.dart';
import 'package:myapp/domain/repository/company_repository.dart';
import 'package:myapp/internal/dependencies/api_module.dart';

class RepositoryModule{
  static CompanyRepository? _companyRepository;
  static AuthorizationRepository? _authorizationRepository;

  static CompanyRepository companyRepository() {
    _companyRepository ??= CompanyDataRepository(ApiModule.apiUtil());
    return _companyRepository!;
  }

  static AuthorizationRepository authorizationRepository() {
    _authorizationRepository ??= AuthorizationDataRepository(ApiModule.apiUtil());
    return _authorizationRepository!;
  }
}