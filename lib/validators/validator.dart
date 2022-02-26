
class Validator{
 static String? validateField({required String value}){
   if(value.isEmpty){
     return "TextField connect to empty";
   }
   return null;
 }

 static String? validateUserId({required String uid}){

   if(uid.isEmpty){
     return "UserId connect to empty";
   }
   else if(uid.length <= 5){
    return "User Id should be Geatter than 5 charters";
   }
   return null;
 }

}