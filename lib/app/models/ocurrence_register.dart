import 'ocurrence.dart';

class OcurrenceRegister {
  String? id;
  String? userName;
  String? date;
  String? hour;
  String? peopleInvolved;
  String? moreInformation;
  String? immediateAction;
  List<Occurrences>? occurrences;
  String? setor;
  int? occurrencePendency;
  int? occurrenceTypeId;
  String? occurrenceType;
  bool? isDelayed;
  String? occurrenceClassification;
  bool? canVerifyEffectiveness;

  OcurrenceRegister(
      {this.id,
      this.userName,
      this.date,
      this.hour,
      this.peopleInvolved,
      this.moreInformation,
      this.immediateAction,
      this.occurrences,
      this.setor,
      this.occurrencePendency,
      this.occurrenceTypeId,
      this.occurrenceType,
      this.isDelayed,
      this.occurrenceClassification,
      this.canVerifyEffectiveness});

  OcurrenceRegister.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    date = json['date'];
    hour = json['hour'];
    peopleInvolved = json['peopleInvolved'];
    moreInformation = json['moreInformation'];
    immediateAction = json['immediateAction'];
    if (json['occurrences'] != null) {
      occurrences = <Occurrences>[];
      json['occurrences'].forEach((v) {
        occurrences!.add(Occurrences.fromJson(v));
      });
    }
    setor = json['setor'];
    occurrencePendency = json['occurrencePendency'];
    occurrenceTypeId = json['occurrenceTypeId'];
    occurrenceType = json['occurrenceType'];
    isDelayed = json['isDelayed'];
    occurrenceClassification = json['occurrenceClassification'];
    canVerifyEffectiveness = json['canVerifyEffectiveness'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['date'] = date;
    data['hour'] = hour;
    data['peopleInvolved'] = peopleInvolved;
    data['moreInformation'] = moreInformation;
    data['immediateAction'] = immediateAction;
    if (occurrences != null) {
      data['occurrences'] = occurrences!.map((v) => v.toJson()).toList();
    }
    data['setor'] = setor;
    data['occurrencePendency'] = occurrencePendency;
    data['occurrenceTypeId'] = occurrenceTypeId;
    data['occurrenceType'] = occurrenceType;
    data['isDelayed'] = isDelayed;
    data['occurrenceClassification'] = occurrenceClassification;
    data['canVerifyEffectiveness'] = canVerifyEffectiveness;
    return data;
  }
}
