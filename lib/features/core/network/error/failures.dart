import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class NoDataFound extends Failure {
  final int? statusCode;

  const NoDataFound(super.errorMessage, this.statusCode);
}

class NoInterNetConnection extends Failure {

  const NoInterNetConnection(super.errorMessage);
}


