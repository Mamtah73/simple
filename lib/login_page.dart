import 'package:flutter/material.dart';
import 'package:myapp/utlis/route.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool ChangeButton = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        ChangeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        ChangeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(children: [
            Image.asset(
              "assets/images/log.png",
              fit: BoxFit.cover,
              height: 300,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "login your app $name",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter username",
                      labelText: "username",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "username cannot be empty";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter username",
                      labelText: "password",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password cannot be empty";
                      } else if (value.length < 6) {
                        return "password length should be atleast 6";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  //  ElevatedButton(
                  //   child: Text("login"),
                  //  style: TextButton.styleFrom(minimumSize: Size(50, 30)),
                  //  onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  //  ),
                  Material(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(ChangeButton ? 50 : 8),
                    child: InkWell(
                      //splashColor: Colors.red,
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: ChangeButton ? 50 : 100,
                        height: 30,
                        alignment: Alignment.center,
                        child: ChangeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                        // decoration: BoxDecoration(
                        //  color: Colors.deepPurple,
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
