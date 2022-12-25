import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/model/transaction_model.dart';
import 'package:healthcheck_tx_api/service/service.dart';
import 'package:healthcheck_tx_api/utils/constants.dart';

import '../model/transaction_history_model.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

late TransactionHistoryModel transactionHistoryModel;
late Future<List<TransactionModel>> _transactionList;

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    _transactionList = Service.getTransactionModelList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History Usage",
          style: TextStyle(color: Constants.scaffoldBG),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/background.jpg'),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Text(
                'P R E V I O U S   D A T A',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Constants.scaffoldBG,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    shadows: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Constants.buttonColor,
                        offset: const Offset(-2, 2),
                      ),
                    ]),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: _transactionList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    dynamic transactionDataList = snapshot.data;

                    return ListView.builder(
                      itemCount: transactionDataList.length,
                      itemBuilder: (context, index) {
                        int saniye = transactionDataList[index].uptime;
                        int gun = (saniye / 86400).floor();
                        saniye = saniye - (gun * 86400);
                        int saat = (saniye / 3600).floor();
                        saniye = saniye - (saat * 3600);
                        int dakika = (saniye / 60).floor();
                        saniye = saniye - (dakika * 60);

                        var totalRamOS =
                            transactionDataList[index].memory.total;
                        var totalRamKB = totalRamOS / 1024;
                        var totalRamMB = totalRamKB / 1024;
                        var totalRamGB = totalRamMB / 1024;

                        var bostakiRamOS =
                            transactionDataList[index].memory.free;
                        var bostakiRamKB = bostakiRamOS / 1024;
                        var bostakiRamMB = bostakiRamKB / 1024;
                        var bostakiRamGB = bostakiRamMB / 1024;

                        var kullanilanRamKB = (totalRamKB - bostakiRamKB);
                        var kullanilanRamMB = kullanilanRamKB / 1024;
                        var kullanilanRamGB = kullanilanRamMB / 1024;
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Card(
                            color: Constants.expansionTile,
                            child: ExpansionTile(
                              // ignore: prefer_const_constructors
                              trailing: Icon(
                                Icons.keyboard_double_arrow_down_outlined,
                                color: Colors.greenAccent,
                              ),
                              leading: CircleAvatar(
                                radius: 26,
                                backgroundColor: Colors.greenAccent,
                                child: CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.purple,
                                  child: Text(
                                    '${index + 1}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              title: Text(
                                transactionDataList[index].createdAt,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent.shade700),
                              ),
                              subtitle: Text(
                                '$gun D $saat Hr $dakika Min $saniye Sec',
                                style: TextStyle(
                                    fontSize: 14, color: Constants.scaffoldBG),
                              ),
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          color: Constants.darkBlue,
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Text(
                                            'CPU INFO',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            'User Usage: %${transactionDataList[index].cpuS.user}',
                                            style: TextStyle(
                                                color: Constants.scaffoldBG),
                                          ),
                                          Text(
                                              'Nice Usage: %${transactionDataList[index].cpuS.nice}',
                                              style: TextStyle(
                                                  color: Constants.scaffoldBG)),
                                          Text(
                                              'System Usage: %${transactionDataList[index].cpuS.system}',
                                              style: TextStyle(
                                                  color: Constants.scaffoldBG)),
                                          Text(
                                              'Idle Usage: %${transactionDataList[index].cpuS.idle}',
                                              style: TextStyle(
                                                  color: Constants.scaffoldBG)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          color: Constants.darkBlue,
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Text(
                                            'RAM INFO',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                              'Total Ram: ${totalRamMB.toStringAsFixed(0)} MB',
                                              style: TextStyle(
                                                  color: Constants.scaffoldBG)),
                                          Text(
                                              'Used Ram: ${kullanilanRamMB.toStringAsFixed(0)} MB',
                                              style: TextStyle(
                                                  color: Constants.scaffoldBG)),
                                          Text(
                                              'Free Ram: ${bostakiRamMB.toStringAsFixed(0)} MB',
                                              style: TextStyle(
                                                  color: Constants.scaffoldBG)),
                                          Text(
                                              'Usage Ram: %${transactionDataList[index].memory.usage}',
                                              style: TextStyle(
                                                  color: Constants.scaffoldBG)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  width: 300,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade800,
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text(
                                        'LOAD BALANCE',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Text(
                                          'Per a minute: %${transactionDataList[index].loadavg.m1} Average',
                                          style: TextStyle(
                                              color: Constants.scaffoldBG)),
                                      Text(
                                          'Per 5 minutes: %${transactionDataList[index].loadavg.m5} Average',
                                          style: TextStyle(
                                              color: Constants.scaffoldBG)),
                                      Text(
                                          'Per 15 minutes: %${transactionDataList[index].loadavg.m15} Average',
                                          style: TextStyle(
                                              color: Constants.scaffoldBG)),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20)
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        'HATA MEYDANA GELDİ',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  } else {
                    return Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 1,
                      color: Constants.buttonColor,
                    ));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
