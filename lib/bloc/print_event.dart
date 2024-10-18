part of 'print_bloc.dart';

@immutable
sealed class PrintEvent {}

class PrintSharingEvent extends PrintEvent {}  // Event to trigger sharing print
