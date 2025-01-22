import 'package:crud/screens/create.dart';
import 'package:flutter/material.dart';
import 'package:crud/helpers/helper.dart';

class Shome extends StatefulWidget {
  const Shome({super.key});

  @override
  State<Shome> createState() => _ShomeState();
}

class _ShomeState extends State<Shome> {
  @override
  Widget build(BuildContext context) {
    var names = ['1', '2', '3', '4', '5', '6', '7'];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Center(
                child: Text(
              "Todo",
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
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: 
                      InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Screate()));
                      },
                      child: customCard('Create'),
                    )
                  ),
                  customCard('All'),
                  customCard('Pending'),
                  customCard('Complete'),
                ],
              ),
              Flexible(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: Text(names[index]),
                      title: Text('2'),
                      subtitle: Text('3'),
                    );
                  },
                  itemCount: names.length,
                ),
              )
            ],
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
