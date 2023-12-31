// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../contollers/user_data/user_data_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserDataContoller on UserDataStore, Store {
  late final _$isLoadingAtom =
      Atom(name: 'UserDataStore.isLoading', context: context);

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

  late final _$userDataAtom =
      Atom(name: 'UserDataStore.userData', context: context);

  @override
  UserDataLongViewModel? get userData {
    _$userDataAtom.reportRead();
    return super.userData;
  }

  @override
  set userData(UserDataLongViewModel? value) {
    _$userDataAtom.reportWrite(value, super.userData, () {
      super.userData = value;
    });
  }

  late final _$getUserDataAsyncAction =
      AsyncAction('UserDataStore.getUserData', context: context);

  @override
  Future<void> getUserData(String userId) {
    return _$getUserDataAsyncAction.run(() => super.getUserData(userId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
userData: ${userData}
    ''';
  }
}
