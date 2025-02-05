class UserModel {
  String? name;
  String? email;
  String? phone;
  String? token;
  String? image;

  // DEFAULT Constructor
  UserModel(this.name, this.email, this.phone, this.token, this.image);

  UserModel.fromJSON({required Map<String, dynamic> data}) {
    // refactor map | json
    name = data['name'];
    email = data['email'];
    phone = data['phone'];
    token = data['token'];
    image = data['image'];
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'token': token,
      'image': image
    };
  }
}
