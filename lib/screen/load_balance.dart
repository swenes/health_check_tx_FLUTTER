import 'package:flutter/material.dart';

import '../utils/constants.dart';

class LoadBalanceScreen extends StatelessWidget {
  const LoadBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Load Balance', style: TextStyle(color: Constants.scaffoldBG)),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/background.jpg'),
          ),
        ),
      ),
    );
  }
}
