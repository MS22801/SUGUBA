class ProductModel {



final String id;

final String title;

final String description;

final double price;

final String category;

final String city;

final String image;

final String sellerId;



ProductModel({

required this.id,

required this.title,

required this.description,

required this.price,

required this.category,

required this.city,

required this.image,

required this.sellerId,

});





Map<String,dynamic> toMap(){


return{


"title":title,

"description":description,

"price":price,

"currency":"CFA",

"category":category,

"city":city,

"image":image,

"sellerId":sellerId,


"createdAt":

DateTime.now(),


};


}





factory ProductModel.fromMap(

Map<String,dynamic> map,

String id

){



return ProductModel(


id:id,


title:
map["title"] ?? "",


description:
map["description"] ?? "",


price:
(map["price"] ?? 0).toDouble(),


category:
map["category"] ?? "",


city:
map["city"] ?? "",


image:
map["image"] ?? "",


sellerId:
map["sellerId"] ?? "",


);



}



}
