import 'package:equatable/equatable.dart';

abstract class ReusableState extends Equatable {
  const ReusableState();

  @override
  List<Object?> get props => [];
}

class ReusableInitialState extends ReusableState {}

class ReusableLoadingState extends ReusableState {}

class ReusableLoadedState<T> extends ReusableState {
  final T? data;

  const ReusableLoadedState({
    this.data,
  });

  @override
  List<Object?> get props => [data];
}

class ReusableErrorState extends ReusableState {
  final String error;
  const ReusableErrorState({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}
