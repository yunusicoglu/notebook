import 'package:flutter/material.dart';

class ContentTopSection extends StatelessWidget {
  final void Function() saveAndExit;
  const ContentTopSection({
    super.key, required this.saveAndExit 
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => saveAndExit(),
            splashColor: Colors.black12,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(19, 0, 0, 0),
                borderRadius: BorderRadius.circular(10)
              ),
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 18),
              child: const Row(
                children: <Widget>[
                  Icon(Icons.keyboard_backspace),
                ],
              )
            ),
          ),
        ),
      ],
    );
  }
}