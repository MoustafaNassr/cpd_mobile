import 'package:equatable/equatable.dart';

class TrainingFormat extends Equatable {
  final int id;
  final String name;
 

  const TrainingFormat({
    required this.id,
    required this.name,
    
  });

  @override
  List<Object> get props => [
    id,
    name,
  
  ];
}