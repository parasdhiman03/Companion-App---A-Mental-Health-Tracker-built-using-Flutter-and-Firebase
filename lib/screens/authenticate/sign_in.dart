import 'package:companion_app_main/services/auth.dart';
import 'package:companion_app_main/shared/constants.dart';
import 'package:companion_app_main/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});


  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey=GlobalKey<FormState>();
  final AuthService _auth=AuthService();
  bool loading=false;
  //text field state
  String email='';
  String password='';
  String error='';

  @override
  Widget build(BuildContext context) {
    return loading? Loading():Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        backgroundColor: Colors.white30,
        elevation: 0,
        title: Text('Sign In to App'),
        actions: [
          TextButton.icon(
              onPressed: (){
                widget.toggleView();
              },
              icon:Icon(Icons.person),
              label: Text('Sign Up')
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand, // Make the stack take the full space
        children: [
        Image.network(
        'https://img.freepik.com/free-vector/blur-pink-blue-abstract-gradient-background-vector_53876-174836.jpg?w=360&t=st=1689808163~exp=1689808763~hmac=a4fec308281a82afc0e11422eeaf5649a0758c2ceca57dc46f7efe37c18e1391', // Replace with your image URL
        fit: BoxFit.cover, // Adjust the image's fit as needed
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child:Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height:20),
              TextFormField(  //take email from user
                  decoration: textInputDecoration.copyWith(hintText: 'enter email'),
                  validator: (val)=>val?.isEmpty?? true? 'Enter an email':null,
                  onChanged: (val){setState(()=>email=val);
                }
              ),
              SizedBox(height: 20),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'enter password'),
                  validator: (val) => (val?.length ?? 0) < 6 ? 'Password length greater than 6 is mandatory' : null,
                  obscureText: true,
                  onChanged: (val){setState(()=>password=val);
                }
              ),
              SizedBox(height: 20),
              ElevatedButton( //button for sign in
                  onPressed: ()async {
                    if(_formkey.currentState?.validate()??false){
                      setState(()=>loading=true);
                      dynamic res=await _auth.signInwithEandP(email, password);
                      if(res==null){
                        setState((){
                          loading=false;
                          error='invalid credentials';
                        });
                      }
                    }
                  },
                  child: Text(
                    'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                  )
              ),
              SizedBox(height: 20),
              Text(
                error,
                style: TextStyle(color: Colors.red,fontSize: 14),
              ),
            ],
          ),
        )
      ),
      ],
    ),
    );
  }
}
