import 'package:flutter/material.dart';
import 'package:notebook/services/firebase_services.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Function(String id, String title, String content) addNote;
  const AppBarWidget({
    super.key,
    required this.addNote,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey[50],
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      titleSpacing: 32,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Notlarım',
            style: TextStyle(fontSize: 35),
          ),
          InkWell(
            onTap: () => addNoteAndSendToHomeScreen(addNote),
            highlightColor: Colors.black26,
            borderRadius: BorderRadius.circular(10),
            child: const Icon(
              Icons.add,
              size: 45,
              color: Color.fromARGB(221, 61, 61, 61),
            ),
          )
        ],
      ),
      toolbarHeight: 80,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}

void addNoteAndSendToHomeScreen(
    Function(String id, String title, String content) addNote) async {
  FirebaseServices firebaseServices = FirebaseServices();
  Map<String, dynamic>? newNote = await firebaseServices.addNote();

//yeni notu HomeScreen'e aktarir
  if (newNote != null && newNote['id'].isNotEmpty) {
    addNote(newNote['id'], newNote['title'], newNote['content']);
  }
}
