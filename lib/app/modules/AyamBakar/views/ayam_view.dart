import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/modules/AyamBakar/widgets/ayam_widget.dart';


class AyamView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.orange),
        title: Text('Ayam Bakar', style: TextStyle(color: Colors.orange)),
      ),
      body: AyamWidget(),
    );
  }
}
