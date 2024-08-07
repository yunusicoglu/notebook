import 'package:flutter/material.dart';

class ContentNoteSection extends StatefulWidget {
  final void Function(String) updateContent;
  final String? content;
  const ContentNoteSection(
      {super.key, required this.updateContent, required this.content});

  @override
  State<ContentNoteSection> createState() => _ContentNoteSectionState();
}

class _ContentNoteSectionState extends State<ContentNoteSection> {
  late TextEditingController _contentcontroller;
  bool _isEditing = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _contentcontroller = TextEditingController(text: widget.content);
  }

  @override
  void dispose() {
    _contentcontroller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isEditing = true;
          _focusNode.requestFocus();
        });
      },
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _isEditing
              ? FocusScope(
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      if (!hasFocus) {
                        setState(() {
                          _isEditing = false;
                        });
                      }
                    },
                    child: TextField(
                      controller: _contentcontroller,
                      focusNode: _focusNode,
                      maxLines: null,
                      expands: true,
                      onTap: () {
                        setState(() {
                          _isEditing = true;
                        });
                      },
                      onSubmitted: (value) {
                        setState(() {
                          _isEditing = false;
                        });
                      },
                      onChanged: (content) {
                        widget.updateContent(content);
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Notunuzu girin',
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 9),
                  child: Text(
                    _contentcontroller.text.isNotEmpty
                        ? _contentcontroller.text
                        : 'Not içeriği',
                    style: _contentcontroller.text.isNotEmpty
                        ? const TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                          )
                        : const TextStyle(
                            fontSize: 18,
                            color: Colors.black45,
                          ),
                  ),
                ),
        ),
      ),
    );
  }
}
