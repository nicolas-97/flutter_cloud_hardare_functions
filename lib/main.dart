import 'package:flutter/material.dart';
import 'package:flutter_many_functions/providers/user_provider.dart';
import 'package:flutter_many_functions/screens/create_account.dart';
import 'package:flutter_many_functions/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(),)
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/' : (context) => const Home(),
        '/create-account' : (context) => const CreateAccount(),
      },
    );
  }
}

