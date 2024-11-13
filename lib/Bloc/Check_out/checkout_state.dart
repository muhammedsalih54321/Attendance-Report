part of 'checkout_bloc.dart';

@immutable
sealed class CheckOutState {}

final class CheckOutInitial extends CheckOutState {}
class Checkoutloading extends CheckOutState{}
class Checkoutoaded extends CheckOutState{}
class CheckoutcError extends CheckOutState{}