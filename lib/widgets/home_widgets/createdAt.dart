// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/service/service.dart';
import '../../model/transaction_model.dart';
import '../../utils/constants.dart';

class TextResCreatedAt extends StatefulWidget {
  const TextResCreatedAt({super.key});

  @override
  State<TextResCreatedAt> createState() => _TextResCreatedAtState();
}

class _TextResCreatedAtState extends State<TextResCreatedAt> {
  final Future<TransactionModel> transaction = Service.getTransactionModel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TransactionModel>(
      future: transaction,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          dynamic transactionData = snapshot.data;
          return Text(
            transactionData.createdAt,
            style: TextStyle(
              color: Constants.brown,
              fontWeight: FontWeight.w500,
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text('Bir Hata Oluştu'));
        } else {
          return Center(
              child: CircularProgressIndicator(
            strokeWidth: 1,
            color: Theme.of(context).errorColor,
          ));
        }
      },
    );
  }
}
