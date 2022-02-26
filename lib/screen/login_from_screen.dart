import 'package:crud_firestore_app/coustom_form_feild.dart';
import 'package:crud_firestore_app/screen/home.dart';
import 'package:crud_firestore_app/validators/database.dart';
import 'package:crud_firestore_app/validators/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final FocusNode focusNode;
  const LoginForm({
    Key? key,
    required this.focusNode,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController uidController = TextEditingController();
  final _LoginFormkeys = GlobalKey<FormState>();
  String getId = "";
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _LoginFormkeys,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: Column(
                children: [
                  CoustomFormField(
                    textStyle: TextStyle(color: Colors.black),
                    isObscureText: true,
                    initialvale:'',
                    textAlign: TextAlign.start,
                    textEditingController: uidController,
                    focusNode: widget.focusNode,
                    keybordtype: TextInputType.text,
                    inputAction: TextInputAction.done,
                    lebal: 'Unique User Id ',
                    hint: 'Enter Your Unique Indentifier',
                    validator: (value) { Validator.validateUserId(
                      uid: value,
                    );
                    getId=value;
                    }
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0,top: 12.0,bottom: 15),
              child: Container(
                width: double.maxFinite,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.orangeAccent),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    widget.focusNode.unfocus();
                    if(_LoginFormkeys.currentState!.validate()){
                      DataBase.userId=getId;
                      
                      Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context)=>HomeScreen()));

                    }

                  },
                  child: Padding(
                    padding: EdgeInsets.only( left: 16.0, right: 16.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.blueGrey,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
