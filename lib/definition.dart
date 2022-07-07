import 'dart:math';

import 'package:math_parser/math_parser.dart';

class Pow extends MathDefinitionFunctionFreeformImplemented {
  @override
  final String name = 'pow';
  @override
  final int minArgumentsCount = 2;
  @override
  final int maxArgumentsCount = 2;

  @override
  bool hasSameName(String other) => other == name;

  @override
  bool isCompatible(MathDefinitionFunctionFreeform other) =>
      other.name == name &&
      other.minArgumentsCount == minArgumentsCount &&
      other.maxArgumentsCount == maxArgumentsCount;

  @override
  num calc(List<MathNode> args, MathVariableValues values,
      {required MathCustomFunctionsImplemented customFunctions}) {
    return pow(args[0].calc(values, customFunctions: customFunctions),
        args[1].calc(values, customFunctions: customFunctions));
  }
}
