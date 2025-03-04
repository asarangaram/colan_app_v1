import 'package:package_info_plus/package_info_plus.dart';

Future<String> getDartExtensionsVersion() async {
  final packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}
