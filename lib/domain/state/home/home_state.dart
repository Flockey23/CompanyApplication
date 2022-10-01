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
  ObservableList<Company> companies = ObservableList<Company>.of([]);
  @observable
  ObservableList<Company> selectedCompanies = ObservableList<Company>.of([]);
  @computed
  ObservableList<Company> get deleteCompanies => ObservableList.of(selectedCompanies.where((company) => company.selected == true));

  @observable
  bool isLoading = true;
  @observable
  int deleteStatusCode = 0;

  @action
  void setStateSelectedCompanies({required int index}){
    selectedCompanies[index].selected = !selectedCompanies[index].selected;
    selectedCompanies = selectedCompanies;
    debugPrint(selectedCompanies[index].selected.toString());
  }

  @action
  Future getAllCompanies() async {
    debugPrint("hello");
    isLoading = true;
    final data = await _companyRepository.getAllCompanies();
    companies =  data.asObservable();
    selectedCompanies = data.asObservable();
    isLoading = false;
  }

  @action
  Future deleteSelectedCompanies() async{
    for(var company in deleteCompanies) {
      await _companyRepository.deleteSelectedCompanies(company);
    }
  }
}