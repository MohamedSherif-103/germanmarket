class CateogreyModel {
  String? url;
  int? id;
  String? title;

  CateogreyModel.fromJson({required Map<String, dynamic> data}) {
    url = data['url'];
    id = data['id'];
    title = data['name'];
  }
}
