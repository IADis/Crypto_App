import 'package:crypto_app/repositories/crypto_coins/models/crypto_coins_model.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository {
  Future<List<CryptoCoinsModel>> getCoinsList() async {
    final response = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,USDC,USDT,BUSD,LTC,XPR,SOL,MATIC,BNB,OP,ADA,DOT,DOGE,TRU,APT,CFX,FIL,LINK,TRX&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];
      return CryptoCoinsModel(
          name: e.key,
          priceInUsd: price,
          imageUrl: 'https://www.cryptocompare.com/$imageUrl');
    }).toList();
    return cryptoCoinsList;
  }
}
