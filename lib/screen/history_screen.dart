import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/model/transaction_model.dart';
import 'package:healthcheck_tx_api/service/service.dart';
import 'package:healthcheck_tx_api/utils/constants.dart';

import '../model/transaction_history_model.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

late TransactionHistoryModel transactionHistoryModel;
Future<List<TransactionModel>> _transactionList =
    Service.getTransactionModelList();

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History Usage",
          style: TextStyle(color: Constants.scaffoldBG),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/background.jpg'),
          ),
        ),
        child: FutureBuilder(
          future: _transactionList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              dynamic transactionDataList = _transactionList;

              return ListView.builder(
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    title: Text(transactionDataList[index].hostname),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'HATA MEYDANA GELDİ',
                  style: TextStyle(color: Colors.white),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
