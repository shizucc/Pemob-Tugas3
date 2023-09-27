import 'package:flutter/material.dart';
import 'package:pemob_t3/component/sidemenu.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideMenu(),
        appBar: AppBar(
          title: Text("About"),
        ),
        body: Center(
          child: Text("Ini adalah halaman about"),
        ));
  }
}
