import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repositories/tutorial/tutorial_repository.dart';

part 'tutorial_event.dart';
part 'tutorial_state.dart';
part 'tutorial_bloc.freezed.dart';

class TutorialBloc extends Bloc<TutorialEvent, TutorialState> {
  final TutorialRepository _tutorialRepository;
  TutorialBloc({required TutorialRepository tutorialRepository})
      : _tutorialRepository = tutorialRepository,
        super(const TutorialState.initial()) {
    on<TutorialEvent>(_mapTutorialBlocToState);
    add(const TutorialEvent.fetchTutorialState());
  }

  Future<void> _mapTutorialBlocToState(TutorialEvent event, Emitter<TutorialState> emit) => event.map(
      endHomeTutorial: (e) => _endHomeTutorial(e,emit),
      endMenuTutorial: (e) => _endMenuTutorial(e,emit),
      fetchTutorialState: (e) => _fetchTutorialState(e,emit));

  Future<void> _endHomeTutorial(_EndHomeTutorialEvent event, Emitter<TutorialState> emit) async{
    _tutorialRepository.endHomeTutorial();
    emit(state.endedHomeTutorial);
  }

  Future<void> _endMenuTutorial(_EndMenuTutorialEvent event, Emitter<TutorialState> emit) async{
    _tutorialRepository.endMenuTutorial();
    emit(state.endedMenuTutorial);
  }

  Future<void> _fetchTutorialState(_FetchTutorialStateEvent event, Emitter<TutorialState> emit) async{
    bool endedHomeTutorial = _tutorialRepository.isHomeTutorialCompleted();
    bool endedMenuTutorial = _tutorialRepository.isMenuTutorialCompleted();
    emit(TutorialState.initialized(isHomeTutorialEnded: endedHomeTutorial, isMenuTutorialEnded: endedMenuTutorial));
  }
}
