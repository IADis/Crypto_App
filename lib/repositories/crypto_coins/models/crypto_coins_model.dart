import 'package:equatable/equatable.dart';

class CryptoCoinsModel extends Equatable {
  CryptoCoinsModel({
    required this.name,
    required this.priceInUsd,
    required this.imageUrl,
  });
  final String name;
  final double priceInUsd;
  final String imageUrl;

  @override
  List<Object> get props => [
        name,
        priceInUsd,
        imageUrl,
      ];
}
