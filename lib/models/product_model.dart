class ProductModel {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? name;
  String? image;
  String? description;

  ProductModel.fromJSON({required Map<String, dynamic> data}) {
    id = data['id'].toInt();
    price = data['price'].toInt();
    oldPrice = data['old_price'].toInt();
    discount = data['discount'].toInt();
    name = data['name'].toString();
    image = data['image'].toString();
    description = data['description'].toString();
  }
}
