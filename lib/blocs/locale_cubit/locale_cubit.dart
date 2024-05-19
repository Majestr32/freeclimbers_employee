import 'package:universal_io/io.dart';

import 'package:bloc/bloc.dart';

import '../../l10n/l10n.dart';
import '../../repositories/language/language_repository.dart';

class LocaleCubit extends Cubit<String> {
  final LanguageRepository _languageRepository;

  void changeLanguage(String locale){
    _languageRepository.setLanguage(locale);
    emit(locale);
  }

  LocaleCubit({required LanguageRepository languageRepository}) :
        _languageRepository = languageRepository,
        super('en'){
    final defaultLocale = L10n.all.map((e) => e.languageCode).firstWhere((e) => Platform.localeName.contains(e), orElse: () => 'en');
    final lang = languageRepository.getLanguage() ?? defaultLocale;
    emit(lang);
  }
}
