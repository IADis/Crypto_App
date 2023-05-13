import 'package:crypto_app/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:crypto_app/repositories/crypto_coins/models/crypto_coins_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        emit(CryptoListLoading());
        final coinsModel = await coinsRepository.getCoinsList();
        emit(CryptoListLoaded(coinsModel: coinsModel));
      } catch (e) {
        emit(CryptoListLoadingFailure(error: e));
      }
    });
  }

  final CryptoCoinsRepository coinsRepository;
}
