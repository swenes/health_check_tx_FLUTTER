import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/service/service.dart';
import '../model/transaction_model.dart';
import '../utils/constants.dart';

class TextResUpdatedAt extends StatefulWidget {
  const TextResUpdatedAt({super.key});

  @override
  State<TextResUpdatedAt> createState() => _TextResUpdatedAtState();
}

class _TextResUpdatedAtState extends State<TextResUpdatedAt> {
  final Future<TransactionModel> transaction = Service.getTransactionModel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TransactionModel>(
      future: transaction,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          dynamic transactionData = snapshot.data;
          return Text(
            transactionData.updatedAt,
            style: TextStyle(
              color: Constants.brown,
              fontWeight: FontWeight.w500,
            ),
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
