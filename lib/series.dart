import 'dart:math';

class Series {
  final Map<String, List<num>> series = {
    "o1": List<num>.generate(1024, (index) => index),
    "o2": List<num>.generate(2048, (index) => index * index),
    "o3": List<num>.generate(512, (index) => index * sqrt(index)),
  };
  Set<String> get labels => Set.from(series.keys);

  void addSeries(String label, List<num> values) {
    if (series[label] != null) return;
    series[label] = values;
  }

  int get maxLength {
    int max = 0;
    for (MapEntry<String, List<num>> entry in series.entries) {
      final int len = entry.value.length;
      if (max < len) max = len;
    }
    return max;
  }

  Map<String, num> get1Dimension(int index) {
    final Map<String, num> ret = {};
    for (MapEntry<String, List<num>> entry in series.entries) {
      ret[entry.key] = entry.value.length > index ? entry.value[index] : 0;
    }

    return ret;
  }

  List<num> getSeries(String label) => series[label] ?? [];
  num getValue(String label, int index) {
    final List<num> s = getSeries(label);
    if (s.length > index) return s[index];
    return 0;
  }
  // final List<num> o1 = List.generate(1024, (index) => index),
  //     o2 = List.generate(1024, (index) => index * index),
  //     o3 = List.generate(1024, (index) => index * sqrt(index));
}
