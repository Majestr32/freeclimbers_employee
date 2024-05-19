import 'dart:typed_data';

import '../../services/membercard/membercard_service_contract.dart';

class MemberCardRepository{
  final IMemberCardService _memberCardService;

  Future<bool> openPkPass(Uint8List data) => _memberCardService.openPkPass(data);

  const MemberCardRepository({
    required IMemberCardService memberCardService,
  }) : _memberCardService = memberCardService;
}