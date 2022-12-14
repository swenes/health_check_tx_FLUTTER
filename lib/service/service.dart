import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:healthcheck_tx_api/model/transaction_model.dart';

class Service {
  static const String url = 'http://10.0.2.2:3000/api/v1/transactions/';

  static Future<TransactionModel> getTransactionModel() async {
    try {
      late TransactionModel transactionModel;
      var response = await Dio().get(url);

      if (response.statusCode == 200) {
        var dataString = response.toString();
        var transList = await jsonDecode(dataString);
        var lastDataIndex = transList['data'].length;

        transactionModel =
            TransactionModel.fromMap(transList['data'][lastDataIndex - 1]);
      }

      return transactionModel;
    } on DioError catch (e) {
      return Future.error(e.error);
    }
  }

  static Future<List<TransactionModel>> getTransactionModelList() async {
    try {
      List<TransactionModel> transactionList = [];
      var response = await Dio().get(url);

      if (response.statusCode == 200) {
        var dataString = response.toString();
        var transList = await jsonDecode(dataString);

        var dataCount = transList['data'].length; //14 döner ise

        for (int i = 0; i < dataCount; i++) {
          TransactionModel transactionModel =
              TransactionModel.fromMap(transList['data'][i]);
          transactionList.add(transactionModel);
        }
      }

      return transactionList;
    } on DioError catch (e) {
      return Future.error(e.error);
    }
  }
}
