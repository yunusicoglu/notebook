import 'package:flutter/material.dart';

class ContentTitle extends StatefulWidget {
  final void Function(String) updateTitle;
  final String? title;
  const ContentTitle({
    super.key,
    required this.updateTitle,
    required this.title
    });

  @override
  State<ContentTitle> createState() => _ContentTitleState();
}

class _ContentTitleState extends State<ContentTitle> {
  late TextEditingController _controller;
  bool _isEditing = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState(){
    super.initState();
    //degiskenin default halini tanimlarken hata vermemesi icin burada yapildi
    _controller = TextEditingController(text: widget.title);       
  }


  @override
  void dispose() {
    _controller.dispose();
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
            ? TextField(
              controller: _controller,
              focusNode: _focusNode,
              onSubmitted: (value) {
                setState(() {
                  _isEditing = false;
                });
              },
              onChanged: (title) {
                widget.updateTitle(title);
              },
              style: const TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none
              ),
            )
            : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 9),
              child: Text(
                _controller.text.isNotEmpty ? _controller.text : 'Başlık',
                
                style: _controller.text.isNotEmpty
                ? const TextStyle(
                    fontSize: 24, 
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  )
                : const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: Colors.black45
                  )
              ),
            ),
        ),
      ),
    );
  }
}