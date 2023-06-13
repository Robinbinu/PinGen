// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pinggen/providers/authprovider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Colors.blue,
        title: Text(
          'Register',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Consumer<AuthProvider>(
        builder: (context,AuthProvider,_) {
          return Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: AuthProvider.email,
                          decoration: InputDecoration(
                              label: Text('E-mail'),
                              hintText: 'Enter your E-mail',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: AuthProvider.password,
                          decoration: InputDecoration(
                            label: Text('Password'),
                            hintText: 'Enter your Password',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 20, color: Colors.blueAccent)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              AuthProvider.register(context);
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Colors.green,
                              elevation: 20,
                              shadowColor: Colors.greenAccent,
                              minimumSize: Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              //
                            ),
                            child: Text(
                              "Register",
                            )),
                      )
                    ],
                  ),
                ),
              );
        }
      ),
    );
  }
}