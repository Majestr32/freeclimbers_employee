import 'package:climbers/data/shared_prefs/app_shared_prefs_contract.dart';

class TutorialRepository{
  final IAppSharedPrefs _appSharedPrefs;

  bool isHomeTutorialCompleted() => _appSharedPrefs.isHomeTutorialCompleted();
  bool isMenuTutorialCompleted() => _appSharedPrefs.isMenuTutorialCompleted();
  Future<void> endHomeTutorial() => _appSharedPrefs.endHomeTutorial();
  Future<void> endMenuTutorial() => _appSharedPrefs.endMenuTutorial();

  const TutorialRepository({
    required IAppSharedPrefs appSharedPrefs,
  }) : _appSharedPrefs = appSharedPrefs;
}