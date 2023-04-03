import 'package:math_expressions/math_expressions.dart';

void main() {
  print('hi');
  regex_test();
}

void regex_test() {
  const string = 'y= -202/23 x + 11/12 * 12/4';
  final re = RegExp(r'[ ]');
  List<String> splitString = string.split(re);
  print(splitString);
  splitString.forEach((element) {})
}

void math_test() {
  Variable x = Variable('x'), y = Variable('y');
  String equation =
      " 2/-3*x - 6/1 * 1/12 + 1/6 + 1/6 + 1/6 + 1/6 + 1/6 + 3333/9999 + 2-y";
  Parser p = Parser();
  Expression exp = p.parse(equation);
  ContextModel cm = ContextModel();
  cm.bindVariable(x, Number(4.0));
  cm.bindVariable(y, Number(0.0));
  print(exp.evaluate(EvaluationType.REAL, cm));
}
