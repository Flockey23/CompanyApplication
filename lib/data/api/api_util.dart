import 'package:myapp/data/api/service/authorization_rest_api.dart';
import 'package:myapp/data/api/service/company_rest_api.dart';
import 'package:myapp/domain/models/user.dart';
import '../../domain/models/company.dart';

class ApiUtil {
  final CompanyRestApi _companyRestApi;
  final AuthorizationRestApi _authorizationRestApi;

  ApiUtil(this._companyRestApi, this._authorizationRestApi);

  Future<int> authorize(User user) async{
    final result = await _authorizationRestApi.authorize(user);
    return result;
  }

  Future<int> createCompany(Company company) async {
    final result = await _companyRestApi.createCompany(company);
    return result;
  }

  Future<int> updateCompany(Company company) async {
    final result = await _companyRestApi.updateCompany(company);
    return result;
  }

  deleteSelectedCompanies(Company company) async {
    final result = await _companyRestApi.deleteSelectedCompanies(company);
    return result;
  }

  Future<List<Company>> getCompanyData() async {
    final result = await _companyRestApi.getCompanyData();
    return result;
  }
}
