import 'package:flutter/material.dart';
import 'package:notebook/screens/note_content_screen.dart';

class NoteCover extends StatelessWidget {
  final String noteId;
  final String noteTitle;
  final String noteContent;
  final Function(String id, String title, String content) updateNotes;
  final Function(String id) deleteNote;

  const NoteCover({
    super.key,
    required this.noteId,
    required this.noteTitle,
    required this.noteContent,
    required this.updateNotes,
    required this.deleteNote,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: InkWell(
        onTap: () => goToNoteContentScreen(
            context, noteId, noteTitle, noteContent, updateNotes, deleteNote),
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.transparent,
        highlightColor: const Color.fromARGB(54, 0, 0, 0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(164, 255, 255, 255)),
          child: Row(
            children: <Widget>[
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                'assets/icons/note_cover5.png',
                height: 32,
              ),
              const VerticalDivider(
                color: Colors.black12,
                thickness: 1,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                noteTitle.isNotEmpty ? noteTitle : '(Başlıksız)',
                style: const TextStyle(
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
  void goToNoteContentScreen(
      BuildContext context,
      String noteId,
      String noteTitle,
      String noteContent,
      Function(String id, String title, String content) updateNotes,
      Function(String id) deleteNote) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NoteContentScreen(
                noteId: noteId,
                noteTitle: noteTitle,
                noteContent: noteContent,
                updateNotes: updateNotes,
                deleteNote: deleteNote
                )));
  }
}
