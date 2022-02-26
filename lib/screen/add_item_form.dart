import 'package:crud_firestore_app/coustom_form_feild.dart';
import 'package:crud_firestore_app/validators/database.dart';
import 'package:crud_firestore_app/validators/validator.dart';
import 'package:flutter/material.dart';

class AddItemForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode descriptionFocusNode;
  const AddItemForm({
    required this.titleFocusNode,
    required this.descriptionFocusNode,
  });

  @override
  _AddItemFormState createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final _additemformkey = GlobalKey<FormState>();

  bool _isprossing = false;

  TextEditingController _titleContorler = TextEditingController();
  TextEditingController _descriptionContorler = TextEditingController();

  String getTitle = "";
  String getDecption = "";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: _additemformkey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Title",
                      style: TextStyle(
                        color: Colors.purpleAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    CoustomFormField(
                      initialvale: "",
                      textAlign: TextAlign.start,
                      textStyle: TextStyle(color: Colors.cyanAccent),
                        isLabelEnabled: false,
                        textEditingController: _titleContorler,
                        focusNode: widget.titleFocusNode,
                        keybordtype: TextInputType.text,
                        inputAction: TextInputAction.next,
                        lebal: 'Title',
                        hint: 'Write your title',
                        validator: (value) {
                          Validator.validateField(value: value);

                          getTitle = value;
                        }),
                    SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
                          fontSize: 22,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightGreenAccent),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    CoustomFormField(
                      initialvale: "",
                        maxLine: 10,
                        isLabelEnabled: false,
                        textAlign: TextAlign.start,
                        textStyle: TextStyle(color: Colors.cyanAccent),
                        textEditingController: _descriptionContorler,
                        focusNode: widget.descriptionFocusNode,
                        keybordtype: TextInputType.text,
                        inputAction: TextInputAction.next,
                        lebal: 'Description',
                        hint: 'Write your description',
                        validator: (value) {
                          Validator.validateField(value: value);

                          getDecption = value;
                        })
                  ],
                ),
              ),
              _isprossing
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                      ),
                    )
                  : Container(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () async {
                          widget.titleFocusNode.unfocus();
                          widget.descriptionFocusNode.unfocus();

                          if (_additemformkey.currentState!.validate()) {
                            setState(() {
                              _isprossing = true;
                            });
                            await DataBase.addItem(
                                title: getTitle, description: getDecption);

                            setState(() {
                              _isprossing = false;
                            });

                            Navigator.of(context).pop();
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.orangeAccent),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                          child: Text(
                            'Add Data',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.blueGrey,
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                    ),
            ],
          )),
    );
  }
}
