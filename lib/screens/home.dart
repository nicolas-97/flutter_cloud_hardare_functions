import 'package:flutter/material.dart';
import 'package:flutter_many_functions/components/alert_dialogs.dart';
import 'package:flutter_many_functions/models/responses/user.dart';
import 'package:flutter_many_functions/providers/user_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _formKey = GlobalKey<FormState>();
  User userCredentials = User();
  bool _showPassword = false;

  _changeShowPassword(){
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {

    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final AlertsDialogs alertsDialogs = AlertsDialogs(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 8, 
          horizontal: MediaQuery.of(context).size.width / 7
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('login'),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3.5,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Email'),
                      ),
                      onChanged: (value) => userCredentials.email = value,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        label: const Text('Password'),
                        suffix: IconButton(
                          iconSize: 17,
                          icon: _showPassword == true 
                          ? const Icon(Icons.visibility_off) 
                          : const Icon(Icons.visibility),
                          onPressed: () => _changeShowPassword(),
                        )
                      ),
                      obscureText: _showPassword,
                      onChanged: (value) => userCredentials.password = value,
                    ),
                    ElevatedButton(
                      child: const Text('login'),
                      onPressed: () async {
                        await userProvider.login(userCredentials.credentials());
                        if(userProvider.error.message != null){
                          await alertsDialogs.errorLogin(userProvider.error.message!);
                        }else{
                          //pasar de pantalla
                          print("Me he logueado correctamente");
                        }
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}