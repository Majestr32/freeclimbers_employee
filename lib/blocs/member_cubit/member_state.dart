part of 'member_cubit.dart';

enum MemberStateStatus {
  unknown,
  unauthenticated,
  authenticated,
  loading,
  updateOperationSuccess,
  memberCardDownloaded,
  registrationSuccess,
  sentEmail,
  error
}

class MemberState extends Equatable {
  final MemberStateStatus status;
  final AccessToken? accessToken;
  final MemberData? memberData;
  final MemberRegistrationCode? memberRegistrationCode;
  final Uint8List? profileImage;
  final File? passFile;
  final CustomError? error;

  factory MemberState.initial(){
    return const MemberState(status: MemberStateStatus.unknown,);
  }

  factory MemberState.unauthenticated(){
    return MemberState(status: MemberStateStatus.unauthenticated,);
  }


  MemberState removeImage() {
    return MemberState(
      status: status,
      accessToken: accessToken,
      memberData: memberData,
        profileImage: null,
      error: error,
      memberRegistrationCode: memberRegistrationCode
    );
  }

  const MemberState({
    required this.status,
    this.accessToken,
    this.memberData,
    this.memberRegistrationCode,
    this.profileImage,
    this.passFile,
    this.error,
  });

  MemberState copyWith({
    MemberStateStatus? status,
    AccessToken? accessToken,
    MemberData? memberData,
    MemberRegistrationCode? memberRegistrationCode,
    Uint8List? profileImage,
    bool? pushMessages,
    bool? requiredPin,
    bool? loginWithFaceId,
    File? passFile,
    CustomError? error,
  }) {
    return MemberState(
      status: status ?? this.status,
      accessToken: accessToken ?? this.accessToken,
      memberData: memberData ?? this.memberData,
      memberRegistrationCode:
      memberRegistrationCode ?? this.memberRegistrationCode,
      profileImage: profileImage ?? this.profileImage,
      passFile: passFile ?? this.passFile,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props =>
      [
        status,
        accessToken,
        memberData,
        memberRegistrationCode,
        profileImage,
        passFile,
        error,
      ];
}
