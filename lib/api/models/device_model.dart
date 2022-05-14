class DeviceModel {
  final String deviceId;

  const DeviceModel({required this.deviceId});

  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      DeviceModel(deviceId: json['deviceId'] as String);
}
