import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/repositories/crypto_coins/models/crypto_coins_model.dart';
import 'package:flutter/material.dart';

class CryptoListTile extends StatelessWidget {
  const CryptoListTile({
    super.key,
    required this.coin,
  });

  final CryptoCoinsModel coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: coin.imageUrl,
        imageBuilder: (context, imageProvider) => Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => const CircularProgressIndicator(
          color: Colors.green,
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
      title: Text(
        coin.name,
        style: theme.bodyMedium,
      ),
      subtitle: Text(
        '${coin.priceInUsd}\$',
        style: theme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coinScreen',
          arguments: coin,
        );
      },
    );
  }
}
