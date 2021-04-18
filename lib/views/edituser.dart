import 'package:flutter/material.dart';
import 'package:crud/controllers/usercontroller.dart';
import 'package:crud/views/listviewuser.dart';

class EditUser extends StatefulWidget {
  final List list;
  final int index;

  EditUser({required this.list, required this.index});

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  UserController userController = new UserController();

   TextEditingController nameController = new TextEditingController();
   TextEditingController emailController = new TextEditingController();
   TextEditingController addressController = new TextEditingController();
  TextEditingController  idController = new TextEditingController();


  _navigateList(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListUser()),
    );

    if (result) {
      setState(() {});
    }
  }

  @override
  void initState() {

    nameController = new TextEditingController(
        text: widget.list[widget.index]['name'].toString());
    idController = new TextEditingController(
        text: widget.list[widget.index]['id'].toString());
    emailController = new TextEditingController(
        text: widget.list[widget.index]['email'].toString());
    addressController = new TextEditingController(
        text: widget.list[widget.index]['address'].toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text("Edit product"),
      // ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new Column(
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: idController,
                    decoration: new InputDecoration(
                      hintText: "Id",
                      labelText: "Id",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) return "name";
                    },
                    decoration: new InputDecoration(
                      hintText: "Name",
                      labelText: "Name",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.black),
                  title: new TextFormField(
                    controller: addressController,
                    validator: (value) {
                      if (value!.isEmpty) return "address";
                    },
                    decoration: new InputDecoration(
                      hintText: "Direccion",
                      labelText: "Direccion",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.settings_input_component,
                      color: Colors.black),
                  title: new TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) return "email";
                    },
                    decoration: new InputDecoration(
                      hintText: "Correo",
                      labelText: "Correo",
                    ),
                  ),
                ),
                const Divider(
                  height: 1.0,
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Edit"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    userController.editUser(
                        idController.text.trim(),
                        nameController.text.trim(),
                        emailController.text.trim(),
                        addressController.text.trim());
                    _navigateList(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
