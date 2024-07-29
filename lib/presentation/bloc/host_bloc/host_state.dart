part of 'host_bloc.dart';

class HostState extends Equatable {
  int currentIndex;

  HostState({
    this.currentIndex = 0,
  });

  HostState copyWith({
    int? currentIndex,
  }) {
    return HostState(
      currentIndex: currentIndex ?? 0,
    );
  }

  @override
  List<Object?> get props => [
        currentIndex,
      ];
}
