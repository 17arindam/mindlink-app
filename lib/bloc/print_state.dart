part of 'print_bloc.dart';

@immutable
sealed class PrintState {}

final class PrintInitial extends PrintState {}

class PrintSharingState extends PrintState {}  // State to indicate sharing in progress
