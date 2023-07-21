
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';
import 'package:timer_flutter/widget/btn_widget.dart';
import 'package:timer_flutter/model_class/timer_model.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {


List<TimerClass> mList =[];

  @override
  void initState() {
    Timer? timer;
    TextEditingController  myController = TextEditingController();
    TimerClass mModelView = TimerClass(0,"","00:00:00","Start", timer, myController);
    mList.add(mModelView);
    setState(() {
      mList;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Count-Down Timer", textAlign: TextAlign.center,),
        centerTitle: true,
        toolbarHeight: 60,
      ),
      body: ListView.builder(
          itemCount: mList.length,
          itemBuilder: (context, position) {
            return Container(
              padding: EdgeInsets.only(top: 8, bottom: 8,right: 2,left: 2),
                margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(width: 1,color: Colors.grey),
                ),
          child: Column(
            children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: 80,
                        height: 40,

                        child:  Container(
                          padding: EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                            color: Colors.transparent,

                            border: Border.all(width: .5,color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller:  mList[position].myController,
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintStyle:TextStyle(
                                  fontSize: 18,
                                  fontFamily:'Montserrat',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400

                              ),
                              hintText: "0",


                          ),

                            onChanged: (s){
                              final duration = Duration(seconds: int.parse(s));
                              setState(() {
                                mList[position].edtValue =s;
                                mList[position].timerValue =duration.toString();
                                mList;
                              });

                            },
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        )),


                      SizedBox(
                          width: 90,
                        height: 40,
                          child:  Container(
                            padding: EdgeInsets.only(top: 10, left: 5, right: 5),
                            decoration: BoxDecoration(
                              color: Colors.transparent,

                              border: Border.all(width: .5,color: Colors.black),
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Text(
                                mList[position].timerValue.toString(),

                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily:'Montserrat',
                                  color: Colors.black,
                                fontWeight: FontWeight.w400

                              ),
                            ),
                          ),
                      ),
                  btnWidget(position),

                    ],
                  )


            ],
          ) );}),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Timer? timer;
          TextEditingController  myController = TextEditingController();
          TimerClass mModelView = TimerClass(mList.length+1,"","00:00:00","Start",timer, myController);
          mList.add(mModelView);
          setState(() {
            mList;
          });
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }


  btnWidget(int position) {
    return  ButtonWidget( onClicked: (){
   startTimerMethod(position);
    }, text:mList[position].btnState,);
  }

  void startTimerMethod(int position) {
    final isRunning =  mList[position].timer==null?false:  mList[position].timer!.isActive;
    if( mList[position].btnState=="pause") {

      mList[position].timer?.cancel();
      mList[position].btnState = "Resume";
      setState(() {
        mList;
      });
    } else if( mList[position].btnState=="Resume") {

      mList[position].timer =  Timer.periodic( Duration(seconds: 1), (_) {
        if (mList[position].edtValue != "0") {
          final duration = Duration(
              seconds: int.parse(mList[position].edtValue!) - 1);
          setState(() {
            int startTime = int.parse(mList[position].edtValue!) - 1;
            mList[position].edtValue = startTime.toString();
            mList[position].timerValue = duration.toString();
            mList[position].btnState = "pause";
            mList;
          });
        } else {
          mList[position].timer?.cancel();
          mList[position].edtValue = "0";
          final duration = Duration(seconds: 0);
          mList[position].timerValue = duration.toString();
          mList[position].btnState = "Start";
          mList[position].myController.text = "0";
          setState(() {
            mList;
          });
        }

      });
    }else {
      mList[position].timer =  Timer.periodic( Duration(seconds: 1), (_) {
        if (mList[position].edtValue != "0") {
          final duration = Duration(
              seconds: int.parse(mList[position].edtValue!) - 1);
          setState(() {
            int startTime = int.parse(mList[position].edtValue!) - 1;
            mList[position].edtValue = startTime.toString();
            mList[position].timerValue = duration.toString();
            mList[position].btnState = "pause";
            mList;
          });
        } else {
          mList[position].timer?.cancel();
          mList[position].edtValue = "0";
          final duration = Duration(seconds: 0);
          mList[position].timerValue = duration.toString();
          mList[position].btnState = "Start";
          mList[position].myController.text = "0";
          setState(() {
            mList;
          });
        }

      });
    }


  }


}