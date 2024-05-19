import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_token.freezed.dart';
part 'access_token.g.dart';

@freezed
class AccessToken with _$AccessToken {
  const AccessToken._();

  const factory AccessToken({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'expires_in') required int expiresIn,
    @JsonKey(name: 'refresh_token') required String refreshToken
  }) = _AccessToken;

  factory AccessToken.fromJson(Map<String, Object?> json) => _$AccessTokenFromJson(json);


}