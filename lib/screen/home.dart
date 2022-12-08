import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/screen/about_screen.dart';
import 'package:healthcheck_tx_api/screen/cpu_screen.dart';
import 'package:healthcheck_tx_api/screen/device_screen.dart';
import 'package:healthcheck_tx_api/screen/history_screen.dart';
import 'package:healthcheck_tx_api/screen/ram_screen.dart';
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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Constants.darkBlue,
            expandedHeight: 250,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Constants.darkBlue,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    bottom: 60,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [textReq('Hostname: '), TextResHostname()],
                      ),
                      Row(
                        children: [
                          textReq('Platform: '),
                          const TextResPlatform()
                        ],
                      ), // sonuna cpu archı direkt $
                      //parametre olarak geç zaten 3 harf dönüyor x64 x32 vs
                      Row(
                        children: [textReq('Created At: '), textResCreatedAt()],
                      ),
                      Row(
                        children: [textReq('Updated At: '), TextResUpdatedAt()],
                      ),
                    ],
                  ),
                ),
              ),
              title: Text(
                "H E A L T H  C H E C K",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Constants.scaffoldBG, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
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
                                return const CpuScreen();
                              },
                            ),
                          );
                        },
                        child: const ItemWidget(
                          title: "CPU INFO",
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
                                return (const RamScreen());
                              },
                            ),
                          );
                        },
                        child: const ItemWidget(
                            title: 'RAM INFO', path: "assets/images/ram.jpg"),
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
                                return (const Devicescreen());
                              },
                            ),
                          );
                        },
                        child: const ItemWidget(
                            title: 'DEVICE INFO',
                            path: "assets/images/device.jpg"),
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
                  Row(
                    children: [
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
                            title: 'LOAD BALANCE',
                            path: "assets/images/cpu2.jpg"),
                      ),
                      const SizedBox(width: 25),
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
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
          const ButtonReq(),
        ],
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
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
                color: Constants.darkBlue,
                borderRadius: BorderRadius.circular(20)),
            child: Center(
                child: Text(
              "CHECK SYSTEM",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.white),
            ))),
      ),
    );
  }
}
