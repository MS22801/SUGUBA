class UserModel {


final String id;

final String phone;

final String name;

final String city;

final String role;



UserModel({

required this.id,

required this.phone,

required this.name,

required this.city,

required this.role,

});




Map<String,dynamic> toMap(){


return {


"id":id,

"phone":phone,

"name":name,

"city":city,

"role":role,


"createdAt":

DateTime.now(),


};


}





factory UserModel.fromMap(

Map<String,dynamic> map

){


return UserModel(


id:
map["id"] ?? "",


phone:
map["phone"] ?? "",


name:
map["name"] ?? "",


city:
map["city"] ?? "",


role:
map["role"] ?? "buyer",


);


}



}
