import 'package:flutter/material.dart';

class newpro extends StatefulWidget {
  const newpro({super.key});

  @override
  State<newpro> createState() => _newproState();
}

class _newproState extends State<newpro> {
  TextEditingController crl = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dob = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  List deatail=[];
  List bb=[];
  List cc=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hai There'),
        backgroundColor: Colors.amber.shade300,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: crl,
                      decoration: InputDecoration(
                          label: Text('Enter the name'),
                          prefixIcon: Icon(Icons.people),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                          label: Text('Enter Email'),
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: dob,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          label: Text('Enter DOB'),
                          prefixIcon: Icon(Icons.date_range),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9))),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          deatail.add(crl.text);
                          crl.clear();
                          bb.add(email.text);
                          email.clear();
                          cc.add(dob.text);
                          dob.clear();
                        });
                        if (_formkey.currentState!.validate()) {}
                      },
                      child: Text('Submit'))
                ],
              ),
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: deatail.length,
                  itemBuilder: (BuildContext context, index) {
                    return Dismissible(
                      key: Key(deatail[index]),
                      onDismissed: (direction) {
                        // Step 2
                        setState(() {
                          deatail.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${deatail[index]} dismissed')));
                      },
                      child: LongPressDraggable(
                        onDragStarted: () {
                          // Dragging started
                        },
                        onDraggableCanceled: (Velocity velocity, Offset offset) {
                          // Dragging canceled
                        },
                        onDragCompleted: () {
                          // Dragging completed
                        },
                        feedback: ListTile(
                          title: Text('List item ${deatail[index]}'),
                        ),
                        childWhenDragging: Container(),
                        data: index,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Name: ${deatail[index]}'),
                                  Text('Email: ${bb[index]}'),
                                  Text('DOB: ${cc[index]}'),
                                ],
                              ),
                              trailing:
                              IconButton(onPressed: (){
                                setState(() {

                                });
                              },icon: Icon(Icons.edit),),
                              onLongPress: () {
                                // Handle long-press event
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    TextEditingController controller =
                                    TextEditingController(text: deatail[index]);
                                    return AlertDialog(
                                      title: Text('Edit Value'),
                                      content: TextField(
                                        controller: controller,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(labelText: 'New Value'),
                                      ),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Cancel'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              // Update the value at the specified index
                                              deatail[index] = controller.text;
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
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}