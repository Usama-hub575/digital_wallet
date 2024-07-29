import 'package:digital_wallet/export.dart';

part 'host_event.dart';

part 'host_state.dart';

class HostBloc extends Bloc<HostEvent, HostState> {
  HostBloc()
      : super(
          HostState(),
        ) {
    on<CurrentIndex>(_currentIndex);
  }

  void _currentIndex(CurrentIndex event, emit) {
    emit(
      state.copyWith(
        currentIndex: event.currentIndex,
      ),
    );
  }
}
