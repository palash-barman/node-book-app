import 'package:crud_firestore_app/screen/appbar.dart';
import 'package:crud_firestore_app/screen/edit_form_screen.dart';
import 'package:crud_firestore_app/validators/database.dart';
import 'package:flutter/material.dart';
class EditScreen extends StatefulWidget {

  final String correntTitle;
  final String correntDescription;
  final String documentId;
  EditScreen({
   required this.correntTitle,
    required this.correntDescription,
    required this.documentId,
});




  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final FocusNode _titileFocusNode = FocusNode();
  final FocusNode _descriptionFocuNode= FocusNode();

  bool _isDeleting = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _titileFocusNode.unfocus();
        _descriptionFocuNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xff4d796f),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.teal,
          title: AppBarTitle(sectionName: '  App',),
          actions: [
            _isDeleting
            ? Padding(padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,right: 16.0),
            child:CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.redAccent
              ),
              strokeWidth: 3,
            ),
            ):Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(onPressed: ()async{
                setState(() {
                  _isDeleting=true;
                });
                await DataBase.daleteItem(
                    docId:widget.documentId,
                );
                setState(() {
                  _isDeleting=false;
                });
                Navigator.of(context).pop();

              }, icon: Icon(Icons.delete_forever,color: Colors.redAccent,size:32,),
              ),
            )
          ],

        ),
        body: SafeArea(child: Padding(padding: EdgeInsets.only(left: 16.0,right: 16.0,bottom: 20.0),
        child:EditFormScreen(
          documentId: widget.documentId,
          titleFocusNode: _titileFocusNode,
          descriptionFocusNode : _descriptionFocuNode,
          currentTitle:widget.correntTitle,
          currentDescription:widget.correntDescription,
        ) ,
        )
        ),

      ),


    );
  }
}
