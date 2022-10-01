import '../models/company.dart';

abstract class CompanyRepository {
  Future <List<Company>> getAllCompanies();
  Future <int> createCompany(Company company);
  Future <int> updateCompany(Company company);
  Future <void> deleteSelectedCompanies(company);
}