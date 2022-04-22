class Archives {
  String? id;
  String? url;
  String? fileName;
  String? fileType;

  Archives({this.id, this.url, this.fileName, this.fileType});

  Archives.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    fileName = json['fileName'];
    fileType = json['fileType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['fileName'] = fileName;
    data['fileType'] = fileType;
    return data;
  }
}
