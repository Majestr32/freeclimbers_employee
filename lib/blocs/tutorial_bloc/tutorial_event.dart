part of 'tutorial_bloc.dart';

@freezed
class TutorialEvent with _$TutorialEvent {
  const factory TutorialEvent.endHomeTutorial() = _EndHomeTutorialEvent;
  const factory TutorialEvent.endMenuTutorial() = _EndMenuTutorialEvent;
  const factory TutorialEvent.fetchTutorialState() = _FetchTutorialStateEvent;
}
