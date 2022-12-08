import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/model/transaction_model.dart';

class Service {
  static const String url = 'http://10.0.2.2:3000/api/v1/transactions/';

  static Future<List<TransactionModel>> getTransactionList() async {
    try {
      List<TransactionModel> transactionList = [];

      var response = await Dio().get(url);

      if (response.statusCode == 200) {
        var dataString = response.toString();
        var transList = jsonDecode(dataString);

        // TransactionModel transactionModel =
        //     TransactionModel.fromMap(transList['data'][3]);   kernelversiyon sadece ilk datada var o yüzden manuel eklemek zorunda kalıyorum
        // transactionList.add(transactionModel);

        for (int i = 0; i < 5; i++) {
          TransactionModel transactionModel = TransactionModel.fromMap(
              transList['data']
                  [i]); // 0 yerine i yazmam lazım ama hata alıyorum
          transactionList.add(transactionModel);
        }
      }
      return transactionList;
    } on DioError catch (e) {
      return Future.error(e.error);
    }
  }
}

// debugPrint(
//     'datamızın[4] idsi: ${data['data'][4]['id']}'); //dördüncü datanın elemanlarına erişiyorsun
//  debugPrint('datamız : $data');
//  debugPrint(
//      'datamızın[0] idsi: ${data['data'][0]['id']}'); //ilk datanın elemanlarına
//