import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.text,
    required this.isCurrentUser,
  }) : super(key: key);

  final String text;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    if(isCurrentUser)
    {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(children: [
        Text(text,
        style: TextStyle(
              color: Colors.greenAccent,
              fontSize:20)
        )
          ]),
      );
    }
    else{
       return Padding(
         padding: const EdgeInsets.all(15.0),
         child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             Text(text,
             style: TextStyle(
              color: Colors.blue,
              fontSize:20
              ),
            )
           ]),
       );

    }
    
  }
}
