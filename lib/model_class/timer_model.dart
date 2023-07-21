

import 'dart:async';

import 'package:flutter/cupertino.dart';

class TimerClass {
   int? id;
   String? edtValue;
   String? timerValue;
   String btnState;
   Timer? timer;
   TextEditingController  myController = TextEditingController();

   TimerClass(
      this.id,
      this.edtValue,
      this.timerValue,
      this.btnState,
       this.timer,
this.myController);



}