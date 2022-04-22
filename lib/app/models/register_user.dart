class RegisterUser {
  String? completeName;
  String? email;
  String? enrollment;
  int? setor;
  String? password;
  String? confirmPassword;
  String? userPermission;

  RegisterUser(
      {this.completeName,
      this.email,
      this.enrollment,
      this.setor,
      this.password,
      this.confirmPassword,
      this.userPermission});

  RegisterUser.fromJson(Map<String, dynamic> json) {
    completeName = json['completeName'];
    email = json['email'];
    enrollment = json['enrollment'];
    setor = json['setor'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    userPermission = json['userPermission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['completeName'] = completeName;
    data['email'] = email;
    data['enrollment'] = enrollment;
    data['setor'] = setor;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    data['userPermission'] = userPermission;
    return data;
  }
}
