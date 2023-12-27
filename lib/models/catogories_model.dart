class CategoriesModel {
  bool? status;
  CatogoriesDataModel? data;

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = CatogoriesDataModel.fromJson(json['data']);
  }
}

class CatogoriesDataModel {
  List<DataOfCatrgory>? dataOfCatogry;

  CatogoriesDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      dataOfCatogry = <DataOfCatrgory>[];
      json['data'].forEach((element) {
        dataOfCatogry!.add(DataOfCatrgory.fromJson(element));
      });
    }
  }
}

class DataOfCatrgory {
  int? id;
  String? name;
  String? image;
  DataOfCatrgory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
