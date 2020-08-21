import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'Company_details_animator.dart';
import 'Register_page.dart';


class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    double devHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding:  EdgeInsets.only(top:devHeight/7.8,left: 10.0,right: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                    width: 80,
                    child: Hero(
                        tag:'logo',
                        child: Image.asset('assets/2.png',fit: BoxFit.contain,))),
                Text('Welcome!',style: TextStyle(fontSize: 32.0,color: Color(0xff636B90),fontWeight: FontWeight.w600,fontFamily: 'VarelaRound'),),
                SizedBox(height: 10,),
                Text('Learn the best of courses',style: TextStyle(fontSize: 18.0,color: Color(0xff636b90)),),
                SizedBox(height: devHeight/10,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:12.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height/9,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,offset: Offset(0.2,0.5),spreadRadius: 0.0,blurRadius: 4.0,
                        ),
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.person,color: Colors.cyan[200],size: 35,),
                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Email Address",
                              border: InputBorder.none,
                            ),
                            onChanged: (value){
                              _email = value;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:12.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height/9,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,offset: Offset(0.2,0.5),spreadRadius: 0.0,blurRadius: 4.0,
                          ),
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.security,color: Colors.cyan[200],size: 35,),
                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Your Password",
                              border: InputBorder.none,
                            ),
                            onChanged: (value){
                              _password = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Center(
                  child: SizedBox(
                    height: 60,
                    width: 130,
                    child: RaisedButton(

                      child: Text('Login',style: TextStyle(color:Colors.white,fontSize: 24.0),),
                      elevation: 6.0,
                      color: Color(0xff636b90),
                      onPressed: () async{
                        setState(() {
                          showSpinner = true;
                        });
                        try{
                          final newUser = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
                          if(newUser != null){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>CompanyDetailsAnimator()));
                          }
                        } catch(e){
                          print(e);
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: devHeight/30.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>RegisterScreen()));
                  },
                  child: Center(
                    child: Text("Don't have a account? Register Here",
                      style: TextStyle(fontSize: 16.0,color: Color(0xff636B90)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

