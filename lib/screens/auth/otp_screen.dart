import 'package:flutter/material.dart';

import '../../services/auth_service.dart';

import '../home/home_screen.dart';



class OTPScreen extends StatefulWidget {



final String verificationId;

final String phone;



const OTPScreen({

super.key,

required this.verificationId,

required this.phone,

});




@override

State<OTPScreen> createState()

=> _OTPScreenState();


}




class _OTPScreenState

extends State<OTPScreen>{



final codeController =

TextEditingController();



final AuthService auth =

AuthService();





void verify() async {



var user =

await auth.verifyOTP(



verificationId:

widget.verificationId,



smsCode:

codeController.text,


);





if(user != null){



await auth.createUser(


uid:

user.user!.uid,



phone:

widget.phone,


);





Navigator.pushReplacement(



context,



MaterialPageRoute(



builder:

(_)=>


const HomeScreen(),


),



);



}




}




@override

Widget build(BuildContext context){



return Scaffold(



appBar:

AppBar(

title:

const Text(

"OTP"

),

),



body:

Padding(



padding:

const EdgeInsets.all(25),



child:

Column(



children:[



TextField(



controller:

codeController,



keyboardType:

TextInputType.number,



decoration:

const InputDecoration(

labelText:

"أدخل رمز SMS",

border:

OutlineInputBorder(),

),

),



const SizedBox(height:20),



ElevatedButton(



onPressed:

verify,



child:

const Text(

"تأكيد"

),



)



],



),



),



);



}


}
