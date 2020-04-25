import 'package:flutter/material.dart';
import 'StartPage.dart';

void main() => runApp(SKapp());
  
class SKapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.ambers,       //change required
      ),
      home: StartPage(),
    );
      
  
  }
}
