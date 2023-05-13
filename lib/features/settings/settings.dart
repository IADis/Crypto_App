import 'package:crypto_app/ui/theme/app_theme.dart';
import 'package:crypto_app/ui/theme/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch Theme'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView.builder(
          itemCount: AppTheme.values.length,
          itemBuilder: (context, index) {
            final sTheme = AppTheme.values[index];
            return InkWell(
              onTap: () => BlocProvider.of<ThemeBloc>(context).add(
                ThemeChanged(theme: sTheme),
              ),
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  color: appThemeData[sTheme]?.primaryColor,
                ),
                child: Center(
                  child: Text(
                    sTheme.toString(),
                    style: appThemeData[sTheme]?.textTheme.bodyLarge,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
