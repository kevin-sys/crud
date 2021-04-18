import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:crud/views/adduser.dart';
import 'package:crud/views/detailuser.dart';
import 'dart:math';

class ListUser extends StatefulWidget {
  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  List? data;
  Future<List> getData() async {
    final response = await http.get(Uri.parse("http://localhost:8080/users"));
    return json.decode(response.body);
  }
  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddUser()),
    );

    if (result) {
      setState(() {});
    }
  }
  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Listado de usuarios"),
        automaticallyImplyLeading: false, //evita que muestre flecha de regresar
        actions: [
          RaisedButton(
            color: Colors.black12,
            child: Icon(Icons.add),
            onPressed: () => _navigateAndDisplaySelection(context),
          ),
        ],
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
            list: snapshot.data,
          )
              : new Center(
            child: new CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List? list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list!.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            new Container(
              padding: const EdgeInsets.all(10.0),
              child: new GestureDetector(
                onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new DetailUser(
                        List: list,
                        index: i, list: [],
                      )),
                ),

                child: Container(
                  //color: Colors.black,
                  height: 180.3,
                  child: new Card(
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // add this
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  list![i]['id'].toString(),
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  list![i]['name'].toString(),
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black87),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  list![i]['email'].toString(),
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black87),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  list![i]['address'].toString(),
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black87),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

