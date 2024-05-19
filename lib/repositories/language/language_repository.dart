import '../../data/shared_prefs/app_shared_prefs_contract.dart';

class LanguageRepository{
  final IAppSharedPrefs? _appSharedPrefs;


  String? getLanguage() => _appSharedPrefs?.getLanguage();

  void setLanguage(String locale) => _appSharedPrefs!.setLanguage(locale);

  const LanguageRepository({
    required IAppSharedPrefs? appSharedPrefs,
  }) : _appSharedPrefs = appSharedPrefs;
}