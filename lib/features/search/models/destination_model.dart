class DestinationModel {
  List<Ports>? ports;

  DestinationModel({this.ports});

  DestinationModel.fromJson(Map<String, dynamic> json) {
    if (json['ports'] != null) {
      ports = <Ports>[];
      json['ports'].forEach((v) {
        ports!.add(new Ports.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ports != null) {
      data['ports'] = this.ports!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ports {
  String? code;
  String? explanation;
  String? explanationOnly;
  String? codeOnly;

  Ports({this.code, this.explanation, this.explanationOnly, this.codeOnly});

  Ports.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    explanation = json['explanation'];
    explanationOnly = json['explanationOnly'];
    codeOnly = json['codeOnly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['explanation'] = this.explanation;
    data['explanationOnly'] = this.explanationOnly;
    data['codeOnly'] = this.codeOnly;
    return data;
  }
}