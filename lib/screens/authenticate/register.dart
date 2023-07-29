import 'package:companion_app_main/shared/constants.dart';
import 'package:companion_app_main/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:companion_app_main/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  String password = '';
  String email = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        title: Text('Sign Up to App'),
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text('Sign In'),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.freepik.com/free-vector/blur-pink-blue-abstract-gradient-background-vector_53876-174836.jpg?w=360&t=st=1689808163~exp=1689808763~hmac=a4fec308281a82afc0e11422eeaf5649a0758c2ceca57dc46f7efe37c18e1391'), // Replace 'assets/background_image.jpg' with the path to your image
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                // Widget to input user's email
                decoration: textInputDecoration.copyWith(hintText: 'Enter email'),
                validator: (val) => val?.isEmpty ?? true ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                // Password from user
                decoration: textInputDecoration.copyWith(hintText: 'Enter password'),
                validator: (val) => (val?.length ?? 0) < 6 ? 'Password length greater than 6 is mandatory' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                // Register button
                onPressed: () async {
                  if (_formkey.currentState?.validate() ?? false) {
                    setState(() => loading = true);
                    dynamic res = await _auth.registerwithEandP(email, password);
                    if (res == null) {
                      setState(() {
                        loading = false;
                        error = 'Please provide a valid email id';
                      });
                    }
                  }
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
