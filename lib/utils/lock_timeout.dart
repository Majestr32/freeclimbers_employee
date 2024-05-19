enum LockTimeout{
  instant('Instant', 'Sofort', Duration.zero),
  seconds30('30 Seconds', '30 Sekunden', Duration(seconds: 30)),
  minutes1('1 Minute', '1 Minute', Duration(minutes: 1)),
  minutes2('2 Minutes', '2 Minuten', Duration(minutes: 2)),
  minutes3('3 Minutes', '3 Minuten', Duration(minutes: 3)),
  minutes5('5 Minutes', '5 Minuten', Duration(minutes: 5)),
  minutes10('10 Minutes', '10 Minuten', Duration(minutes: 10)),
  minutes30('30 Minutes', '30 Minuten', Duration(minutes: 30)),
  hours1('1 Hour', '1 Stunde', Duration(hours: 1)),
  hours2('2 Hours', '2 Stunden', Duration(hours: 2)),
  hours3('3 Hours', '3 Stunden', Duration(hours: 3)),
  hours6('6 Hours', '6 Stunden', Duration(hours: 6)),
  hours12('12 Hours', '12 Stunden', Duration(hours: 12));

  final String textEnglish;
  final String textGerman;
  final Duration duration;

  static LockTimeout findByDuration(int seconds){
    return LockTimeout.values.firstWhere((e) => e.duration.inSeconds == seconds, orElse: () => LockTimeout.seconds30);
  }

  String text(String locale) => locale == 'de' ? textGerman : textEnglish;

  const LockTimeout(this.textEnglish,this.textGerman,this.duration);
}