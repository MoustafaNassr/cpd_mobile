part of 'get_cpd_cubit.dart';

@immutable
abstract class CpdFetchState extends Equatable {}

 

class CpdFetchInitial extends CpdFetchState {
   @override
  List<Object> get props => [];
}

class CpdFetchLoading extends CpdFetchState {
    @override
  List<Object> get props => [];
}

class CpdFetchSuccess extends CpdFetchState {
    final List<CpdDataModel> cpds;
   CpdFetchSuccess(this.cpds);
     @override
  List<Object> get props => [cpds];
}

class CpdFetchFail extends CpdFetchState {
   @override
  List<Object> get props => [];
}
