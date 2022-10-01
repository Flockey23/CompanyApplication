import 'package:myapp/data/api/api_util.dart';
import 'package:myapp/domain/repository/company_repository.dart';
import '../../domain/models/company.dart';

class CompanyDataRepository extends CompanyRepository{
  final ApiUtil _apiUtil;

  CompanyDataRepository(this._apiUtil);

  @override
  Future <int> createCompany(Company company) async {
    return await _apiUtil.createCompany(company);
  }

  @override
  Future<int> updateCompany(Company company) async {
    return await _apiUtil.updateCompany(company);
  }

  @override
  Future<void> deleteSelectedCompanies(company) async{
    return await _apiUtil.deleteSelectedCompanies(company);
  }

  @override
  Future<List<Company>> getAllCompanies() async {
    return await _apiUtil.getCompanyData();
  }
}