import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:streaming/strm.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final formKey = new GlobalKey<FormState>();
  String password = "250";

  String get value => "250";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: [
                    const Text(
                      'password',
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                    TextFormField(
                        autovalidateMode: AutovalidateMode.always,
                        onSaved: (value) {
                          setState(() {
                            password = value as String;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Some Password';
                          }
                          if (!RegExp('[0-9]').hasMatch(value)) {
                            return 'MAX';
                          }
                          return null;
                        }),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          // If the form is valid, display a SnackBar. In the real world,
                          // you'd often call a server or save the information in a database.
                        }
                        if (password == value) {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => StrmBar()));
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Connected')));
                        }
                        if (password != value)
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Wrong Password')));
                        }
                      },
                      child: const Text('Connect'),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
