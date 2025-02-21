import 'package:flutter/material.dart';

import '../Provider/rest.dart';
import '../main.dart';
import 'login_Screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}
String texto = '';

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
  'https://cdn.pixabay.com/photo/2013/07/13/11/28/dentist-158225_1280.png',
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              'Dental Insight App',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Desenvolvido pelo Projeto Super',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
                setState(() {
                 texto = pegarUsuarios().toString();
                });
              },
              child:  Text(texto),
            ),
          ],
        ),
      ),
    );
  }
  }

