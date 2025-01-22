import 'package:crud/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:crud/helpers/helper.dart';

class Screate extends StatefulWidget {
  final Map<String, dynamic>? item;
  const Screate(this.item, {super.key});

  @override
  State<Screate> createState() => _ScreateState();
}

class _ScreateState extends State<Screate> {
  late TextEditingController _controlTitle;
  late TextEditingController _controlSubtitle;
  late String heading ; 
  @override
  void initState() {
    super.initState();

    heading = widget.item?['key'] != null ? 'Edit' : 'Create';
    _controlTitle = TextEditingController(text: widget.item?['title'] ?? '');
    _controlSubtitle = TextEditingController(text: widget.item?['subtitle'] ?? '');
  }

  @override
  void dispose() {
    _controlTitle.dispose();
    _controlSubtitle.dispose();
    super.dispose();
  }

  void insertData() async {
    final [
      controlTitle,
      controlSubtitle
    ] = [_controlTitle.text.toString(), _controlSubtitle.text.toString()];

    if (controlTitle.isNotEmpty && controlSubtitle.isNotEmpty) {
      final data = {'title': controlTitle, 'subtitle': controlSubtitle};
      final key = widget.item?['key'];
      if (key != null) {
        try {
          await database().child(key).update(data);
        } catch (e) {
          debugPrint(e.toString());
        }
      } else {
        try {
          await database().push().set(data);
        } catch (error) {
          debugPrint(error.toString());
        }
      }

      _controlTitle.clear();
      _controlSubtitle.clear();
      if (mounted) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Shome()));
      }
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
              "$heading Tasks",
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
