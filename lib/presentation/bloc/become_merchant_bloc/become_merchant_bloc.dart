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

  _showLoader(event, emit) {
    emit(
      state.copyWith(
        isLoading: true,
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
    if (event.url != null) {
      _showLoader(event, emit);
    }

    final response = await becomeMerchantUseCase.getTransactions(
      url: event.url,
      sent: event.sent,
      page: event.page,
    );

    return response.fold(
      (success) {
        // Append new results to the existing results
        final updatedResults = List<Results>.from(state.results ?? [])
          ..addAll(success.results ?? []);

        // Manually update the transactionsResponseModel
        final updatedResponseModel = state.transactionsResponseModel.copyWith(
          count: success.count,
          next: success.next,
          previous: success.previous,
          results: updatedResults,
        );
        event.sent
            ? emit(
                state.copyWith(
                  status: BecomeMerchantStatus.success,
                  transactionsResponseModel: updatedResponseModel,
                  results: updatedResults,
                  sentTransactionCurrentPage:
                      (state.sentTransactionCurrentPage ?? 1) + 1,
                  receivedTransactionCurrentPage:
                      (state.receivedTransactionCurrentPage ?? 1) + 1,
                  isLoading: false,
                ),
              )
            : emit(
                state.copyWith(
                  status: BecomeMerchantStatus.success,
                  transactionsResponseModel: updatedResponseModel,
                  results: updatedResults,
                  receivedTransactionCurrentPage:
                      (state.receivedTransactionCurrentPage ?? 1) + 1,
                  isLoading: false,
                ),
              );
      },
      (r) {
        emit(
          state.copyWith(
            status: BecomeMerchantStatus.error,
            isLoading: false,
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
