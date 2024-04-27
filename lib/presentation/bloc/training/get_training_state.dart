part of 'get_training_cubit.dart';

@immutable
abstract class TrainMethodFetchState extends Equatable {}
 



class  TrainMethodFetchInitial extends  TrainMethodFetchState {
  @override
  List<Object> get props => [];

}

class  TrainMethodFetchLoading extends  TrainMethodFetchState {
   @override
  List<Object> get props => [];

}

class  TrainMethodFetchSuccess extends  TrainMethodFetchState {
   final List<TrainingFormatModel> train;
    TrainMethodFetchSuccess(this.train);
   @override
  List<Object> get props => [train];

}

class  TrainMethodFetchFail extends TrainMethodFetchState {
  List<Object> get props => [];

}
