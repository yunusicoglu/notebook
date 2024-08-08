// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:notebook/note_content_sections/content_note_section.dart';
import 'package:notebook/note_content_sections/content_title.dart';
import 'package:notebook/note_content_sections/content_top_section.dart';
import './../services/firebase_services.dart';

class NoteContentScreen extends StatefulWidget {
  final String noteId;
  final String noteTitle;
  final String noteContent;
  final Function(String id, String title, String content) updateNotes;

  const NoteContentScreen({
    super.key,
    required this.noteId,
    required this.noteTitle,
    required this.noteContent,
    required this.updateNotes,
  });

  @override
  State<NoteContentScreen> createState() => _NoteContentState();
}

class _NoteContentState extends State<NoteContentScreen> {
  String _title = '';
  String _content = '';

  @override
  void initState() {
    super.initState();
    _title = widget.noteTitle;
    _content = widget.noteContent;
  }

  void _exit() async {
    Navigator.pop(context);
  }

  void _updateNote() async {
    FirebaseServices firebaseServices = FirebaseServices();
    await firebaseServices.updateNote(widget.noteId, _title, _content);

    //Home Screen'deki not listesinin güncellenmesi için bu notun bilgilerini gönderiyorum.
    widget.updateNotes(widget.noteId, _title, _content);
  }

  void onTitleChange(String title) {
    setState(() {
      _title = title;
    });
  }

  void onContentChange(String content) {
    setState(() {
      _content = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Column(
        children: <Widget>[
          ContentTopSection(
            exit: _exit,
          ),
          const SizedBox(height: 10),
          ContentTitle(
              onTitleChange: onTitleChange,
              title: _title,
              updateNote: _updateNote),
          ContentNoteSection(
              onContentChange: onContentChange,
              content: _content,
              updateNote: _updateNote),
        ],
      ),
    );
  }
}
