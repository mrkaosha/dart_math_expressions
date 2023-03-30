import 'package:math_expressions/math_expressions.dart';

void main() {
  print('hi');
  regex_test();
}

void regex_test() {
  const string = 'y = -202/-34x - 5';
  final re = RegExp(r'[=x]');
  print(string.split(re).firstWhere((e) => e.contains('/')).split('/'));
}

void math_test() {
  Variable x = Variable('x'), y = Variable('y');
  String equation = " 2/-3*x - 6/1 * 1/12 + 1/6 + 1/6 + 1/6 + 1/6 + 1/6 + 3333/9999 + 2-y";
  Parser p = Parser();
  Expression exp = p.parse(equation);
  ContextModel cm = ContextModel();
  cm.bindVariable(x, Number(4.0));
  cm.bindVariable(y, Number(0.0));
  print(exp.evaluate(EvaluationType.REAL, cm));
}