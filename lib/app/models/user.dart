class User {
  String? completeName;
  String? email;
  String? enrollment;
  int? setor;
  int? userPermissionId;

  User(
      {this.completeName,
      this.email,
      this.enrollment,
      this.setor,
      this.userPermissionId});

  User.fromJson(Map<String, dynamic> json) {
    completeName = json['completeName'];
    email = json['email'];
    enrollment = json['enrollment'];
    setor = json['setor'];
    userPermissionId = json['userPermissionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['completeName'] = completeName;
    data['email'] = email;
    data['enrollment'] = enrollment;
    data['setor'] = setor;
    data['userPermissionId'] = userPermissionId;
    return data;
  }
}
