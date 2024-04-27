import 'package:equatable/equatable.dart';

abstract class Failure  {
   final String errorMessage;

  Failure({required this.errorMessage});
  
}

// General failures
class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
}

class CacheFailure extends Failure {
  CacheFailure({required super.errorMessage});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.errorMessage});
}

class ExceptionFailure extends Failure {
  ExceptionFailure({required super.errorMessage});
}

class CredentialFailure extends Failure {
  CredentialFailure({required super.errorMessage});
}

class AuthenticationFailure extends Failure {
  AuthenticationFailure({required super.errorMessage});
}
