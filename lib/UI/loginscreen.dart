import 'package:flutter/material.dart';
import 'package:planner_advanced/bloc/blocs/user_bloc_provider.dart';
import 'package:planner_advanced/models/classes/routing/routing_constants.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:planner_advanced/models/classes/user.dart';
import 'package:planner_advanced/constants.dart';

class LoginPage extends StatefulWidget { //Should be a Stateless widget
  final VoidCallback login;
  final bool newUser;

  const LoginPage({Key key, this.login, this.newUser}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreyColor,
      body: Center(
        child: widget.newUser ? Signup(login: widget.login,) : Signin(login: widget.login,),
      ),
    );
  }
}

class Signup extends StatelessWidget {
  const Signup({
    Key key,
    //@required this.widget,
    @required this.login,
  }) : super(key: key);
  final VoidCallback login;
  //final LoginPage widget;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = new TextEditingController();
    TextEditingController usernameController = new TextEditingController();
    TextEditingController firstNameController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          TextField(
            controller: emailController,
            decoration: InputDecoration(hintText: "Email"),
          ),
          TextField(
            controller: usernameController,
            decoration: InputDecoration(hintText: "Username"),
          ),
          TextField(
            controller: firstNameController,
            decoration: InputDecoration(hintText: "First name"),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(hintText: "Password"),
          ),
          FlatButton(
            color: Colors.green,
            child: Text("Sign up for gods sake"),
            onPressed: () {
              if (usernameController.text != null ||
                  passwordController.text != null ||
                  emailController.text != null) {
                userBloc
                    .registerUser(
                        usernameController.text,
                        firstNameController.text ?? "",
                        "",
                        passwordController.text,
                        emailController.text)
                    .then((_) {
                  login();
                });
              }
            },
          )
        ],
      ),
    );
  }
}

class Signin extends StatelessWidget {
  const Signin({
    Key key,
    @required this.login,
  }) : super(key: key);
  final VoidCallback login;
  //final BuildContext context;
  //final LoginPage widget;

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameText = new TextEditingController();
    TextEditingController passwordText = new TextEditingController();
    return Container(
      margin: EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Welcome!", style: bigLightBlueTitle),
          Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Theme(
                  data: Theme.of(context)
                      .copyWith(splashColor: Colors.transparent),
                  child: TextField(
                    controller: usernameText,
                    autofocus: false,
                    style: TextStyle(fontSize: 22.0, color: darkGreyColor),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Username',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),
                ),
                Theme(
                  data: Theme.of(context)
                      .copyWith(splashColor: Colors.transparent),
                  child: TextField(
                    controller: passwordText,
                    autofocus: false,
                    style: TextStyle(fontSize: 22.0, color: darkGreyColor),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  child: Text(
                    "Sign in",
                    style: redTodoTitle,
                  ),
                  onPressed: () {
                    if (usernameText.text != null ||
                        passwordText.text != null) {
                      userBloc
                          .signinUser(usernameText.text, passwordText.text, "")
                          .then((_) {
                        login();
                      });
                    }
                  },
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  "Don't you even have an account yet?!",
                  style: redText,
                  textAlign: TextAlign.center,
                ),
                FlatButton(
                  child: Text("create one", style: redBoldText),
                  onPressed: () {
                    Navigator.pushNamed(context, SignupViewRoute);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
