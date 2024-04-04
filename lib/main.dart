import 'package:flutter/material.dart';
import 'package:webtonicui/pages/auth/login.dart';

void main(){
  runApp(const WebtonicUI());
}

class WebtonicUI extends StatelessWidget {
  const WebtonicUI({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Webtonics UI Library",
      // theme: ThemeData.dark(
      //   useMaterial3: true
      // ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Webtonics UI Library"),),
      body: const Login(),
      //auth pages
      //components pages
     
    );
  }
}