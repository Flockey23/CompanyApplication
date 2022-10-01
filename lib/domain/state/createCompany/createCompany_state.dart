import 'package:mobx/mobx.dart';
import 'package:myapp/data/api/model/api_company.dart';
import 'package:myapp/domain/repository/company_repository.dart';

part 'createCompany_state.g.dart';

class CreateCompanyState = CreateCompanyStateBase with _$CreateCompanyState;

abstract class CreateCompanyStateBase with Store {
  CreateCompanyStateBase(this._companyRepository);

  final CompanyRepository _companyRepository;

  @observable
  ApiCompany companyForCreate = ApiCompany(id: 0,
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
  createCompany() async {
    responseStatusCode = await _companyRepository.createCompany(companyForCreate);
  }
}