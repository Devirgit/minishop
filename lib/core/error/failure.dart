import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.type);

  final String type;

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure([String type = 'server-error']) : super(type);
}
