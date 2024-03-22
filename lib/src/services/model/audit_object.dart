class AuditObject {
  List<Data>? data;

  AuditObject({this.data});

  AuditObject.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? iD;
  String? objectName;
  String? objectDescription;
  int? objectType;
  String? dateCreated;
  int? createdBy;

  Data(
      {this.iD,
        this.objectName,
        this.objectDescription,
        this.objectType,
        this.dateCreated,
        this.createdBy});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    objectName = json['object_name'];
    objectDescription = json['object_description'];
    objectType = json['object_type'];
    dateCreated = json['date_created'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['object_name'] = this.objectName;
    data['object_description'] = this.objectDescription;
    data['object_type'] = this.objectType;
    data['date_created'] = this.dateCreated;
    data['created_by'] = this.createdBy;
    return data;
  }
}
