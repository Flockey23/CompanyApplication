import 'package:myapp/domain/state/createCompany/create_company_state.dart';
import 'package:myapp/internal/dependencies/repository_module.dart';

class CreateCompanyModule {
  static CreateCompanyState addCompanyState() {
    return CreateCompanyState(RepositoryModule.companyRepository());
  }
}