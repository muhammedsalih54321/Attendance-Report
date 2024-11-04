part of 'referesh_token_bloc.dart';

@immutable
sealed class RefereshTokenEvent {}
class FetchRefreshToken extends RefereshTokenEvent {
  final String refershToken;
  final BuildContext ctx;
  FetchRefreshToken({required this.refershToken,required this.ctx});
}