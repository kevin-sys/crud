import 'package:flutter/material.dart';
import 'package:crud/controllers/usercontroller.dart';
import 'package:crud/views/listviewuser.dart';

class AddUser extends StatefulWidget {
  AddUser({ Key? key,  this.title}) : super(key: key);
  final String? title;

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  UserController usercontroller = new UserController();

  final TextEditingController nameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController addressController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro de Usuarios',
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Add Product'),
        // ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(
                top: 20, left: 12.0, right: 12.0, bottom: 12.0),
            children: <Widget>[
              Text(
                ('Registrar Usuario'),
                style: TextStyle(
                    fontSize: 30.0, color: Colors.black87),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    hintText: 'Digite el nombre',
                    icon: new Icon(Icons.account_circle),
                  ),
                ),
              ),

              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Digite el email',
                    icon: new Icon(Icons.email),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: addressController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Dirección',
                    hintText: 'Digite la dirección',
                    icon: new Icon(Icons.location_on_outlined),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new RaisedButton(
                  onPressed: () {
                    usercontroller.addDataUser(
                        nameController.text.trim(),
                        emailController.text.trim(),
                    addressController.text.trim());
                    Navigator.pop(context, true);
                  },
                  color: Colors.blue,
                  child: new Text(
                    'Guardar Usuario',
                    style: new TextStyle(
                        color: Colors.white, backgroundColor: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}