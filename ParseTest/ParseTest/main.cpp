#include <iostream>
#include <string>
#include "Calc.h"
#include "exprtk.hpp"
using namespace std;

int main()
{
	WGSTest::Calc<double> calc;
	calc.AddFunctions("custom(x, 3, 4)");
	calc.AddPronumerals("x");
	calc.SetValue("x", 4);
	calc.SetPronumerals();
	calc.Calculate();

	return 0;
}