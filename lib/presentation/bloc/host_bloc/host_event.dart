part of 'host_bloc.dart';

class HostEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CurrentIndex extends HostEvent {
  final int currentIndex;

  CurrentIndex({
    required this.currentIndex,
  });
}
