import 'package:equatable/equatable.dart';

class Skills extends Equatable {
  final int id;
  final String name;
 

  const Skills({
    required this.id,
    required this.name,
    
  });

  @override
  List<Object> get props => [
    id,
    name,
  
  ];
}