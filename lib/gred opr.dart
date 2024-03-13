import 'package:flutter/material.dart';
import 'package:sam/lemo.dart';

class gred extends StatefulWidget {
  const gred({super.key});

  @override
  State<gred> createState() => _gredState();
}

class _gredState extends State<gred> {
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  List nam=[];
  List ema=[];
  List  pass=[];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: name,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
              hintText: 'pls enter vaild name'
            ),
          ),
          TextFormField(
            controller: email,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail),
                border: OutlineInputBorder(),
                hintText: 'pls enter vaild mail'
            ),
          ),
          TextFormField(
            controller: password,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(),
                hintText: 'pls enter vaild password'
            ),
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              nam.add(name.text);
              name.clear();
              ema.add(email.text);
              email.clear();
              pass.add(password.text);
              password.clear();
            });
          }, child: Text('login')),
          Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
            ),
            child: ListView.builder(
                itemCount:nam.length,
                itemBuilder:(BuildContext Context,index){
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green
                    ),
                    child: ListTile(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>lemo(number: nam[index],email:ema[index],password:pass[index])));
                      },
                      title:Column(
                        children: [
                      Text(nam[index]),
                        Text(ema[index]),
                        Text(pass[index]),]),

                      trailing: Container(
                        width: 80,
                        child: Row(
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
                                        nam[index] = name.text;
                                        ema[index] = email.text;
                                        pass[index] = password.text;
                                      });
                                      Navigator.of(context).pop();
                                    }, child: Text('save')),
                                  ],
                                );
                              });
                            }, icon: Icon(Icons.edit)),
                            IconButton(onPressed: (){
                              setState(() {
                                nam.removeAt(index);
                                ema.removeAt(index);
                                pass.removeAt(index);
                              });
                            }, icon: Icon(Icons.delete),),

                          ],
                        ),
                      )
                    ),
                  );
                }
            ),

          ),

        ],
      ),
    );
  }
}
