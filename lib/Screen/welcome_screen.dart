import 'package:BroCode_FlutterApp/Screen/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Welcome to WhatsApp",
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),
              SizedBox(height: 90.0),
              Container(
                height: 300.0,
                width: 300.0,
                child: Image.asset('assets/brand.png'),
              ),
              SizedBox(height: 60.0),
              Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Read out privacy policy Tap, 'Agree and continue' to accept the Terms of Services",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(height: 10.0),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RegistrationScreen();
                      },
                    ),
                  );
                },
                color: Colors.green,
                child: Text(
                  "Agree and Continue",
                  style: TextStyle(
                      backgroundColor: Colors.green,
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
