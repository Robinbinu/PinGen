// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pinggen/providers/authprovider.dart';
import 'package:pinggen/screens/authentication/registerscreen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, AuthProvider, _) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              'Login Page',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue,
          ),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Login",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                AuthProvider.login(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size.fromHeight(50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  backgroundColor: Colors.blue),
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen() ));
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size.fromHeight(50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                "Register",
                                style: TextStyle(color: Colors.blue),
                              )),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                        onPressed: () {
                          AuthProvider.loginguest(context);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Login as guest",
                          style: TextStyle(color: Colors.blue),
                        )),
                  )
                ],
              ),
            ),
          ));
    });
  }
}
