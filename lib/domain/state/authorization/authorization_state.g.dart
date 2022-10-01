// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthorizationState on AuthorizationStateBase, Store {
  late final _$userAtom =
      Atom(name: 'AuthorizationStateBase.user', context: context);

  @override
  ApiUser get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(ApiUser value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$statusCodeAtom =
      Atom(name: 'AuthorizationStateBase.statusCode', context: context);

  @override
  int get statusCode {
    _$statusCodeAtom.reportRead();
    return super.statusCode;
  }

  @override
  set statusCode(int value) {
    _$statusCodeAtom.reportWrite(value, super.statusCode, () {
      super.statusCode = value;
    });
  }

  late final _$authorizeAsyncAction =
      AsyncAction('AuthorizationStateBase.authorize', context: context);

  @override
  Future<dynamic> authorize() {
    return _$authorizeAsyncAction.run(() => super.authorize());
  }

  @override
  String toString() {
    return '''
user: ${user},
statusCode: ${statusCode}
    ''';
  }
}
