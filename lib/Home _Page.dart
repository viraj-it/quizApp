import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/ResultPage.dart';
import 'List.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int questionNumber=0;
  int optionSelectedNumber;
  int totalMarks=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Identify the Celebritiy'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20.0),
              child: Image.network(links.elementAt(questionNumber),
                  width: MediaQuery.of(context).size.width,
                  fit:BoxFit.cover),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF0A0E38),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  changeColor(0);
                  optionSelectedNumber=0;
                });

              },
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: Center(child: Text(options.elementAt(questionNumber*4+0),style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w100),)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: optionColor.elementAt(0),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  optionSelectedNumber=1;
                  changeColor(1);
                });
              },
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: Center(child: Text(options.elementAt(questionNumber*4+1),style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w100))),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: optionColor.elementAt(1),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  changeColor(2);
                  optionSelectedNumber=2;
                });
              },
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: Center(child: Text(options.elementAt(questionNumber*4+2),style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w100))),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: optionColor.elementAt(2),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  changeColor(3);
                  optionSelectedNumber=3;
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                padding: EdgeInsets.all(10),
                child: Center(child: Text(options.elementAt(questionNumber*4+3),style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w100))),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: optionColor.elementAt(3),
                ),
              ),
            ),
          ),
          Expanded(

            child: GestureDetector(

              onTap: (){
                setState(() {
                  if(questionNumber!=3 && optionSelectedNumber!=null){
                  changeColor(-1);
                  selectedOptions.add(options.elementAt(questionNumber*4+optionSelectedNumber));
                  if(optionSelectedNumber==CorrectAnswers.elementAt(questionNumber)){
                  totalMarks++;
                  }
                  optionSelectedNumber=null;
                  print(totalMarks);
                  questionNumber++;
                  }
                  else{
                    selectedOptions.add(options.elementAt(questionNumber*4+optionSelectedNumber));
                    if(optionSelectedNumber==CorrectAnswers.elementAt(questionNumber)){
                      totalMarks++;
                    }
                    print(totalMarks);
                    String msg=finalMessage(totalMarks);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(totalMarks: totalMarks,finalmessage: msg)));
                  }
                });
              },

              child: Container(
                child:Text(finalButton.elementAt(questionNumber),style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w100)),
                  padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey.shade900,
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}

void changeColor(int i){
  for(int j=0;j<4;j++){
    optionColor[j]=Colors.black12;
  }

  if(i<0){
    for(int j=0;j<4;j++){
      optionColor[j]=Colors.black12;
    }
  }
  else{
    optionColor[i]=Colors.black;
  }
}

String finalMessage(int totalMarks){
  String finalmsg;
  if(totalMarks==0){
    finalmsg='You have scored 0/4\nBetterluck next time.';
  }
  else if(totalMarks==1){
    finalmsg='You have scored 1/4 \nyou tried so hard.';
  }
  else if(totalMarks==2){
    finalmsg='You scored 2/4\nYou can get better in next try.';
  }
  else if(totalMarks==3){
    finalmsg='You have scored 3/4\nYou can solve it in next try.';
  }
  else if(totalMarks==3){
    finalmsg='You have scored 4/4\nWell done Champ.';
  }
  return finalmsg;
}