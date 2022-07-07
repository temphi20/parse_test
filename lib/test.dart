import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:math_parser/math_parser.dart';

import 'definition.dart';
import 'series.dart';

class Test extends ChangeNotifier {
  static BuildContext? context;
  static Test on(BuildContext context) => Provider.of<Test>(context);
  static Test of(BuildContext context) =>
      Provider.of<Test>(context, listen: false);

  final Series series = Series();

  // final Mate mate = Mate();
  MathNode? node;
  String formula = "";
  List<num> results = [];
  num result = 0;

  void update() => notifyListeners();

  void setNode() {
    node = MathNodeExpression.fromString(
      formula,
      variableNames: series.labels,
      customFunctions: MathCustomFunctions({Pow()}),
    );
  }

  void addList(String val) {
    formula = val;
    // formula += val;
    setNode();
    calculate();
  }

  void setFormula(String val) {
    try {
      formula = val.toLowerCase();
      setNode();
      // result = MathNodeExpression.fromString(val)
      //     .calc(MathVariableValues({'x': 20}));
      // result = mate.calculate(val) ?? 0;

    } catch (e) {
      debugPrint("setFormula / " + e.toString());
    }

    // update();

    calculate();
  }

  void calculate() {
    try {
      // if (node != null) {
      results.clear();

      results.addAll(List.generate(
          series.maxLength,
          (index) =>
              node!.calc(MathVariableValues(series.get1Dimension(index)))));

      // debugPrint(results.toString());
      // for (int index = 0; index < series.maxLength; index++) {
      //   results.add(node?.calc(values));
      // }
      // }
    } catch (e) {
      debugPrint("calculate / " + e.toString());
    }

    update();
  }
}
