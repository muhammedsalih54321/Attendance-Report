part of 'check_out_bloc.dart';

@immutable
sealed class CheckOutState {}

final class CheckOutInitial extends CheckOutState {}
class CheckOutloading extends CheckOutState{}
class CheckOutloaded extends CheckOutState{}
class CheckOutError extends CheckOutState{}