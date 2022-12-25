import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/screen/cpu_screen.dart';
import 'package:healthcheck_tx_api/screen/dependencies_screen.dart';
import 'package:healthcheck_tx_api/screen/ram_screen.dart';

import '../utils/constants.dart';

class CpuRamScreen extends StatefulWidget {
  const CpuRamScreen({super.key});

  @override
  State<CpuRamScreen> createState() => _CpuRamScreenState();
}

class _CpuRamScreenState extends State<CpuRamScreen> {
  int selectedIndex = 0;
  late List<Widget> sayfalar;
  late RamScreen ramScreen;
  late CpuScreen cpuScreen;

  @override
  void initState() {
    super.initState();
    ramScreen = const RamScreen();
    cpuScreen = const CpuScreen();
    sayfalar = [
      ramScreen,
      cpuScreen,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 218, 218, 218),
        currentIndex: selectedIndex,
        onTap: onSelectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Ram',
            icon: Icon(Icons.air_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Cpu',
            icon: Icon(Icons.add_chart_outlined),
          ),
        ],
      ),
      appBar: AppBar(
        title: appBarTitle(selectedIndex),
      ),
      body: sayfalar[selectedIndex],
    );
  }

  void onSelectedIndex(value) {
    setState(() {
      selectedIndex = value;
    });
  }

  Text appBarTitle(int index) {
    switch (index) {
      case 0:
        return Text('Memory Information',
            style: TextStyle(color: Constants.scaffoldBG));
      case 1:
        return Text('Cpu Information',
            style: TextStyle(color: Constants.scaffoldBG));

      default:
        return const Text('App Bar');
    }
  }
}
