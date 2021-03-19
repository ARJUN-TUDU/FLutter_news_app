import 'package:flutter/material.dart' ; 

class Practice extends StatefulWidget {
  @override
  _PracticeState createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Practice2(),
    );
  }
}



class Practice2 extends StatefulWidget {
  @override
  _Practice2State createState() => _Practice2State();
}

class _Practice2State extends State<Practice2> {

  
  
  Widget name ;

  sendnews(){
    setState(() {
      name = Text('dawdaw');
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        title: Text('bokachoda',
         style: TextStyle(
           fontWeight: FontWeight.bold
         ),
        ),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Container(
               child: name,
               color: Colors.red,
               height: 100,
               width: 100,
             ),
             RaisedButton(onPressed: (){
               sendnews() ; 
             },
               child: Text('holahola',style: 
                  TextStyle(
                    color: Colors.black
                  )
               ,),
             )
          ],
        ),        
      ),
    );
  }
}