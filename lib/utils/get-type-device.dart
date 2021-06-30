import 'package:actu/utils/type-devices.dart';

DeviceType getTypeDevice(double width) {
  if (width < 1000) return DeviceType.Phone;
  return DeviceType.Laptop;
}
