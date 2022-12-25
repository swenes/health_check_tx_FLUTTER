import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/service/service.dart';
import '../../model/transaction_model.dart';
import '../../utils/constants.dart';

class TextResHostname extends StatefulWidget {
  const TextResHostname({super.key});

  @override
  State<TextResHostname> createState() => _TextResHostnameState();
}

class _TextResHostnameState extends State<TextResHostname> {
  @override
  Widget build(BuildContext context) {
    final Future<TransactionModel> transaction = Service.getTransactionModel();

    return FutureBuilder<TransactionModel>(
      future: transaction,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          dynamic transactionData = snapshot.data;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              transactionData.hostname,
              style: TextStyle(
                color: Constants.brown,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Text('Hata var');
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
