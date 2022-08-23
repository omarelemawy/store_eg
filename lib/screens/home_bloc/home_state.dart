


import '../../model/collection_model.dart';

abstract class HomeStates{}
class HomeInitial extends HomeStates {}
class ChangeSelectedHomeState extends HomeStates {}
class GetLoadingHomeState extends HomeStates {}
class GetSuccessHomeState extends HomeStates {}
class GetErrorHomeState extends HomeStates {
  GetErrorHomeState(this.error);
  String error;
}

class DataLoaded extends HomeStates {
  final List<Item> items;

  DataLoaded(this.items);
}

class DataLoading extends HomeStates {
  final List<Item> oldData;
  final bool isFirstFetch;

  DataLoading(this.oldData, {this.isFirstFetch=false});
}
