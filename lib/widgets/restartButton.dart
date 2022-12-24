import 'package:flutter/material.dart';

import '../utils/constants.dart';

class RestartButton extends StatelessWidget {
  final Function() onTap;
  const RestartButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialButton(
      shape: const StadiumBorder(),
      color: Constants.darkBlue,
      minWidth: 250,
      height: 50,
      onPressed: onTap,
      // ignore: prefer_const_constructors
      child: Text(
        'Tap to Restart !',
        style: const TextStyle(color: Colors.white, fontSize: 19),
      ),
    );
  }
}
