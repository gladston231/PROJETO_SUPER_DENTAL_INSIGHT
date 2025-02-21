import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../Login/login_Screen.dart';

class ViewsScreen extends StatefulWidget {
  const ViewsScreen({super.key});

  @override
  State<ViewsScreen> createState() => _ViewsScreenState();
}

class _ViewsScreenState extends State<ViewsScreen> {
  @override
  Widget build(BuildContext context) {
    return const TelaInicial();
  }
}


//views
class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dental Insight - Meus Dados', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nome: Gladston Gabriel'),
                  Text('Idade: 19 anos'),
                  Text('Exames realizados: 0'),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(onPressed: () {}, child: const Text('Minhas Informações', style: TextStyle(color: Colors.white))),
                
                TextButton(onPressed: () { Navigator.push( context, MaterialPageRoute(builder: (context) => const TelaExames()),);}, child: const Text('Exames', style: TextStyle(color: Colors.white))),
                
                TextButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=> const TelaInfo()),);}, child: const Text('Info', style: TextStyle(color: Colors.white))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TelaExames extends StatefulWidget {
  const TelaExames({super.key});

  @override
  State<TelaExames> createState() => _TelaExamesState();
}

class _TelaExamesState extends State<TelaExames> {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;
  bool isCameraOpen = false;

  @override
  void initState() {
    super.initState();
    _setupCameraController();
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  Future<void> _setupCameraController() async {
    try {
      cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        cameraController =
            CameraController(cameras.first, ResolutionPreset.high);
        await cameraController!.initialize();
        setState(() {});
      }
    } catch (e) {
      print("Erro ao iniciar a câmera: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dental Insight - Meus Exames',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const TelaInicial()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: isCameraOpen
                  ? _buildCameraPreview()
                  : const Text('Seus exames realizados constam aqui.'),
            ),
          ),
          Container(
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.add_a_photo, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      isCameraOpen = !isCameraOpen;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCameraPreview() {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.8,
          child: CameraPreview(cameraController!),
        ),
        IconButton(
          onPressed: () async {
            try {
              XFile picture = await cameraController!.takePicture();
              print("Imagem salva em: ${picture.path}");
              setState(() {
                isCameraOpen = false;
              });
            } catch (e) {
              print("Erro ao capturar imagem: $e");
            }
          },
          icon: const Icon(Icons.camera, color: Colors.blue),
        ),
      ],
    );
  }
}

class TelaInfo extends StatelessWidget {
  const TelaInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dental Insight - Informações', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const TelaInicial()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Aqui constam informações do produto e da equipe.'),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(onPressed: () {}, child: const Text('Minhas Informações', style: TextStyle(color: Colors.white))),
                TextButton(onPressed: () {}, child: const Text('Exames', style: TextStyle(color: Colors.white))),
                TextButton(onPressed: () {}, child: const Text('Info', style: TextStyle(color: Colors.white))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


