import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable implements Exception {}

class DatabaseFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyList extends Failure {
  @override
  List<Object?> get props => [];
}
