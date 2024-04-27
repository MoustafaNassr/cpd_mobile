part of 'add_cpd_cubit.dart';



@immutable
abstract class CpdAddState {}

class CpdAddInitial extends CpdAddState {}

class CpdAddLoading extends CpdAddState {}

class CpdAddSuccess extends CpdAddState {
  final CpdDataModel cpd;
  CpdAddSuccess(this.cpd);
}

class CpdAddFail extends CpdAddState {}
