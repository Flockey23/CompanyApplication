// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeState on HomeStateBase, Store {
  late final _$companiesAtom =
      Atom(name: 'HomeStateBase.companies', context: context);

  @override
  List<Company> get companies {
    _$companiesAtom.reportRead();
    return super.companies;
  }

  @override
  set companies(List<Company> value) {
    _$companiesAtom.reportWrite(value, super.companies, () {
      super.companies = value;
    });
  }

  late final _$selectedCompaniesAtom =
      Atom(name: 'HomeStateBase.selectedCompanies', context: context);

  @override
  List<Company> get selectedCompanies {
    _$selectedCompaniesAtom.reportRead();
    return super.selectedCompanies;
  }

  @override
  set selectedCompanies(List<Company> value) {
    _$selectedCompaniesAtom.reportWrite(value, super.selectedCompanies, () {
      super.selectedCompanies = value;
    });
  }

  late final _$deleteCompaniesAtom =
      Atom(name: 'HomeStateBase.deleteCompanies', context: context);

  @override
  List<Company> get deleteCompanies {
    _$deleteCompaniesAtom.reportRead();
    return super.deleteCompanies;
  }

  @override
  set deleteCompanies(List<Company> value) {
    _$deleteCompaniesAtom.reportWrite(value, super.deleteCompanies, () {
      super.deleteCompanies = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'HomeStateBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$deleteStatusCodeAtom =
      Atom(name: 'HomeStateBase.deleteStatusCode', context: context);

  @override
  int get deleteStatusCode {
    _$deleteStatusCodeAtom.reportRead();
    return super.deleteStatusCode;
  }

  @override
  set deleteStatusCode(int value) {
    _$deleteStatusCodeAtom.reportWrite(value, super.deleteStatusCode, () {
      super.deleteStatusCode = value;
    });
  }

  late final _$getAllCompaniesAsyncAction =
      AsyncAction('HomeStateBase.getAllCompanies', context: context);

  @override
  Future<dynamic> getAllCompanies() {
    return _$getAllCompaniesAsyncAction.run(() => super.getAllCompanies());
  }

  @override
  String toString() {
    return '''
companies: ${companies},
selectedCompanies: ${selectedCompanies},
deleteCompanies: ${deleteCompanies},
isLoading: ${isLoading},
deleteStatusCode: ${deleteStatusCode}
    ''';
  }
}
