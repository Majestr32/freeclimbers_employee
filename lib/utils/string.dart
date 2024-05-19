
import 'dart:math';

extension SplitEvery on String{
  String splitEvery([int size = 1, String delimeter = " "]){
    var chunks = <String>[];
    String str = split('').reversed.join();
    for (var i = 0, charsLength = str.length; i < charsLength; i += 3) {
      chunks.add(str.substring(i, min(str.length,i+3)));
      chunks.add(delimeter);
    }
    return chunks.reversed.map((e) => e.split('').reversed.join()).join();
  }
}