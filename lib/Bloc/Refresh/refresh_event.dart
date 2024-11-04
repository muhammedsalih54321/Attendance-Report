part of 'refresh_bloc.dart';

@immutable
sealed class RefreshEvent {}

class FetchlRefreshEvent extends RefreshEvent {
  final String refresh;
  final BuildContext ctx;

  FetchlRefreshEvent({required this.refresh,required this.ctx});
}
