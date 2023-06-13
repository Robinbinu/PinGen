import 'package:flutter/material.dart';
import 'package:pinggen/providers/authprovider.dart';
import 'package:pinggen/screens/authentication/loginscreen.dart';
import 'package:pinggen/screens/chat/chatscreen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, AuthProvider, _) {
      if (AuthProvider.user != null) {
        return const ChatScreen();
      } else {
        return const LoginScreen();
      }
    });
  }
}
