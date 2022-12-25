// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/model/transaction_model.dart';
import 'package:healthcheck_tx_api/service/service.dart';

import '../utils/constants.dart';

class DependenciesScreen extends StatelessWidget {
  DependenciesScreen({super.key});
  Future<TransactionModel> transactionModel = Service.getTransactionModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/background.jpg'),
          ),
        ),
        child: FutureBuilder(
          future: transactionModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              dynamic transactionData = snapshot.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Dependencies',
                          textAlign: TextAlign.center,
                          style: Constants.titleStyle.copyWith(
                              fontSize: 20, color: Constants.darkBlue),
                        ),
                        Text(
                          'Axios: ${transactionData.moduleVersions.dependencies.axios}',
                          style: TextStyle(
                              fontSize: 17,
                              color: Constants.darkRed,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Express: ${transactionData.moduleVersions.dependencies.express}',
                          style: TextStyle(
                              fontSize: 17,
                              color: Constants.darkRed,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'UuId: ${transactionData.moduleVersions.dependencies.uuid}',
                          style: TextStyle(
                              fontSize: 17,
                              color: Constants.darkRed,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    height: 150,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'DEV Dependencies',
                          textAlign: TextAlign.center,
                          style: Constants.titleStyle.copyWith(
                              fontSize: 20, color: Constants.darkBlue),
                        ),
                        Text(
                          'Nodemon: ${transactionData.moduleVersions.devDependencies.nodemon}',
                          style: TextStyle(
                              fontSize: 17,
                              color: Constants.darkRed,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return const Text('Hata Oluştu');
            } else {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  color: Constants.buttonColor,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
