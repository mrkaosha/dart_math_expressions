import 'package:math_expressions/math_expressions.dart';

void main() {
  print('hi');
  math_test();
}

void regex_test() {
  const string = 'y= -202 / 23 x + 11 / 12 * 12 / 4';
  final re = RegExp(r'[ ]');
  List<String> splitString = string.split(' ');
  splitString.asMap().forEach((index, element) {
    if (index == splitString.length - 1) {
      return;
    }
    if (element.contains('/')) {
      print('\\tfrac\{${splitString[index - 1]}\}');
      splitString[index - 1] = '\\tfrac\{${splitString[index - 1]}\}';
      splitString[index + 1] = '\{${splitString[index + 1]}\}';
      splitString[index] = '';
    }
  });

  print(splitString.join());
}

void math_test() {
  Variable x = Variable('x'), y = Variable('y');
  String equation = "-8/2*x--8/2*-5+-6";
  Parser p = Parser();
  Expression exp = p.parse(equation);
  print(exp.simplify());
  ContextModel cm = ContextModel();
  cm.bindVariable(x, Number(4.0));
  cm.bindVariable(y, Number(0.0));
  print(exp);
  print(exp.evaluate(EvaluationType.REAL, cm));
}
