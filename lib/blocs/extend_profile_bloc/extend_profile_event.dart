part of 'extend_profile_bloc.dart';

@freezed
class ExtendProfileEvent with _$ExtendProfileEvent {
  const factory ExtendProfileEvent.checkIfProblemExist({required MemberData memberData}) = _CheckIfProblemExistEvent;
  const factory ExtendProfileEvent.extendProfile({required MemberData updateFields}) = _ExtendProfileEvent;
}
