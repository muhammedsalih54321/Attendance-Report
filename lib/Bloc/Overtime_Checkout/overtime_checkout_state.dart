part of 'overtime_checkout_bloc.dart';

@immutable
sealed class OvertimeCheckoutState {}

final class OvertimeCheckoutInitial extends OvertimeCheckoutState {}
class OvertimeCheckoutloading extends OvertimeCheckoutState{}
class OvertimeCheckoutloaded extends OvertimeCheckoutState{}
class OvertimeCheckoutError extends OvertimeCheckoutState{}