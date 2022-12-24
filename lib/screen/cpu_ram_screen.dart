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
    ramScreen = RamScreen();
    cpuScreen = CpuScreen();
    sayfalar = [ramScreen, cpuScreen];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onSelectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'ram',
            icon: Icon(Icons.abc),
          ),
          BottomNavigationBarItem(
            label: 'cpu',
            icon: Icon(Icons.abc),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(
          selectedIndex == 0 ? "MEMORY INFORMATION" : "CPU INFORMATİON",
          style: Constants.titleStyle.copyWith(
              color: Constants.scaffoldBG, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 5,
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
