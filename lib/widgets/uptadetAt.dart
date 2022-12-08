import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/service/service.dart';
import '../model/transaction_model.dart';
import '../utils/constants.dart';

class TextResUpdatedAt extends StatefulWidget {
  TextResUpdatedAt({super.key});

  @override
  State<TextResUpdatedAt> createState() => _TextResUpdatedAtState();
}

late final Future<List<TransactionModel>> _transactionList =
    Service.getTransactionList();

class _TextResUpdatedAtState extends State<TextResUpdatedAt> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TransactionModel>>(
      future: _transactionList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var transactionList = snapshot.data!;
          dynamic transaction = transactionList[0]; //çok sıkıntılı bi kullanım
          return Text(
            transaction.updatedAt,
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
