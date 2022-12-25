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
                      // initiallyExpanded: true,
                      title: Text(
                        'CPU USAGE',
                        textAlign: TextAlign.center,
                        style: Constants.titleStyle.copyWith(fontSize: 20),
                      ),
                      leading: Icon(
                        Icons.add_chart_sharp,
                        color: Constants.darkBlue,
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
                              'Idle: %$idle',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Constants.scaffoldBG,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'User: %$user',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Constants.scaffoldBG,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'System :% $system',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Constants.scaffoldBG,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Nice: %$nice',
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
                      ? const SizedBox.shrink()
                      : Text(
                          'Intel(R) Core(TM) i5-7200U CPU @ 2,50GHz',
                          style: Theme.of(context).textTheme.overline!.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                        ),
                  AspectRatio(
                    aspectRatio: 12 / 9,
                    child: DChartPie(
                      data: [
                        {'domain': 'User', 'measure': double.parse(user)},
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
                      donutWidth: 45,
                      animate: true,
                      animationDuration: const Duration(seconds: 1),
                      labelPosition: PieLabelPosition.outside,
                      labelFontSize: 17,
                      showLabelLine: true,
                      strokeWidth: 5,
                      labelLinelength: 25,
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
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
