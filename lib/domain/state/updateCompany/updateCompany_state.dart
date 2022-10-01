import 'package:mobx/mobx.dart';
import 'package:myapp/data/api/model/api_company.dart';
import 'package:myapp/domain/repository/company_repository.dart';

part 'updateCompany_state.g.dart';

class UpdateCompanyState = UpdateCompanyStateBase with _$UpdateCompanyState;

abstract class UpdateCompanyStateBase with Store {
  UpdateCompanyStateBase(this._companyRepository);

  final CompanyRepository _companyRepository;

  @observable
  ApiCompany companyForUpdate = ApiCompany(id: 0,
      title: '',
      fioContact: '',
      phone: '',
      email: '',
      site: '',
      postcode: 0,
      city: '',
      street: '',
      house: 0,
      latitude: 0,
      longitude: 0);

  @observable
  int responseStatusCode = 0;

  @action
  Future updateCompany() async{
    responseStatusCode = await _companyRepository.updateCompany(companyForUpdate);
  }
}
