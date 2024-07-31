import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey[50],
      titleSpacing: 32,
      title: Row(
        children: [
          const Text(
            'Notlarım',
            style: TextStyle(fontSize: 35),),
          const SizedBox(width: 15),
          Image.asset(
            'assets/icons/note_icon.png',
            height: 32,
          ),
        ],
      ),
      toolbarHeight: 80,
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}

