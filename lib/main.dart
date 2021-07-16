import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  TextEditingController emailController, passController;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = new TextEditingController();
    passController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Screen'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              autovalidate: true,
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20),
                      )),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required Email"),
                        EmailValidator(errorText: "Not a Vaild Email!")
                      ]),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                        obscureText: true,
                        controller: passController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required Password"),
                          MinLengthValidator(4,
                              errorText: "Should be atleast 4 charcators!"),
                          MaxLengthValidator(12,
                              errorText: "Should Not more than 12 charcators!"),
                        ])),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text('Login'),
                        onPressed: () {
                          if (formkey.currentState.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => homescreen(
                                    value1: emailController.text,
                                    value2: passController.text)));
                          }
                        },
                      )),
                ],
              ),
            )));
  }
}
