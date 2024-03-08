import 'package:equatable/equatable.dart';

sealed class NetworkResponse<T> extends Equatable {
  const NetworkResponse();

  @override
  List<Object> get props => [];
}

final class Loading<T> extends NetworkResponse {}

final class NetworkError<T> extends NetworkResponse {
  final int statusCode = 500;
  final String errorMessage;

  const NetworkError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class NetworkSuccess<T> extends NetworkResponse {
  final T value;

  const NetworkSuccess({required this.value});

  @override
  List<Object> get props => [value as Object];
}
