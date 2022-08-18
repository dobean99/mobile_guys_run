part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class ChangeTabBarSuccess extends HomeState {
  final String name;

  ChangeTabBarSuccess(this.name);

}
