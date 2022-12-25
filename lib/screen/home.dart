import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/screen/about_screen.dart';
import 'package:healthcheck_tx_api/screen/cpu_ram_screen.dart';
import 'package:healthcheck_tx_api/screen/history_screen.dart';
import 'package:healthcheck_tx_api/service/service.dart';
import 'package:healthcheck_tx_api/utils/constants.dart';
import 'package:healthcheck_tx_api/widgets/home_widgets/createdAt.dart';
import 'package:healthcheck_tx_api/widgets/home_widgets/platform_widget.dart';
import 'package:healthcheck_tx_api/widgets/home_widgets/hostname_widget.dart';
import 'package:healthcheck_tx_api/widgets/home_widgets/uptadetAt.dart';
import 'package:healthcheck_tx_api/widgets/home_widgets/uptime.dart';

import '../widgets/itemWidget.dart';
import 'dependencies_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Service.getTransactionModel();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 33,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/darkbackground.jpg'),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          textReq('Hostname: '),
                          const TextResHostname(),
                        ],
                      ),
                      Row(
                        children: [
                          textReq('Platform: '),
                          const TextResPlatform(),
                        ],
                      ), // sonuna cpu archı direkt $
                      //parametre olarak geç zaten 3 harf dönüyor x64 x32 vs
                      Row(
                        children: [
                          textReq('Created At: '),
                          const TextResCreatedAt()
                        ],
                      ),
                      Row(
                        children: [
                          textReq('Updated At: '),
                          const TextResUpdatedAt()
                        ],
                      ),
                      Row(
                        children: [textReq('Uptime: '), const TextResUptime()],
                      ),

                      Text(
                        "H E A L T H   C H E C K",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                color: Constants.scaffoldBG,
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                shadows: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Constants.buttonColor,
                                offset: const Offset(-3, 3),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 67,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/background.jpg'),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                            title: "Technical Info",
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
                                  return (DependenciesScreen());
                                },
                              ),
                            );
                          },
                          child: const ItemWidget(
                              title: 'Dependencies',
                              path: "assets/images/cpu2.jpg"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                              title: 'History usages',
                              path: "assets/images/history2.jpg"),
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
                            title: 'About Us',
                            path: "assets/images/about_us.jpg",
                          ),
                        ),
                      ],
                    ),
                    const ButtonReq()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Text textReq(String info) {
    return Text(
      info,
      style: TextStyle(
        color: Constants.textresreqColor,
        fontWeight: FontWeight.bold,
      ),
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
      color: Constants.buttonColor,
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
  }
}
