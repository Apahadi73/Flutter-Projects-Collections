import 'package:flutter/material.dart';
 
class Answer extends StatelessWidget {
  //we use void call back for defining functions that does not take any argument and return nothing.
  final VoidCallback selectHandler; 
  final String answerText;
 
  Answer(this.selectHandler, this.answerText);
 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xff00BCD4)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}