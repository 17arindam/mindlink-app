import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'print_event.dart';
part 'print_state.dart';

class PrintBloc extends Bloc<PrintEvent, PrintState> {
  PrintBloc() : super(PrintInitial()) {
    on<PrintSharingEvent>((event, emit) {
      print('Sharing...');  // Print to console
      emit(PrintSharingState());  // Emit a new state indicating sharing
    });
  }
}
