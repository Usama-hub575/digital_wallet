import 'package:digital_wallet/export.dart';

part 'qr_event.dart';

part 'qr_state.dart';

class QRBloc extends Bloc<QREvent, QRState> {
  QRBloc()
      : super(
          QRState(),
        );
}
