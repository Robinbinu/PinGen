// ignore_for_file: prefer_const_constructors
// import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pinggen/firebase_options.dart';
import 'package:pinggen/providers/authprovider.dart';
import 'package:pinggen/providers/firestoreprovider.dart';
import 'package:pinggen/screens/wrapper.dart';
import 'package:provider/provider.dart';
// import 'package:logger/logger.dart';
void main() async {
  // var log = Logger();
  WidgetsFlutterBinding.ensureInitialized();
  // final result = await InternetAddress.lookup('google.com');
  // if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //   log.e("internet connected");
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  // } else{
  //    log.e("no internet");
  // }
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_)=>FirestoreProvider())],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                colorScheme:
                    ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
                useMaterial3: true,
                inputDecorationTheme: InputDecorationTheme(
                  // enabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.grey),
                  // ),
                  // focusedBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(width: 2, color: Colors.blueAccent),
                  // ),
                )),
            home: Consumer<AuthProvider>(builder: (context, AuthProvider, _) {
              return Wrapper();
            })));
  }
}
