class CateogreyModel {
  String? url;
  int? id;
  String? title;

  CateogreyModel.fromJson({required Map<String, dynamic> data}) {
    url = data['image'];
    id = data['id'];
    title = data['name'];
  }
}
