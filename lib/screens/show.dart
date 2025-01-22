import 'package:crud/screens/create.dart';
import 'package:flutter/material.dart';
import 'package:crud/helpers/helper.dart';

class Sshow extends StatefulWidget {
  const Sshow({super.key});

  @override
  State<Sshow> createState() => _SshowState();
}

Future<Map<String, dynamic>?> getData() async {
  try {
    final data = await database().get();
    return Map<String, dynamic>.from(data.value as Map);
  } catch (error) {
    debugPrint("Error fetching data: ${error.toString()}");
    return null;
  }
}

class _SshowState extends State<Sshow> {
  List<Map<String, dynamic>>? _items;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final result = await getData();
    if (result != null) {
      List<Map<String, dynamic>> items = result.entries.map((entry) {
        return {
          'key': entry.key,
          'title': entry.value['title'],
          'subtitle': entry.value['subtitle'],
        };
      }).toList();

      setState(() {
        _items = items;
      });
    }
  }

  void deleteRec(String id) async {
    try {
      debugPrint('Deleting item with id: $id');
      await database().child(id).remove();
      debugPrint('Item deleted successfully');

      setState(() {
        _items!.removeWhere((item) => item['key'] == id);
      });
    } catch (e) {
      debugPrint('Error deleting item: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            title: Center(
                child: Text(
              "Tasks",
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
            )),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: bgColor(),
              ),
            )),
        body: Container(
          decoration: BoxDecoration(
            gradient: bgColor(),
          ),
          child: _items == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Flexible(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_items![index]['title']),
                        subtitle: Text(_items![index]['subtitle']),
                        trailing: Wrap(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (content) => Screate(_items![index])));
                                  debugPrint(_items![index].toString());
                                },
                                icon: Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  deleteRec(_items![index]['key']);
                                },
                                icon: Icon(Icons.delete))
                          ],
                        ),
                      );
                    },
                    itemCount: _items!.length,
                  ),
                ),
        ),
      ),
    );
  }
}

Widget customCard(String inp) {
  return Flexible(
      child: Card(
    color: Colors.transparent,
    child: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Text(
          inp,
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    ),
  ));
}