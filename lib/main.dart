import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/screen/home.dart';
import 'package:healthcheck_tx_api/utils/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Constants.scaffoldBG,
          appBarTheme: AppBarTheme(color: Constants.darkBlue)),
      home: const Home(),
    );
  }
}
