import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/service/service.dart';
import '../../model/transaction_model.dart';
import '../../utils/constants.dart';

class TextResUptime extends StatefulWidget {
  const TextResUptime({super.key});

  @override
  State<TextResUptime> createState() => _TextResUptimeState();
}

class _TextResUptimeState extends State<TextResUptime> {
  final Future<TransactionModel> transaction = Service.getTransactionModel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TransactionModel>(
      future: transaction,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          dynamic transactionData = snapshot.data;

          int saniye = transactionData.uptime;
          int gun = (saniye / 86400).floor();
          saniye = saniye - (gun * 86400);
          int saat = (saniye / 3600).floor();
          saniye = saniye - (saat * 3600);
          int dakika = (saniye / 60).floor();
          saniye = saniye - (dakika * 60);
          return Text(
            gun == 0
                ? '$saat Hours $dakika Minutes $saniye Seconds'
                : '$gun Days $saat Hours $dakika Minutes $saniye Seconds',
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
            color: Theme.of(context).errorColor,
          ));
        }
      },
    );
  }
}
