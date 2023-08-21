import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {

  final String title;
  final String desc;

  const DetailsPage({Key? key, required this.title, required this.desc})
      : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final List<String> _todoList = <String>[];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    TextStyle? textStyle = Theme.of(context).textTheme.titleLarge;

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 15.0, right: 10, left: 10),
        child: InkWell(
          onTap: () {
            setState(() {});
          },
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15.0),
                child: TextFormField(
                  controller: titleController,
                  style: textStyle,
                  decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Container(
                        width: 200.0,
                        height: 40,
                        child: ElevatedButton(
                            child: Text(
                              'SAVE',
                            ),
                            style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              _addItem(titleController.text);
                            })),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Container(
                      width: 200.0,
                      height: 40,
                      child: ElevatedButton(
                          child: Text(
                            'CANCEL',
                          ),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontStyle: FontStyle.normal),
                          ),
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                              debugPrint("CANCEL Button Clicked!");
                            });
                          }),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addItem(String title) {
    setState(() {
      _todoList.add(title);
    });
    titleController.clear();
  }
}
