// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_company_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UpdateCompanyState on UpdateCompanyStateBase, Store {
  late final _$companyForUpdateAtom =
      Atom(name: 'UpdateCompanyStateBase.companyForUpdate', context: context);

  @override
  ApiCompany get companyForUpdate {
    _$companyForUpdateAtom.reportRead();
    return super.companyForUpdate;
  }

  @override
  set companyForUpdate(ApiCompany value) {
    _$companyForUpdateAtom.reportWrite(value, super.companyForUpdate, () {
      super.companyForUpdate = value;
    });
  }

  late final _$responseStatusCodeAtom =
      Atom(name: 'UpdateCompanyStateBase.responseStatusCode', context: context);

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

  late final _$updateCompanyAsyncAction =
      AsyncAction('UpdateCompanyStateBase.updateCompany', context: context);

  @override
  Future<dynamic> updateCompany() {
    return _$updateCompanyAsyncAction.run(() => super.updateCompany());
  }

  @override
  String toString() {
    return '''
companyForUpdate: ${companyForUpdate},
responseStatusCode: ${responseStatusCode}
    ''';
  }
}
