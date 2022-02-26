
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _maincollection=_firestore.collection('notes');

class DataBase{
  static String? userId;
  
  static Future<void> addItem({
  required String title,
    required String description,
}) async{
    DocumentReference documentReference =_maincollection.doc(userId).collection('items').doc();
    Map<String , dynamic> data = <String, dynamic>{
      "title":title,
      "description":description,
    };
    await documentReference.set(data).whenComplete(() => print("note item inserted to the database ")).catchError((e)=>print(e));
    
  }
  static Future<void> updateItem({
  required String title,
    required String description,
    required String docId,

})async{
    DocumentReference documentReference= _maincollection.doc(userId).collection('items').doc(docId);


    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
    };

    await documentReference.set(data).whenComplete(() => print("Note item update in the database")).catchError((e)=>print(e));

}

static Stream<QuerySnapshot> readItems(){
    CollectionReference notesItemCollection =_maincollection.doc(userId).collection('items');

    return notesItemCollection.snapshots();

}

static Future<void> daleteItem({
  required String docId,
}) async{
    DocumentReference documentReference=_maincollection.doc(userId).collection('items').doc(docId);

    await documentReference.delete().whenComplete(() => print('Note item deleted from the database')).catchError((e)=>print(e));


}



}



