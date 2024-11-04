part of 'referesh_token_bloc.dart';

@immutable
sealed class RefereshTokenState {}

final class RefereshTokenInitial extends RefereshTokenState {}
class RefereshTokenloading extends RefereshTokenState{}
class RefereshTokenloaded extends RefereshTokenState{}
class RefereshTokenError extends RefereshTokenState{}