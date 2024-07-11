part of 'tutorial_bloc.dart';

@freezed
class TutorialState with _$TutorialState {
  const TutorialState._();

  bool get isHomeTutorialEnded => maybeMap(
      initialized: (state) => state.isHomeTutorialEnded,
      orElse: () => false);

  bool get isMenuTutorialEnded => maybeMap(
      initialized: (state) => state.isMenuTutorialEnded,
      orElse: () => false);

  TutorialState get endedHomeTutorial => map(initial: (state) => state, initialized: (state) => state.copyWith.call(isHomeTutorialEnded: true));
  TutorialState get endedMenuTutorial => map(initial: (state) => state, initialized: (state) => state.copyWith.call(isMenuTutorialEnded: true));

  const factory TutorialState.initial() = _InitialState;
  const factory TutorialState.initialized({required bool isHomeTutorialEnded, required bool isMenuTutorialEnded}) = _InitializedState;
}
