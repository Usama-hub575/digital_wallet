part of 'qr_bloc.dart';

class QRState extends Equatable {
  String qrText;
  QRStatus status;

  QRState({
    this.qrText = "",
    this.status = QRStatus.init,
  });

  QRState copyWith({
    String? qrText,
    QRStatus? status,
  }) {
    return QRState(
      qrText: qrText ?? this.qrText,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        qrText,
        status,
      ];
}
