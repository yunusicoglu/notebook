import 'package:flutter/material.dart';
import 'package:notebook/home_sections/app_bar.dart';
import 'package:notebook/home_sections/note_cover.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: const AppBarWidget(),
      body: const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Divider(thickness: 1),
            SizedBox(height: 30),
            NoteCover(),
            SizedBox(height: 30),
            NoteCover(),
            SizedBox(height: 30),
            NoteCover(),

          ],
        )
      )
    );
  }
}



