import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/service/service.dart';
import '../../model/transaction_model.dart';
import '../../utils/constants.dart';

class TextResPlatform extends StatefulWidget {
  const TextResPlatform({super.key});

  @override
  State<TextResPlatform> createState() => _TextResPlatformState();
}

class _TextResPlatformState extends State<TextResPlatform> {
  final Future<TransactionModel> transaction = Service.getTransactionModel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TransactionModel>(
      future: transaction,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          dynamic transactionData = snapshot.data;
          return Text(
            transactionData.platform + ' ' + transactionData.kernelArch,
            style: TextStyle(
              color: Constants.brown,
              fontWeight: FontWeight.w500,
            ),
          );
        } else if (snapshot.hasError) {
          return const Text('Hata var');
        } else {
          return Center(
              child: CircularProgressIndicator(
            strokeWidth: 1,
            color: Constants.buttonColor,
          ));
        }
      },
    );
  }
}
