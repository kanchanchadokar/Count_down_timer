

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget{

 final String? text ;

   final VoidCallback onClicked;

 const ButtonWidget({
    Key? key,
   required this.text,
   required this.onClicked
}) :super (key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextButton(
        onPressed: onClicked,
        child:  Text(text!,
        style: TextStyle(
            fontSize: 18,
            fontFamily:'Montserrat',
            color: Colors.black,

        ),),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),

              )
          ),
          side: MaterialStateProperty.all(const BorderSide(width: .5, color: Colors.black)),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
    );
  }

}