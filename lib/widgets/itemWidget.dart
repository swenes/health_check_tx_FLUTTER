// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    required this.title,
    required this.path,
  }) : super(key: key);

  final String title;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white24),
        width: 150,
        height: 180,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.cyan.shade200),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 150,
              width: 130,
              child: CircleAvatar(
                backgroundImage: AssetImage(path),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
