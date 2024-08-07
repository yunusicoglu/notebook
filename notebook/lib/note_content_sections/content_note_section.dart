import 'package:flutter/material.dart';

class ContentNoteSection extends StatefulWidget {
  final void Function(String) updateContent;
  final String? content;
  final bool isNoteContentEditing;
  
  const ContentNoteSection(
      {super.key, required this.updateContent, required this.content, required this.isNoteContentEditing});

  @override
  State<ContentNoteSection> createState() => _ContentNoteSectionState();
}

class _ContentNoteSectionState extends State<ContentNoteSection> {
  late TextEditingController _controller;
  bool isNoteContentEditing = false;
  final FocusNode _focusNode = FocusNode();


  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.content);       
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        setState(() {
          isNoteContentEditing = true;
          _focusNode.requestFocus();
        });
      },
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: isNoteContentEditing
            ? SizedBox(
              height: screenHeight * 0.47,
              width: 100,
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                onSubmitted: (value) {
                  setState(() {
                    isNoteContentEditing = false;
                  });
                },
                maxLines: null,
                minLines: 20,
                onChanged: (content) {
                  widget.updateContent(content);
                },
                style: const TextStyle(
                  fontSize: 18, 
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none
                ),
              ),
            )
            : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 9),
              child: Text(
                  _controller.text.isNotEmpty ? _controller.text : 'Not Alanı',
                  style: _controller.text.isNotEmpty
                  ? const TextStyle(
                      fontSize: 18, 
                    )
                  : const TextStyle(
                      fontSize: 18,
                      color: Colors.black45
                  )
                ),
            ),
          )
        ],
      )
      // child: ListView(
      //  shrinkWrap: true,
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 20),
      //       child: Text(
      //           'Bu birinci satır.\nBu ikinci satır.\nBu üçüncü satır.'
      //         )
      //     )
      //   ],
      // ),




    );
  
  }
}
