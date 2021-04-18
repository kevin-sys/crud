import 'package:flutter/material.dart';
import 'package:crud/controllers/usercontroller.dart';
import 'package:crud/views/edituser.dart';
import 'package:crud/views/listviewuser.dart';

class DetailUser extends StatefulWidget {
   List list ;
   int index;
  DetailUser({required this.index, required this.list, List? List});

  @override
  _DetailUserState createState() => _DetailUserState();
}

class _DetailUserState extends State<DetailUser> {
  UserController userController = new UserController();

  _navigateList(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListUser()),
    );

    if (result) {
      setState(() {});
    }
  }

  //create function delete
  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Esta seguro de eliminar '${widget.list[widget.index]['id']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text(
            "OK remove!",
            style: new TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
            userController
                .DeleteUser(widget.list[widget.index]['id'].toString());
            _navigateList(context);
          },
        ),
        new RaisedButton(
          child: new Text("CANCEL", style: new TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

   // showDialog(builder: (context) => alertDialog, context: context);
    showDialog(
        context: context,
        builder: (_) => AlertDialog(),
    );

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar:
      //     new AppBar(title: new Text("${widget.list[widget.index]['name']}")),
      body: new Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  widget.list[widget.index]['name'],
                  style: new TextStyle(fontSize: 20.0),
                ),
                Divider(),
                new Text(
                  "Price : ${widget.list[widget.index]['price']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("Edit"),
                      color: Colors.blueAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new EditUser(
                              list: widget.list,
                              index: widget.index,
                            ),
                          )),
                    ),
                    VerticalDivider(),
                    new RaisedButton(
                      child: new Text("Delete"),
                      color: Colors.redAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () => confirm(),
                    ),
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
