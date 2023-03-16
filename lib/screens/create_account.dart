import 'package:flutter/material.dart';
import 'package:flutter_many_functions/components/alert_dialogs.dart';
import 'package:flutter_many_functions/models/responses/user.dart';
import 'package:flutter_many_functions/providers/user_provider.dart';
import 'package:provider/provider.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  final _formKey = GlobalKey<FormState>();
  User createUser = User();

  @override
  Widget build(BuildContext context) {

    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final AlertsDialogs alertsDialogs = AlertsDialogs(context);

    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 8,
            horizontal: MediaQuery.of(context).size.width / 7),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Text('data')],
            ),
            const SizedBox(height: 80,),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(label: Text('Name')),
                    onChanged: (value) => createUser.name = value,
                  ),
                  const SizedBox(height: 13),
                  TextFormField(
                    decoration: const InputDecoration(label: Text('Email')),
                    onChanged: (value) => createUser.email = value,
                  ),
                  const SizedBox(height: 13),
                  TextFormField(
                    decoration: const InputDecoration(label: Text('Nick')),
                    onChanged: (value) => createUser.nick = value,
                  ),
                  const SizedBox(height: 13),
                  TextFormField(
                    decoration: const InputDecoration(label: Text('Password')),
                    onChanged: (value) => createUser.password = value,
                  ),
                  const SizedBox(height: 13),
                  TextFormField(
                    decoration:
                        const InputDecoration(label: Text('Password confirmation')),
                    onChanged: (value) => createUser.password = value,
                  ),
                  const SizedBox(height: 13),
                  ElevatedButton(
                    child: const Text('Create'),
                    onPressed: () async {
                      await userProvider.createUser(createUser.createUser());
                      if(userProvider.error.message != null){
                        await alertsDialogs.errorLogin(userProvider.error.message!);
                      }else{
                        print("se ha creado tu cuenta");
                      }
                    },
                  )
                ],
              ),
            ),
            TextButton(
              child: const Text('Login'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    ));
  }
}
