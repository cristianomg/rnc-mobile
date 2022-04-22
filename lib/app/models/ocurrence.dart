import 'archives.dart';

class Occurrences {
  String? id;
  String? description;
  List<Archives>? archives;

  Occurrences({this.id, this.description, this.archives});

  Occurrences.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    if (json['archives'] != null) {
      archives = <Archives>[];
      json['archives'].forEach((v) {
        archives!.add(Archives.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    if (archives != null) {
      data['archives'] = archives!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
