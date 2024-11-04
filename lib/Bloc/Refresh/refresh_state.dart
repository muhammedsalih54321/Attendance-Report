part of 'refresh_bloc.dart';

@immutable
sealed class RefreshState {}

final class RefreshInitial extends RefreshState {}
class RefreshLoading extends RefreshState {}
class RefreshLoaded extends RefreshState {}
class RefreshError extends RefreshState {}
