part of 'find_cubit.dart';

abstract class FindState extends Equatable{
  const FindState();
}

class FindInitial extends FindState {
  @override
  List<Object?> get props => [];
}

class FindSubmit extends FindState {
  @override

  List<Object?> get props => [];
}

class FindCodeSubmit extends FindState {
  @override
  List<Object?> get props => [];

}

class FindError extends FindState{
  final String err;
  FindError(this.err);

  @override
  List<Object?> get props => [err];
}