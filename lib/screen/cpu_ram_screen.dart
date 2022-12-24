import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/screen/cpu_screen.dart';
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
    sayfalar = [ramScreen, cpuScreen];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
        title: Text(
          selectedIndex == 0 ? "Memory Information" : "Cpu Information",
          style: Constants.titleStyle.copyWith(
              color: Constants.scaffoldBG, fontWeight: FontWeight.w500),
        ),
      ),
      body: sayfalar[selectedIndex],
    );
  }

  void onSelectedIndex(value) {
    setState(() {
      selectedIndex = value;
    });
  }
}
