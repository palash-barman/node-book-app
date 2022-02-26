import 'package:crud_firestore_app/screen/add_item_form.dart';
import 'package:crud_firestore_app/screen/appbar.dart';
import 'package:flutter/material.dart';
class AddScreen extends StatelessWidget {
  final FocusNode _titleFocusNode= FocusNode();
  final FocusNode _descriptionFocusNode=FocusNode();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xFF2C384A),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.teal,
          title: AppBarTitle(sectionName: '   App'),
        ),
        body: SafeArea(child: Padding(
            padding:const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 16.0 ,top: 10),
            child: AddItemForm(
              titleFocusNode:_titleFocusNode,
              descriptionFocusNode :_descriptionFocusNode,
            ),
        )
        ),
      ),
    );
  }
}
