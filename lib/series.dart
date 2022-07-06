import 'dart:math';

class Series {
  final Map<String, List<num>> _series = {
    "o1": List.generate(1024, (index) => index),
    "o2": List.generate(2048, (index) => index * index),
    "o3": List.generate(512, (index) => index * sqrt(index)),
  };

  int get maxLength {
    int max = 0;
    for (MapEntry<String, List<num>> entry in _series.entries) {
      if (max < entry.value.length) max = entry.value.length;
    }
    return max;
  }

  Set<String> get labels => Set.from(_series.keys);
  Map<String, num> get1Dimension(int index) {
    final Map<String, num> ret = {};
    for (MapEntry<String, List<num>> entry in _series.entries) {
      ret[entry.key] = entry.value.length > index ? entry.value[index] : 0;
    }

    return ret;
  }

  List<num> getSeries(String label) => _series[label] ?? [];
  num getValue(String label, int index) => getSeries(label)[index];

  // final List<num> o1 = List.generate(1024, (index) => index),
  //     o2 = List.generate(1024, (index) => index * index),
  //     o3 = List.generate(1024, (index) => index * sqrt(index));
}
