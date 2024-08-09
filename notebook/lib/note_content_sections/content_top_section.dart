import 'package:flutter/material.dart';

class ContentTopSection extends StatelessWidget {
  final void Function() exit;
  final void Function() deleteNote;


  const ContentTopSection({
    super.key,
    required this.exit,
    required this.deleteNote,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: exit,
            splashColor: Colors.black12,
            child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(19, 0, 0, 0),
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 18),
                child: const Row(
                  children: <Widget>[
                    Icon(Icons.keyboard_backspace),
                  ],
                )),
          ),
          InkWell(
            onTap: deleteNote,
            borderRadius: BorderRadius.circular(7),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(71, 255, 185, 144),
                borderRadius: BorderRadius.circular(10)
              ),
              padding: const EdgeInsets.all(7),
              child: const Icon(
                Icons.delete, 
                color: Color.fromARGB(255, 255, 17, 1), 
                size: 23,),
            ),
          )
        ],
      ),
    );
  }
}
