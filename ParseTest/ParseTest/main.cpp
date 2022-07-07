#include <iostream>
#include <string>
#include "exprtk.hpp"
using namespace std;

template <typename T>
void test_function(string exp)
{
	typedef exprtk::symbol_table<T> symbol_table_t;
	typedef exprtk::expression<T>   expression_t;
	typedef exprtk::parser<T>       parser_t;

	T o1, o2;
	symbol_table_t symbol_table;
	symbol_table.add_variable("o1", o1);
	symbol_table.add_variable("o2", o2);
	symbol_table.add_constants();

	expression_t expression;
	expression.register_symbol_table(symbol_table);

	parser_t parser;
	parser.compile(exp, expression);

	o1 = T(4);
	o2 = T(6);
	cout << "[" << o1 << ', ' << o2 << "] " << exp << " = " << expression.value() << endl;
}


int main()
{

	test_function<double>("o1 + o2 * 3");


	return 0;
}