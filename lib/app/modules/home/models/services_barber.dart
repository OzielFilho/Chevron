import 'dart:convert';

class ServiceBarber {
  String? nameService;
  String? descriptionService;
  int? valueService;

  ServiceBarber({
    this.nameService,
    this.descriptionService,
    this.valueService,
  });

  Map<String, dynamic> toMap() {
    return {
      'name_service': nameService,
      'description_service': descriptionService,
      'value_service': valueService,
    };
  }

  factory ServiceBarber.fromMap(Map<String, dynamic> map) {
    return ServiceBarber(
      nameService: map['name_service'],
      descriptionService: map['description_service'],
      valueService: map['value_service'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceBarber.fromJson(String source) =>
      ServiceBarber.fromMap(json.decode(source));
}
