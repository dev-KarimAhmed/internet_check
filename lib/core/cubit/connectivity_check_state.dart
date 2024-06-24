part of 'connectivity_check_cubit.dart';

@immutable
sealed class ConnectivityCheckState {}

final class ConnectivityCheckInitial extends ConnectivityCheckState {}
final class ConnectivityCheckLoading extends ConnectivityCheckState {}

final class ConnectedState extends ConnectivityCheckState {
  final String msg;
  ConnectedState(this.msg);
}

final class NotConnectedState extends ConnectivityCheckState {
  final String msg;
  NotConnectedState(this.msg);
}
