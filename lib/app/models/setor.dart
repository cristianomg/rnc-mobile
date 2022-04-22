class Setor {
  int? id;
  String? name;
  String? supervisorId;
  String? updatedBy;

  Setor({this.id, this.name, this.supervisorId, this.updatedBy});

  Setor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    supervisorId = json['supervisorId'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['supervisorId'] = supervisorId;
    data['updatedBy'] = updatedBy;
    return data;
  }
}
