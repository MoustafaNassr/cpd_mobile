import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String professionTitle;
  final String profile_image;
  final String email;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.professionTitle,
   required this.profile_image,
    required this.email,
  });

  @override
  List<Object> get props => [
    id,
    firstName,
    lastName,
    professionTitle,
    email,
    profile_image,
  ];
}