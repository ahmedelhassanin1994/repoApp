
class ModelLangouage{
  String? name;
  String? icon;
  String? code;
  String? text;
  String? storeViewCode;

  ModelLangouage(
      {this.name, this.icon, this.code, this.text, this.storeViewCode});

  ModelLangouage.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    code = json['code'];
    text = json['text'];
    storeViewCode = json['storeViewCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['code'] = this.code;
    data['text'] = this.text;
    data['storeViewCode'] = this.storeViewCode;
    return data;
  }
}