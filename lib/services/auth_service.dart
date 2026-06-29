import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AuthService {


final FirebaseAuth _auth =
FirebaseAuth.instance;


final FirebaseFirestore _firestore =
FirebaseFirestore.instance;



// إرسال OTP

Future<void> sendOTP({

required String phone,

required Function(String verificationId) onCodeSent,

required Function(String error) onError,

}) async {



String fullNumber = "+223$phone";



await _auth.verifyPhoneNumber(


phoneNumber: fullNumber,



verificationCompleted:

(PhoneAuthCredential credential) async {


await _auth.signInWithCredential(
credential
);


},



verificationFailed:

(FirebaseAuthException e){


onError(
e.message ?? "خطأ في التحقق"
);


},



codeSent:

(String verificationId, int? resendToken){


onCodeSent(
verificationId
);


},



codeAutoRetrievalTimeout:

(String verificationId){},



);


}





// التحقق من OTP

Future<UserCredential?> verifyOTP({

required String verificationId,

required String smsCode,


}) async {



PhoneAuthCredential credential =

PhoneAuthProvider.credential(


verificationId:
verificationId,


smsCode:
smsCode,


);



UserCredential result =

await _auth.signInWithCredential(
credential
);



return result;


}




// حفظ بيانات المستخدم

Future<void> createUser({

required String uid,

required String phone,


}) async {



await _firestore

.collection("users")

.doc(uid)

.set({


"id":uid,


"phone":"+223$phone",


"name":"",


"city":"",


"role":"buyer",


"createdAt":

Timestamp.now(),



});



}





// المستخدم الحالي

User? get currentUser =>

_auth.currentUser;



}
