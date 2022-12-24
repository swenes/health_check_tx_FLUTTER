import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/screen/about_screen.dart';
import 'package:healthcheck_tx_api/screen/cpu_ram_screen.dart';
import 'package:healthcheck_tx_api/screen/device_screen.dart';
import 'package:healthcheck_tx_api/screen/history_screen.dart';
import 'package:healthcheck_tx_api/service/service.dart';
import 'package:healthcheck_tx_api/utils/constants.dart';
import 'package:healthcheck_tx_api/widgets/createdAt.dart';
import 'package:healthcheck_tx_api/widgets/platform_widget.dart';
import 'package:healthcheck_tx_api/widgets/hostname_widget.dart';
import 'package:healthcheck_tx_api/widgets/uptadetAt.dart';

import '../widgets/itemWidget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Service service = Service();
    Service.getTransactionModel();
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Padding(
          padding: const EdgeInsets.only(top: 180.0, left: 10),
          child: Text(
            "H E A L T H   C H E C K",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Constants.scaffoldBG, fontWeight: FontWeight.bold),
          ),
        ),
        toolbarHeight: 230,
        backgroundColor: Constants.darkBlue,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            color: Constants.darkBlue,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                bottom: 60,
                left: 20,
                right: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [textReq('Hostname: '), const TextResHostname()],
                  ),
                  Row(
                    children: [textReq('Platform: '), const TextResPlatform()],
                  ), // sonuna cpu archı direkt $
                  //parametre olarak geç zaten 3 harf dönüyor x64 x32 vs
                  Row(
                    children: [textReq('Created At: '), TextResCreatedAt()],
                  ),
                  Row(
                    children: [textReq('Updated At: '), TextResUpdatedAt()],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const CpuRamScreen();
                        },
                      ),
                    );
                  },
                  child: const ItemWidget(
                    title: "RAM-CPU INFO",
                    path: "assets/images/cpu.jpg",
                  ),
                ),
                const SizedBox(width: 25),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return (const Devicescreen());
                        },
                      ),
                    );
                  },
                  child: const ItemWidget(
                      title: 'LOAD BALANCE', path: "assets/images/cpu2.jpg"),
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return (const AboutAs());
                        },
                      ),
                    );
                  },
                  child: const ItemWidget(
                      title: 'ABOUT AS', path: "assets/images/soru.jpg"),
                ),
                const SizedBox(width: 25),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return (const HistoryScreen());
                        },
                      ),
                    );
                  },
                  child: const ItemWidget(
                      title: 'HISTORY USAGE',
                      path: "assets/images/history.png"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const ButtonReq()
          ],
        ),
      ),
    );
  }

  Text textReq(String info) {
    return Text(
      info,
      style:
          TextStyle(color: Colors.teal.shade100, fontWeight: FontWeight.bold),
    );
  }
}

class ButtonReq extends StatelessWidget {
  const ButtonReq({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Constants.darkBlue,
      shape: const StadiumBorder(),
      elevation: 5,
      minWidth: 300,
      height: 50,
      onPressed: () {},
      child: Text(
        "CHECK SYSTEM",
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(color: Colors.white),
      ),
    );

    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
    //   child: Container(
    //       height: 50,
    //       width: 250,
    //       decoration: BoxDecoration(
    //           color: Constants.darkBlue,
    //           borderRadius: BorderRadius.circular(20)),
    //       child: Center(
    //     child: Text(
    //   "CHECK SYSTEM",
    //   style: Theme.of(context)
    //       .textTheme
    //       .headline6
    //       ?.copyWith(color: Colors.white),
    // ))),
    // );
  }
}
