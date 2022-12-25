import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/model/transaction_model.dart';
import 'package:healthcheck_tx_api/service/service.dart';
import 'package:healthcheck_tx_api/widgets/restartButton.dart';

import '../utils/constants.dart';

class RamScreen extends StatefulWidget {
  const RamScreen({super.key});
  @override
  State<RamScreen> createState() => _RamScreenState();
}

double kullanilanOS = 0;
double kullanilanRamKB = 0;
double kullanilanRamMB = 0;
double kullanilanRamGB = 0;

int bostakiRamOS = 0;
double bostakiRamKB = 0;
double bostakiRamMB = 0;
double bostakiRamGB = 0;

int totalRamOS = 0;
double totalRamKB = 0;
double totalRamMB = 0;
double totalRamGB = 0;

String yuzdeKullanilan = '';
String yuzdeBos = '';
double tempYuzdeKullanilan = 0; // tip dönüşümü için kullandım

// ignore: unused_element

class _RamScreenState extends State<RamScreen> {
  final Future<TransactionModel> transaction = Service.getTransactionModel();

  int selectedIndex = 0;

  void onSelectedIndex(value) {
    setState(() {
      selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/background.jpg'),
        ),
      ),
      child: getMemoryInfos(),
    );
  }

  FutureBuilder<TransactionModel> getMemoryInfos() {
    return FutureBuilder<TransactionModel>(
      future: transaction,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              dynamic transactionData = snapshot.data;

              totalRamOS = transactionData.memory.total;
              totalRamKB = totalRamOS / 1024;
              totalRamMB = totalRamKB / 1024;
              totalRamGB = totalRamMB / 1024;

              bostakiRamOS = transactionData.memory.free;
              bostakiRamKB = bostakiRamOS / 1024;
              bostakiRamMB = bostakiRamKB / 1024;
              bostakiRamGB = bostakiRamMB / 1024;

              kullanilanRamKB = (totalRamKB - bostakiRamKB);
              kullanilanRamMB = kullanilanRamKB / 1024;
              kullanilanRamGB = kullanilanRamMB / 1024;

              tempYuzdeKullanilan = (100 * kullanilanRamMB) / totalRamMB;
              yuzdeKullanilan =
                  ((100 * kullanilanRamMB) / totalRamMB).toStringAsFixed(0);
              yuzdeBos = (100 - tempYuzdeKullanilan).toStringAsFixed(0);

              final data = [
                {'isim': 'Free', 'sonuc': 20}, //forDataYuzdeBos
                {'isim': 'Used', 'sonuc': 80}, //forDataYuzdeKullanilan
              ];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 40),
                  Text(
                    'Used Memory: ${kullanilanRamMB.toStringAsFixed(0)} MB',
                    style: Constants.titleStyle,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Free Memory : ${bostakiRamMB.toStringAsFixed(0)} MB',
                    style: Constants.titleStyle,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Total Memory: ${totalRamMB.toStringAsFixed(0)} MB',
                    style: Constants.titleStyle,
                  ),
                  const SizedBox(height: 40),
                  AspectRadio(data: data),
                  const SizedBox(height: 38),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: RestartButton(
                      onTap: () {
                        setState(() {});
                      },
                    ),
                  )
                ],
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return Center(
              child: CircularProgressIndicator(
            color: Constants.buttonColor,
          ));
        }
      },
    );
  }
}

class AspectRadio extends StatelessWidget {
  const AspectRadio({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Map<String, Object>> data;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 12 / 9,
      child: DChartPie(
        data: data.map((e) {
          return {'domain': e['isim'], 'measure': e['sonuc']};
        }).toList(),
        fillColor: (pieData, index) {
          switch (pieData['domain']) {
            case 'Free':
              return Colors.green.shade700;
            case 'Used':
              return Colors.red;

            default:
              return Colors.blue;
          }
        },
        labelPosition: PieLabelPosition.outside,
        labelFontSize: 17,
        showLabelLine: true,
        strokeWidth: 5,
        labelLinelength: 25,
        labelLineColor: Colors.white,
        labelColor: Colors.white,
        pieLabel: (Map<dynamic, dynamic> pieData, int? index) {
          return '%${pieData['measure']}\n${pieData['domain']}';
        },
        animate: true,
        animationDuration: const Duration(seconds: 1),
        donutWidth: 45,
      ),
    );
  }
}
