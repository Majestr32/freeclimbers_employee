import 'dart:typed_data';

abstract class IMemberCardService{
  Future<bool> openPkPass(Uint8List data);
}