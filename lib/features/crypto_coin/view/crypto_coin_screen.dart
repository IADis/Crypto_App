import 'package:crypto_app/repositories/crypto_coins/models/crypto_coins_model.dart';
import 'package:flutter/material.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({Key? key}) : super(key: key);

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  @override
  Widget build(BuildContext context) {
    var arguments =
        ModalRoute.of(context)!.settings.arguments as CryptoCoinsModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network(arguments.imageUrl),
          ),
        ],
      ),
    );
  }
}
