import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/utils/constants.dart';

class Devicescreen extends StatefulWidget {
  const Devicescreen({super.key});

  @override
  State<Devicescreen> createState() => _DevicescreenState();
}

class _DevicescreenState extends State<Devicescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DEVICE INFORMATIONS",
          style: TextStyle(color: Constants.scaffoldBG),
        ),
        centerTitle: true,
        elevation: 5,
      ),
    );
  }
}
