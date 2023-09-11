// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../contollers/building/building_contoller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BuildingController on BuildingControllerStore, Store {
  late final _$isLoadingAtom =
      Atom(name: 'BuildingControllerStore.isLoading', context: context);

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

  late final _$buildingsAtom =
      Atom(name: 'BuildingControllerStore.buildings', context: context);

  @override
  ObservableList<BuildingViewModel> get buildings {
    _$buildingsAtom.reportRead();
    return super.buildings;
  }

  @override
  set buildings(ObservableList<BuildingViewModel> value) {
    _$buildingsAtom.reportWrite(value, super.buildings, () {
      super.buildings = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('BuildingControllerStore.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
buildings: ${buildings}
    ''';
  }
}
