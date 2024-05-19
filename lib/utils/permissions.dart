import 'package:universal_io/io.dart';

import 'package:permission_handler/permission_handler.dart';

Future<void> requestStoragePermissions() async{
    await Permission.storage.request();
}