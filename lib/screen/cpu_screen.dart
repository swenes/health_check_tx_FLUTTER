import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/service/service.dart';
import 'package:healthcheck_tx_api/utils/constants.dart';

import '../model/transaction_model.dart';

class CpuScreen extends StatefulWidget {
  const CpuScreen({super.key});

  @override
  State<CpuScreen> createState() => _CpuScreenState();
}

final Future<List<TransactionModel>> _transactionList =
    Service.getTransactionList();

class _CpuScreenState extends State<CpuScreen> {
  @override
  void initState() {
    super.initState();
  }

  getCpuList() async {}

  @override
  Widget build(BuildContext context) {
    getCpuList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CPU INFORMATIONS",
          style: Constants.titleStyle.copyWith(color: Constants.scaffoldBG),
        ),
        centerTitle: true,
        elevation: 5,
      ),
      body: FutureBuilder<List<TransactionModel>>(
        future: _transactionList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var transactionList = snapshot.data!;
            List<Cpu> cpuList = transactionList[0].cpuS.toList();

            return ListView.builder(
              itemCount: cpuList.length,
              itemBuilder: (context, index) {
                var model = cpuList[index].model;
                var speed = cpuList[index].speed;
                var timeUser = cpuList[index].times.user;
                var timeNice = cpuList[index].times.nice;
                var timeSys = cpuList[index].times.sys;
                var timeIdle = cpuList[index].times.idle;
                var timeIrd = cpuList[index].times.irq;

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      Card(
                          shadowColor: Constants.darkRed,
                          color: Colors.white,
                          elevation: 3,
                          child: ExpansionTile(
                            title: Text(model, style: Constants.normalStyle),
                            subtitle: Text(speed.toString(),
                                style: Constants.normalStyle.copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16)),
                            leading: const Icon((Icons.add_chart_outlined)),
                            trailing: const Icon(Icons.arrow_downward_outlined),
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, bottom: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(70, 188, 96, 162),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  height: 200,
                                  width: 340,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'About Times',
                                          style: Constants.normalStyle
                                              .copyWith(fontSize: 20),
                                        ),
                                        Text(
                                          'CPU User: $timeUser',
                                          style: Constants.normalStyle,
                                        ),
                                        Text('CPU Nice: $timeNice',
                                            style: Constants.normalStyle),
                                        Text('CPU Sys: $timeSys',
                                            style: Constants.normalStyle),
                                        Text('CPU Idle: $timeIdle',
                                            style: Constants.normalStyle),
                                        Text('CPU Ird: $timeIrd',
                                            style: Constants.normalStyle),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Text('Hata var');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  ExpansionTile buildExpansionTile(List<Cpu> cpuList, int index) {
    return ExpansionTile(
      title: Text(cpuList[index].model),
      subtitle: Text(cpuList[index].speed.toString()),
      leading: const Icon((Icons.add_chart_outlined)),
      trailing: const Icon(Icons.arrow_downward_outlined),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(70, 188, 96, 162),
              borderRadius: BorderRadius.circular(15),
            ),
            height: 200,
            width: 340,
          ),
        )
      ],
    );
  }
}
