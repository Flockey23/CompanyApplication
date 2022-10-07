// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_company_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateCompanyState on CreateCompanyStateBase, Store {
  late final _$companyForCreateAtom =
      Atom(name: 'CreateCompanyStateBase.companyForCreate', context: context);

  @override
  ApiCompany get companyForCreate {
    _$companyForCreateAtom.reportRead();
    return super.companyForCreate;
  }

  @override
  set companyForCreate(ApiCompany value) {
    _$companyForCreateAtom.reportWrite(value, super.companyForCreate, () {
      super.companyForCreate = value;
    });
  }

  late final _$responseStatusCodeAtom =
      Atom(name: 'CreateCompanyStateBase.responseStatusCode', context: context);

  @override
  int get responseStatusCode {
    _$responseStatusCodeAtom.reportRead();
    return super.responseStatusCode;
  }

  @override
  set responseStatusCode(int value) {
    _$responseStatusCodeAtom.reportWrite(value, super.responseStatusCode, () {
      super.responseStatusCode = value;
    });
  }

  late final _$createCompanyAsyncAction =
      AsyncAction('CreateCompanyStateBase.createCompany', context: context);

  @override
  Future createCompany() {
    return _$createCompanyAsyncAction.run(() => super.createCompany());
  }

  @override
  String toString() {
    return '''
companyForCreate: ${companyForCreate},
responseStatusCode: ${responseStatusCode}
    ''';
  }
}
