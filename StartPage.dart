import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  
  // Initiating the images
  AssetImage crossmark = AssetImage("images/cross.png");
  AssetImage circlemark = AssetImage("images/circle.png");
  AssetImage unfilled = AssetImage("images/edit.png");
  
  String statement;
  List <String> status_game;
  bool _checkCross = true;
  
 //Initialize condition of app

   @override
  void initState() {
    super.initState();
    setState(() {
      this.status_game = [
        "nothing",
        "nothing",
        "nothing",
        "nothing",
        "nothing",
        "nothing",
        "nothing",
        "nothing",
        "nothing",
      ];
      this.statement = "";
    });
  }  


 //logic of the game method
 TictacToegamelogic(int index){
   if(this.status_game[index] == "nothing"){
     setState(() {
       if(this._checkCross){
         this.status_game[index] = "Cross";
       }
       else{
         this.status_game[index] = "Circle";
       }
       this._checkCross = !this._checkCross;                       //toggle the value between cross and circle
       this.checkWin();
       
     });
   }
 }


 // Reset game state method
 GameRestartfunction(){
   setState(() {
     this.status_game = [
       "nothing",
       "nothing",
       "nothing",
       "nothing",
       "nothing",
       "nothing",
       "nothing",
       "nothing",
       "nothing",
     ];
     this.statement="";
   });
 }

 //Linking asset images to different cases method
  AssetImage getImage(String value){
    switch (value) {
      case ('nothing'):
       return unfilled;
      break;
      case ('Cross'):
       return crossmark;
      break;
      case ('Circle'):
       return circlemark;
      break;
    }
  }

 //Win logic check
 checkWin(){
   if((status_game[0] != 'nothing') && status_game[0]==status_game[1] && status_game[1]==status_game[2]){
     setState(() {
       //this message gets printed when a sign wins
       this.statement = '${this.status_game[0]} Wins';
     });
   }
    else if((status_game[3] != 'nothing') && status_game[3]==status_game[4] && status_game[4]==status_game[5]){
     setState(() {
       this.statement = '${this.status_game[3]} Wins';
     });
   }
   else if((status_game[6] != 'nothing') && status_game[6]==status_game[7] && status_game[7]==status_game[8]){
     setState(() {
       this.statement = '${this.status_game[6]} Wins';
     });
   }
   else if((status_game[0] != 'nothing') && status_game[0]==status_game[3] && status_game[3]==status_game[6]){
     setState(() {
       this.statement = '${this.status_game[0]} Wins';
     });
   }
   else if((status_game[1] != 'nothing') && status_game[1]==status_game[4] && status_game[4]==status_game[7]){
     setState(() {
       this.statement = '${this.status_game[1]} Wins';
     });
   }
   else if((status_game[2] != 'nothing') && status_game[2]==status_game[5] && status_game[5]==status_game[8]){
     setState(() {
       this.statement = '${this.status_game[2]} Wins';
     });
   }
   else if((status_game[0] != 'nothing') && status_game[0]==status_game[4] && status_game[4]==status_game[8]){
     setState(() {
       this.statement = '${this.status_game[0]} Wins';
     });
   }
   else if((status_game[2] != 'nothing') && status_game[2]==status_game[4] && status_game[4]==status_game[6]){
     setState(() {
       this.statement = '${this.status_game[2]} Wins';
     });
   }
   else if( !status_game.contains('nothing'))
   {
     setState(() {
       this.statement = 'Game draw';
     });
   }
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: GradientAppBar(
      title: Text('        Tic-Tac-Toe',style: TextStyle(color: Colors.white,fontSize: 35),),
      backgroundColorStart: Colors.pink,
      backgroundColorEnd: Colors.pink,
     ),
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.white, Colors.white])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
      
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: this.status_game.length, //can use directly 9 too
              itemBuilder: (context, i) => SizedBox(
                height: 100,
                width: 100,
                child: MaterialButton(
                  onPressed: (){
                    this.TictacToegamelogic(i);
                  },
                  child: Image(
                    image: this.getImage(this.status_game[i]),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(this.statement, style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
            ),     
          ),
          MaterialButton(
            color: Colors.redAccent,
            minWidth: 300.0,
            height: 50.0,
            child: Text("Reset Game", style: TextStyle(color: Colors.white,fontSize: 20.0),),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              
            ),
            onPressed: (){
              this.GameRestartfunction();
            },
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text("Made by Susheet Kumar", style: TextStyle(fontSize: 18.0) ),
          )
        ],
      ),
    ),
    );
  }
}
