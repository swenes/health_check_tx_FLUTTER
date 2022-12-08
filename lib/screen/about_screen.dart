import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AboutAs extends StatefulWidget {
  const AboutAs({super.key});

  @override
  State<AboutAs> createState() => _AboutAsState();
}

class _AboutAsState extends State<AboutAs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ABOUT AS",
          style: TextStyle(
            color: Constants.scaffoldBG,
          ),
        ),
        centerTitle: true,
        elevation: 5,
      ),
    );
  }
}
