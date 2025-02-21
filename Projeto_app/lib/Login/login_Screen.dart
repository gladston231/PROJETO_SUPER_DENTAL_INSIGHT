import 'package:flutter/material.dart';

import '../Provider/rest.dart';
import '../Views/views_Screen.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bem-vindo ao Dental Insight App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Nome de usuário',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TelaInicial()),
                      );
                      
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaCadastro()),
                );
              },
              child: const Text('Cadastre-se'),
            ),
          ],
        ),
      ),
    );
  }
  
}
class TelaCadastro extends StatelessWidget {
  const TelaCadastro({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Cadastro',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              const TextField(decoration: InputDecoration(labelText: 'Nome Completo', border: OutlineInputBorder())),
              const SizedBox(height: 10),
              const TextField(decoration: InputDecoration(labelText: 'CPF', border: OutlineInputBorder())),
              const SizedBox(height: 10),
              const TextField(decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder())),
              const SizedBox(height: 10),
              const TextField(decoration: InputDecoration(labelText: 'Telefone', border: OutlineInputBorder())),
              const SizedBox(height: 10),
              const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Senha', border: OutlineInputBorder())),
              const SizedBox(height: 10),
              const TextField(decoration: InputDecoration(labelText: 'Data de Nascimento', border: OutlineInputBorder())),
              const SizedBox(height: 10),
              const TextField(decoration: InputDecoration(labelText: 'Gênero', border: OutlineInputBorder())),
              const SizedBox(height: 10),
              const TextField(decoration: InputDecoration(labelText: 'Titulação Acadêmica (se profissional)', border: OutlineInputBorder())),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                },
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

