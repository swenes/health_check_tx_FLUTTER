import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/utils/constants.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HISTORY INFORMATIONS",
          style: TextStyle(color: Constants.scaffoldBG),
        ),
        centerTitle: true,
        elevation: 5,
      ),
    );
  }
}
