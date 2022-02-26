import 'package:crud_firestore_app/screen/login_from_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final FocusNode _uidFocusNode = FocusNode();

  Future<FirebaseApp> _initializeFirebase()async{

    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>_uidFocusNode.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SafeArea(
            child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Image.asset(
                          "assets/images/notebook.png",
                          height: 160,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Private',
                        style:
                            TextStyle(fontSize: 40, color: Colors.yellowAccent),
                      ),
                      Text(
                        'Note Book',
                        style:
                            TextStyle(fontSize: 40, color: Colors.orangeAccent),
                      ),
                    ],
                  ),
                  ),
                  FutureBuilder(
                    future: _initializeFirebase(),
                      builder:(context, snapshot){
                      if(snapshot.hasError){
                        return Text("Error initialize Firebase");
                      }
                      else if(snapshot.connectionState==ConnectionState.done){
                        return LoginForm(focusNode : _uidFocusNode);
                      }
                      return CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),

                      );

                      }
                  )


                ],
              ),
            )
          ],
        ),
        ),
      ),
    );
  }
}
