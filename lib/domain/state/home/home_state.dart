import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:myapp/domain/repository/company_repository.dart';
import '../../models/company.dart';

part 'home_state.g.dart';

class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {
  HomeStateBase(this._companyRepository);

  final CompanyRepository _companyRepository;

  @observable
  List<Company> companies = [];

  @observable
  List<Company> selectedCompanies = [];

  @observable
  List<Company> deleteCompanies = [];

  @observable
  bool isLoading = true;

  @observable
  int deleteStatusCode = 0;

  @action
  Future getAllCompanies() async {
    debugPrint("hello");
    isLoading = true;
    final data = await _companyRepository.getAllCompanies();
    companies = data;
    selectedCompanies = data;
    isLoading = false;
  }

  Future deleteSelectedCompanies() async{
    for(var company in deleteCompanies) {
      await _companyRepository.deleteSelectedCompanies(company);
    }
  }
}