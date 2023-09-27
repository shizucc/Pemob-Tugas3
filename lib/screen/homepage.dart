import 'package:flutter/material.dart';
import 'package:pemob_t3/component/sidemenu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideMenu(),
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Center(
          child: Text("Ini adalah halaman Home"),
        ));
  }
}
