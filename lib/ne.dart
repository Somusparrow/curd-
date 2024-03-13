import 'package:flutter/material.dart';
import 'package:sam/lemo.dart';

class gredd extends StatefulWidget {
  const gredd({Key? key}) : super(key: key);

  @override
  State<gredd> createState() => _gredState();
}

class _gredState extends State<gredd> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  List<String> nam = [];
  List<String> ema = [];
  List<String> pass = [];

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
              hintText: 'Please enter valid name',
            ),
          ),
          TextFormField(
            controller: email,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail),
              border: OutlineInputBorder(),
              hintText: 'Please enter valid email',
            ),
          ),
          TextFormField(
            controller: password,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.password),
              border: OutlineInputBorder(),
              hintText: 'Please enter valid password',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                nam.add(name.text);
                name.clear();
                ema.add(email.text);
                email.clear();
                pass.add(password.text);
                password.clear();
              });
            },
            child: Text('Login'),
          ),
          Container(
            height: 500,
            width: double.infinity,
            child: ListView.builder(
              itemCount: nam.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => lemo(
                            number: nam[index],
                            email: ema[index],
                            password: pass[index],
                          ),
                        ),
                      );
                    },
                    title: Column(
                      children: [
                        Text(nam[index]),
                        Text(ema[index]),
                        Text(pass[index]),
                      ],
                    ),
                    trailing: Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                TextEditingController editName =
                                TextEditingController(text: nam[index]);
                                TextEditingController editEmail =
                                TextEditingController(text: ema[index]);
                                TextEditingController editPassword =
                                TextEditingController(text: pass[index]);
                                return AlertDialog(
                                  title: Text('Edit Values'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: editName,
                                        decoration:
                                        InputDecoration(labelText: 'Name'),
                                      ),
                                      TextField(
                                        controller: editEmail,
                                        decoration:
                                        InputDecoration(labelText: 'Email'),
                                      ),
                                      TextField(
                                        controller: editPassword,
                                        decoration: InputDecoration(
                                            labelText: 'Password'),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Cancel'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          nam[index] = editName.text;
                                          ema[index] = editEmail.text;
                                          pass[index] = editPassword.text;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Save'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              nam.removeAt(index);
                              ema.removeAt(index);
                              pass.removeAt(index);
                            });
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}