import 'package:flutter/material.dart';
import 'package:notebook/screens/note_content_screen.dart';

class NoteCover extends StatelessWidget {
  const NoteCover({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: InkWell(
        onTap: () => goToNoteContentScreen(context),
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.transparent,
        highlightColor: const Color.fromARGB(54, 0, 0, 0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(164, 255, 255, 255)
          ),
          child: Row(
            children: <Widget>[
              const SizedBox(width: 12,),
              Image.asset(
                'assets/icons/note_cover5.png',
                height: 32  ,
                
              ),
              const VerticalDivider(
                color: Colors.black12,
                thickness: 1,
              ),
              const SizedBox(width: 10,),
              const Text(
                'Not Başlığı',
                style: TextStyle(
                  fontSize: 25,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }



  //The method that works when the note cover is clicked
  void goToNoteContentScreen(BuildContext context) {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => const NoteContentScreen()
      ));
  }
}