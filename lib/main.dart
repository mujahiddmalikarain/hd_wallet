import 'package:e_wallet/provider/transaction.dart';
import 'package:e_wallet/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyTransaction>(create: (_) => MyTransaction()),
      ],
      child: Consumer<MyTransaction>(builder: (context, transaction, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomeScreen(),
        );
      }),
    );
  }
}
