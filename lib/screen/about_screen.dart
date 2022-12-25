import 'package:flutter/material.dart';
import 'package:healthcheck_tx_api/utils/constants.dart';

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
          'About Us',
          style: TextStyle(color: Constants.scaffoldBG),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/background.jpg'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'W h o  A r e  W e ?',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Constants.scaffoldBG,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  shadows: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Constants.buttonColor,
                      offset: const Offset(-4, 4),
                    ),
                  ]),
            ),
            const ExpansionWhoAreWe(
              adSoyad: 'Enes AYDOĞDU',
              meslek: 'Software Engineer',
              pozisyon: 'Flutter Developer',
              profilePath: 'assets/images/enes.PNG',
            ),
            const ExpansionWhoAreWe(
              adSoyad: 'Ali Buğra AKDOĞAN',
              meslek: 'Software Engineer',
              pozisyon: 'Blockchain Developer',
              profilePath: 'assets/images/ali.jpg',
            ),
            const ExpansionWhoAreWe(
              adSoyad: 'Gül Azize KAHRAMAN',
              meslek: 'Software Engineer',
              pozisyon: 'Test Specialist',
              profilePath: 'assets/images/gül.jpg',
            ),
          ],
        ),
      ),
    );
  }
}

class ExpansionWhoAreWe extends StatelessWidget {
  final String adSoyad;
  final String pozisyon;
  final String meslek;
  final String profilePath;
  const ExpansionWhoAreWe({
    Key? key,
    required this.adSoyad,
    required this.pozisyon,
    required this.meslek,
    required this.profilePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: const Color.fromARGB(115, 226, 174, 53),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.all(15),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(profilePath),
          ),
          title: Text(
            adSoyad,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Text(
            meslek,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pozisyon,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white70),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Student at Firat University',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white70),
                      ),
                      const SizedBox(height: 20)
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage:
                            AssetImage('assets/images/instagram.jpg'),
                      ),
                      SizedBox(width: 3),
                      CircleAvatar(
                        radius: 15,
                        backgroundImage:
                            AssetImage('assets/images/linkedin.jpg'),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
