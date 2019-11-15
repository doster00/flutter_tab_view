import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tab_view/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inicio")),
      drawer: AppDrawer(),
      body: Container(
        child: Text("Página inicial"),
      ),
    );
  }
}
