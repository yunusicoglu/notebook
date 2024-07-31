import 'package:flutter/material.dart';

class ContentTitle extends StatefulWidget {
  const ContentTitle({super.key});

  @override
  State<ContentTitle> createState() => _ContentTitleState();
}

class _ContentTitleState extends State<ContentTitle> {
    final TextEditingController _controller = TextEditingController();
  bool _isEditing = false;
  final FocusNode _focusNode = FocusNode();

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
            padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 7),
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