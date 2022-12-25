import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/service/service.dart';
import 'package:healthcheck_tx_api/utils/constants.dart';

import '../model/transaction_model.dart';
import '../widgets/restartButton.dart';

class CpuScreen extends StatefulWidget {
  const CpuScreen({super.key});

  @override
  State<CpuScreen> createState() => _CpuScreenState();
}

final Future<TransactionModel> transaction = Service.getTransactionModel();
bool isExpansionOpen = false;

class _CpuScreenState extends State<CpuScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TransactionModel>(
      future: transaction,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          dynamic transactionData = snapshot.data;

          String user = transactionData.cpuS.user;
          String nice = transactionData.cpuS.nice;
          String system = transactionData.cpuS.system;
          String idle = transactionData.cpuS.idle;

          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.jpg'),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    color: Constants.expansionTile,
                    elevation: 3,
                    child: ExpansionTile(
                      onExpansionChanged: (value) {
                        isExpansionOpen = value;
                        setState(() {});
                      },
                      iconColor: Colors.white,
                      title: Text(
                        'CPU USAGE',
                        textAlign: TextAlign.center,
                        style: Constants.titleStyle
                            .copyWith(color: Colors.white, fontSize: 20),
                      ),
                      leading: const Icon(
                        Icons.add_chart_sharp,
                        color: Colors.tealAccent,
                      ),
                      trailing: const Icon(
                        Icons.keyboard_double_arrow_down_outlined,
                        color: Colors.tealAccent,
                      ),
                      childrenPadding:
                          const EdgeInsets.only(top: 10, bottom: 15),
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Intel(R) Core(TM) i5-7200U CPU @ 2,50GHz',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Idle Usage: %$idle',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Constants.scaffoldBG,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'User Usage: %$user',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Constants.scaffoldBG,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'System Usage :% $system',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Constants.scaffoldBG,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Nice Usage: %$nice',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Constants.scaffoldBG,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  isExpansionOpen
                      ? SizedBox(
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'LOAD BALANCE',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                  'Per a minute: %${transactionData.loadavg.m1} Average',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Constants.scaffoldBG)),
                              Text(
                                  'Per 5 minutes: %${transactionData.loadavg.m5} Average',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Constants.scaffoldBG)),
                              Text(
                                  'Per 15 minutes: %${transactionData.loadavg.m15} Average',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Constants.scaffoldBG)),
                            ],
                          ),
                        )
                      : Text(
                          'Intel(R) Core(TM) i5-7200U CPU @ 2,50GHz',
                          style: Theme.of(context).textTheme.overline!.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                        ),
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: DChartPie(
                      data: [
                        const {
                          'domain': 'User',
                          'measure': 50
                        }, // 50 yi double.parce(user) ile değiştir
                        {'domain': 'Nice', 'measure': double.parse(nice)},
                        {'domain': 'System', 'measure': double.parse(system)},
                        {'domain': 'Idle', 'measure': double.parse(idle)},
                      ],
                      fillColor: (pieData, index) {
                        switch (pieData['domain']) {
                          case 'User':
                            return Colors.green;
                          case 'Nice':
                            return Colors.black;
                          case 'System':
                            return Colors.amber;
                          case 'Idle':
                            return Colors.deepPurpleAccent;
                          default:
                            return Colors.red;
                        }
                      },
                      donutWidth: 25,
                      animate: true,
                      animationDuration: const Duration(seconds: 1),
                      labelPosition: PieLabelPosition.outside,
                      labelFontSize: 15,
                      showLabelLine: true,
                      strokeWidth: 5,
                      labelLinelength: 20,
                      labelLineColor: Colors.white,
                      labelColor: Colors.white,
                      pieLabel: (Map<dynamic, dynamic> pieData, int? index) {
                        return '${pieData['domain']}\n%${pieData['measure']}';
                      },
                    ),
                  ),
                  isExpansionOpen
                      ? const SizedBox.shrink()
                      : RestartButton(
                          onTap: () {
                            setState(() {});
                          },
                        )
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Text('Hata var');
        } else {
          return Center(
              child: CircularProgressIndicator(
            color: Constants.buttonColor,
            strokeWidth: 1,
          ));
        }
      },
    );
  }
}
