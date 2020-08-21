import 'package:animation_tutorial/UI/Register_page.dart';
import 'package:animation_tutorial/UI/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:spring_button/spring_button.dart';



class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/as.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height/2.6,
                  width: MediaQuery.of(context).size.width/2.6,
                  child: Hero(
                    tag: 'logo',
                      child: Image.asset('assets/1.png'))),
            ),
            SpringButton(
              SpringButtonType.OnlyScale,
                Padding(
                  padding: EdgeInsets.all(12.5),
                  child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.5,
                        ),
                      ),
                    ),
                  ),
                ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
            ),
            SpringButton(
              SpringButtonType.OnlyScale,
              Padding(
                padding: EdgeInsets.all(12.5),
                child: Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue[500],
                    borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
                  ),
                  child: Center(
                    child: Text(
                      'Register',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.5,
                      ),
                    ),
                  ),
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
              },
            )

          ],
        ),
      ),
    );
  }
}
