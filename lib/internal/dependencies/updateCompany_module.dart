import 'package:myapp/domain/state/updateCompany/updateCompany_state.dart';
import 'package:myapp/internal/dependencies/repository_module.dart';

class UpdateCompanyModule{
  static UpdateCompanyState updateCompanyState(){
    return UpdateCompanyState(RepositoryModule.companyRepository());
}
}