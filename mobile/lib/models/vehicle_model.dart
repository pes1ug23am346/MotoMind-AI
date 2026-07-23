class VehicleModel {
  final String id;
  final String nickname;
  final String make;
  final String model;
  final int? year;
  final String fuelType;
  final double odometer;

  VehicleModel({
    required this.id,
    required this.nickname,
    required this.make,
    required this.model,
    this.year,
    required this.fuelType,
    required this.odometer,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json["_id"] ?? "",
      nickname: json["nickname"] ?? "",
      make: json["make"] ?? "",
      model: json["model"] ?? "",
      year: json["year"],
      fuelType: json["fuelType"] ?? "petrol",
      odometer: (json["odometer"] ?? 0).toDouble(),
    );
  }
}
