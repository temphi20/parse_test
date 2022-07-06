import 'package:fluent_ui/fluent_ui.dart';
import 'package:mate/mate.dart';
import 'package:provider/provider.dart';
import 'package:math_parser/math_parser.dart';

class Test extends ChangeNotifier {
  static BuildContext? context;
  static Test on(BuildContext context) => Provider.of<Test>(context);
  static Test of(BuildContext context) =>
      Provider.of<Test>(context, listen: false);

  final Mate mate = Mate();
  String formula = "";
  num result = 0;

  void parse(String val) {
    formula = val;
    try {
      result = MathNodeExpression.fromString(val)
          .calc(MathVariableValues({'x': 20}));
      // result = mate.calculate(val) ?? 0;
    } catch (e) {}

    notifyListeners();
  }
}
