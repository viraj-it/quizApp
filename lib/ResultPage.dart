import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'List.dart';

class ResultPage extends StatelessWidget {
  final totalMarks;
  final String finalmessage;
  ResultPage({@required this.totalMarks,this.finalmessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Your Result',
                      style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w100)
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: optionColor.elementAt(2),
                  ),
                ),
              ),
              Expanded(
                  flex: 5,


                  child: Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Expanded(child: Text(totalMarks.toString(),style: TextStyle(fontSize: 70.0,fontWeight: FontWeight.w100))),
                        Expanded(child: Text(finalmessage,style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w100)))
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: optionColor.elementAt(2),
                    ),
                  )),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}

