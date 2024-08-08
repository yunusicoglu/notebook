import 'package:flutter/material.dart';

class ContentNoteSection extends StatefulWidget {
  final void Function(String) onContentChange;
  final String? content;
  final void Function() updateNote;

  const ContentNoteSection({
    super.key,
    required this.onContentChange,
    required this.content,
    required this.updateNote,
  });

  @override
  State<ContentNoteSection> createState() => _ContentNoteSectionState();
}

class _ContentNoteSectionState extends State<ContentNoteSection> {
  late TextEditingController _controller;
  late bool _isNoteContentEditing = false;
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
    return Expanded(
      child: GestureDetector(
          onTap: () {
            setState(() {
              _isNoteContentEditing = true;
              _focusNode.requestFocus();
            });
          },
          child: Stack(children: <Widget>[
            ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _isNoteContentEditing
                      ? SizedBox(
                          height: screenHeight * 0.47,
                          width: 100,
                          child: TextField(
                            controller: _controller,
                            focusNode: _focusNode,
                            onSubmitted: (value) {
                              setState(() {
                                _isNoteContentEditing = false;
                              });
                            },
                            maxLines: null,
                            onChanged: (content) {
                              widget.onContentChange(content);
                            },
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 9),
                          child: SizedBox(
                            height: screenHeight * 0.78,
                            width: 100,
                            child: Text(
                                _controller.text.isNotEmpty
                                    ? _controller.text
                                    : 'Not Alanı',
                                style: _controller.text.isNotEmpty
                                    ? const TextStyle(
                                        fontSize: 18,
                                      )
                                    : const TextStyle(
                                        fontSize: 18, color: Colors.black45)),
                          ),
                        ),
                )
              ],
            ),
            _isNoteContentEditing
                ? Positioned(
                    bottom: 5,
                    right: 15,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(22, 0, 0, 0),
                      ),
                      child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          highlightColor: Colors.black12,
                          onTap: () {
                            //veritabaninda guncelle
                            widget.updateNote();

                            setState(() {
                              _isNoteContentEditing = false;
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.done,
                              size: 40,
                            ),
                          )),
                    ))
                : const SizedBox.shrink(),
          ])),
    );
  }
}
