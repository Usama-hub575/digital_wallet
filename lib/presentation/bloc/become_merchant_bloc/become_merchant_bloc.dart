import 'package:digital_wallet/export.dart';

part 'become_merchant_state.dart';

part 'become_merchant_event.dart';

class BecomeMerchantBloc
    extends Bloc<BecomeMerchantEvent, BecomeMerchantState> {
  BecomeMerchantBloc({
    required this.becomeMerchantUseCase,
  }) : super(
          BecomeMerchantState(
            merchantDashboardResponseModel:
                MerchantDashboardResponseModel.empty(),
            transactionsResponseModel: TransactionsResponseModel.empty(),
          ),
        ) {
    on<CaptureImage>(_captureImage);
    on<CreateAndGetMerchant>(_createAndGetMerchant);
    on<MerchantLoading>(_loading);
    on<GetMerchantDashboardData>(_getMerchantDashboardData);
    on<GetTransactions>(_getTransactions);
  }

  final BecomeMerchantUseCase becomeMerchantUseCase;

  _loading(MerchantLoading event, emit) {
    emit(
      state.copyWith(
        status: BecomeMerchantStatus.loading,
      ),
    );
  }

  _captureImage(CaptureImage event, emit) async {
    state.image = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
  }

  _getMerchantDashboardData(GetMerchantDashboardData event, emit) async {
    final response = await becomeMerchantUseCase.getMerchantDashboardData();
    return response.fold(
      (success) {
        emit(
          state.copyWith(
            status: BecomeMerchantStatus.success,
            merchantDashboardResponseModel: success,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            status: BecomeMerchantStatus.error,
            errorMessage: r.message,
          ),
        );
      },
    );
  }

  _getTransactions(GetTransactions event, emit) async {
    final response = await becomeMerchantUseCase.getTransactions(
      sent: event.sent,
    );
    return response.fold(
      (success) {
        emit(
          state.copyWith(
            status: BecomeMerchantStatus.success,
            transactionsResponseModel: success,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            status: BecomeMerchantStatus.error,
            errorMessage: r.message,
          ),
        );
      },
    );
  }

  _createAndGetMerchant(CreateAndGetMerchant event, emit) async {
    final response = await becomeMerchantUseCase.createAndGetMerchant(
      image: state.image,
      payload: event.payload,
    );
    return response.fold(
      (success) {
        emit(
          state.copyWith(
            status: BecomeMerchantStatus.success,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            status: BecomeMerchantStatus.error,
            errorMessage: r.message,
          ),
        );
      },
    );
  }
}
