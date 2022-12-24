import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/model/transaction_model.dart';
import 'package:healthcheck_tx_api/service/service.dart';

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
    return getMemoryInfos();
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
              var forDataYuzdeKullanilan = int.parse(yuzdeKullanilan);
              var forDataYuzdeBos = int.parse(yuzdeBos);

              final data = [
                {'isim': 'free', 'sonuc': forDataYuzdeBos},
                {'isim': 'used', 'sonuc': forDataYuzdeKullanilan},
              ];
              return Column(
                children: [
                  const SizedBox(height: 30),
                  Text(
                    'Kullanılan Ram: ${kullanilanRamMB.toStringAsFixed(0)} MB',
                    style: Constants.titleStyle,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Boşta olan Ram: ${bostakiRamMB.toStringAsFixed(0)} MB',
                    style: Constants.titleStyle,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Toplam Ram: ${totalRamMB.toStringAsFixed(0)} MB',
                    style: Constants.titleStyle,
                  ),
                  const SizedBox(height: 40),
                  AspectRadio(data: data),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: restartButton(),
                  )
                ],
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Container restartButton() {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Constants.darkBlue, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tap to Restart',
            style: Constants.titleStyle.copyWith(color: Constants.scaffoldBG),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: Icon(
                  Icons.replay_outlined,
                  size: 45,
                  color: Constants.scaffoldBG,
                )),
          ),
        ],
      ),
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
            case 'free':
              return Colors.green.shade700;
            case 'used':
              return Colors.red;

            default:
              return Colors.blue;
          }
        },
        labelColor: Colors.black,
        labelPosition: PieLabelPosition.inside,
        labelFontSize: 15,
        labelLineColor: Colors.black,
        labelLineThickness: 2,
        labelLinelength: 16,
        labelPadding: 2,
        pieLabel: (Map<dynamic, dynamic> pieData, int? index) {
          return '%${pieData['measure']}';
        },
        animate: true,
        animationDuration: const Duration(seconds: 1),
        donutWidth: 150,
      ),
    );
  }
}
