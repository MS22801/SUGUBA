import 'package:flutter/material.dart';

import '../../services/auth_service.dart';

import 'otp_screen.dart';



class LoginScreen extends StatefulWidget {


const LoginScreen({super.key});



@override

State<LoginScreen> createState()

=> _LoginScreenState();

}




class _LoginScreenState

extends State<LoginScreen>{



final phoneController =

TextEditingController();



final AuthService auth =

AuthService();



bool loading=false;




void sendCode() async {



setState(() {

loading=true;

});



await auth.sendOTP(


phone:
phoneController.text,



onCodeSent:

(String verificationId){



Navigator.push(


context,


MaterialPageRoute(


builder:(context)=>


OTPScreen(


verificationId:
verificationId,


phone:
phoneController.text,


),


),


);



},



onError:

(String error){



ScaffoldMessenger.of(context)

.showSnackBar(


SnackBar(

content:
Text(error),

)


);



},



);



setState(() {

loading=false;

});


}




@override

Widget build(BuildContext context){



return Scaffold(



body:

Padding(

padding:

const EdgeInsets.all(25),



child:

Column(


mainAxisAlignment:

MainAxisAlignment.center,



children:[



const Text(

"SUGUBA MALI",

style:

TextStyle(

fontSize:35,

fontWeight:

FontWeight.bold,

),

),



const SizedBox(height:40),




TextField(



controller:

phoneController,



keyboardType:

TextInputType.phone,



decoration:

const InputDecoration(


prefixText:"+223 ",



labelText:

"رقم الهاتف المالي",


border:

OutlineInputBorder(),


),



),



const SizedBox(height:20),



ElevatedButton(



onPressed:

loading

? null

: sendCode,



child:

loading

?

const CircularProgressIndicator()

:

const Text(

"إرسال الرمز"

),



)



],



),



),



);



}



}
