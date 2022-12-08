import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/service/service.dart';
import '../model/transaction_model.dart';
import '../utils/constants.dart';

class textResCreatedAt extends StatefulWidget {
  textResCreatedAt({super.key});

  @override
  State<textResCreatedAt> createState() => _textResCreatedAtState();
}

late final Future<List<TransactionModel>> _transactionList =
    Service.getTransactionList();

class _textResCreatedAtState extends State<textResCreatedAt> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TransactionModel>>(
      future: _transactionList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var transactionList = snapshot.data!;
          dynamic transaction = transactionList[0]; //çok sıkıntılı bi kullanım
          return Text(
            transaction.createdAt,
            style:
                TextStyle(color: Constants.brown, fontWeight: FontWeight.w500),
          );
        } else if (snapshot.hasError) {
          return const Text('Hata var');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
