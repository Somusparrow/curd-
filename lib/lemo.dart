import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class lemo extends StatefulWidget {
     String number;
    String email;
     String password;
    List nam=[];
    List ema=[];
    List  pass=[];
    lemo({Key? key, required this.number, required this.email, required this.password}):super(key: key);

  State<lemo> createState() => _lemoState();
}

class _lemoState extends State<lemo> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back),),
      ),
      body: Row(
        children: [
          Column(
            children: [
              Text(
                'NUMBER : ${widget.number}',style: TextStyle(fontSize:20 ,fontWeight: FontWeight.bold),
              ),
              Text(
                'Email : ${widget.email}',style: TextStyle(fontSize:20 ,fontWeight: FontWeight.bold),
              ),
              Text(
                'password : ${widget.password}',style: TextStyle(fontSize:20 ,fontWeight: FontWeight.bold),
              ),
        ],
      ),
           Container(
            width: 80,
            child: Column(
              children: [
                IconButton(onPressed: (){
                  showDialog(context: context, builder: (BuildContext context){
                    TextEditingController name=TextEditingController();
                    TextEditingController email=TextEditingController();
                    TextEditingController password=TextEditingController();
                    return AlertDialog(
                      title: Text('values'),
                      content: Column(
                        children: [
                          TextField(
                            controller: name,
                            decoration: InputDecoration(labelText: 'New Value'),
                          ),
                          TextField(
                            controller: email,
                            decoration: InputDecoration(labelText: 'New Value'),
                          ),
                          TextField(
                            controller: password,
                            decoration: InputDecoration(labelText: 'New Value'),
                          ),
                        ],
                      ),

                      actions: [
                        ElevatedButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text('cancel')),
                        ElevatedButton(onPressed: (){
                          setState(() {
                            widget.number = name.text;
                            widget.email = email.text;
                            widget.password = password.text;
                          });
                          Navigator.of(context).pop();
                        }, child: Text('save')),
                      ],
                    );
                  });
                }, icon: Icon(Icons.edit)),
              ],
            ),
          )
    ]
    ),
    );
  }
}