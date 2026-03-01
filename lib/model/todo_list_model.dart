class TodoListModel {
  String? sId;
  String? title;
  String? description;
  String? createdDate;
  int? iV;

  TodoListModel({
    this.sId,
    this.title,
    this.description,
    this.createdDate,
    this.iV,
  });

  TodoListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    createdDate = json['created_date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['created_date'] = createdDate;
    data['__v'] = iV;
    return data;
  }
}