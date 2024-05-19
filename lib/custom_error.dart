class CustomError implements Exception{
  final int code;
  final List<String> targets;
  final String? localizationCode;
  final String message;

  const CustomError({
    required this.code,
    required this.message,
    this.localizationCode,
    this.targets = const []
  });
}