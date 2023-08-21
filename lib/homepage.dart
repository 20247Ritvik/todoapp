import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ToDoListstate();
}

class ToDoListstate extends State<HomePage> {
  var _formKey = GlobalKey<FormState>();

  List<String> _todoList = <String>[];
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
          appBar: AppBar(
            title: Text("ToDo App"),
          ),
          body: ListView(
            children: getItems(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _displayDialog(context);
            },
            tooltip: 'Add Note',
            child: Icon(Icons.add),
          ));
    });
  }

  void _addTodoItem(String title) {
    setState(() {
      _todoList.add(title);
    });
    titleController.clear();
  }

  Widget _buildTodoItem(String title) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 80,
        child: Card(
          color: Colors.white,
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  _displayDialog2(context);
                });
              },
              child: ListTile(
                title: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                leading: Icon(Icons.list, color: Colors.orangeAccent, size: 40),
                trailing: InkWell(
                  child: Icon(
                    Icons.delete,
                    color: Colors.grey,
                    size: 40,
                  ),
                  onTap: () {
                    _deleteItem(title);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<Future> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              title: const Text('Add a task to your List'),
              content: Builder(
                  builder: (context) => Container(
                      height: 200,
                      width: 350,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Form(
                                key: _formKey,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  maxLines: 6,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter valid information';
                                    }
                                    return null;
                                  },
                                  controller: titleController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your task',
                                    errorStyle: TextStyle(
                                      color: Colors.deepOrangeAccent,
                                      fontSize: 15.0,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  child: Text('ADD'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontStyle: FontStyle.normal),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (_formKey.currentState!.validate()) {
                                        Navigator.of(context).pop();
                                        _addTodoItem(titleController.text);
                                      }
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                ElevatedButton(
                                  child: const Text('CANCEL'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey,
                                    // side: BorderSide(color: Colors.yellow, width: 5),
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontStyle: FontStyle.normal),
                                    shadowColor: Colors.black,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            )
                          ]))));
        });
  }

  List<Widget> getItems() {
    final List<Widget> _todoWidgets = <Widget>[];
    for (String title in _todoList) {
      _todoWidgets.add(_buildTodoItem(title));
    }
    return _todoWidgets;
  }

  void _deleteItem(String title) {
    setState(() {
      _todoList.remove(title);
    });
  }

  Future<Future> _displayDialog2(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              title: const Text('Add a task to your List'),
              content: Builder(
                  builder: (context) => Container(
                      height: 200,
                      width: 350,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Form(
                                key: _formKey,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  maxLines: 6,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter valid information';
                                    }
                                    return null;
                                  },
                                  controller: titleController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your task',
                                    errorStyle: TextStyle(
                                      color: Colors.deepOrangeAccent,
                                      fontSize: 15.0,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  child: Text('ADD'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontStyle: FontStyle.normal),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (_formKey.currentState!.validate()) {
                                        Navigator.of(context).pop();
                                        _updateTodoItem(titleController.text);
                                      }
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                ElevatedButton(
                                  child: const Text('CANCEL'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey,
                                    // side: BorderSide(color: Colors.yellow, width: 5),
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontStyle: FontStyle.normal),
                                    shadowColor: Colors.black,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            )
                          ]))));
        });
  }

  void _updateTodoItem(String title) {
    setState(() {
      _todoList.add(title);
    });
    titleController.clear();
  }
}
