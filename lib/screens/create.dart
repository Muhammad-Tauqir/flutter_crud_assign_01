import 'package:flutter/material.dart';
import 'package:crud/helpers/helper.dart';
import 'package:crud/main.dart';

class Screate extends StatefulWidget {
  const Screate({super.key});

  @override
  State<Screate> createState() => _ScreateState();
}

class _ScreateState extends State<Screate> {
  final TextEditingController _controlTitle = TextEditingController();
  final TextEditingController _controlSubtitle = TextEditingController();

  void insertData() async {
    final [
      controlTitle,
      controlSubtitle
    ] = [_controlTitle.text.toString(), _controlSubtitle.text.toString()];

    if (controlTitle.isNotEmpty && controlSubtitle.isNotEmpty) {
      try {
        await database()
            .push()
            .set({'title': controlTitle, 'subtitle': controlSubtitle});
      } catch (error) {
        debugPrint(error.toString());
      }

      _controlTitle.clear();
      _controlSubtitle.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Center(
                child: Text(
              "Create Tasks",
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
            )),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: bgColor(),
              ),
            )),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              gradient: bgColor(),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                myInp('Title', _controlTitle),
                SizedBox(
                  height: 10,
                ),
                myInp('Subtitle', _controlSubtitle),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: insertData, child: Text('Submit')),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Back'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget myInp(String label, control) {
  return TextField(
      controller: control,
      decoration: InputDecoration(
        labelText: label,
        hintText: "Enter $label",
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.grey)),
      ));
}
