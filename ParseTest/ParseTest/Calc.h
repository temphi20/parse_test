#pragma once
#include <iostream>
#include <string>
#include "exprtk.hpp"

namespace WGSTest
{
	using namespace std;
	using namespace exprtk;

	/*template <typename T>
	struct test : public exprtk::ifunction<T>
	{
		test() : exprtk::ifunction<T>(2) { exprtk::disable_has_side_effects(*this); }

		inline T operator()(const T& v1, const T& v2)
		{
			return v1 + v2;
		}
	};*/

	template <typename T>
	inline T custom(T v0, T v1, T v2)
	{
		return abs(v0 - v1) * v2;
	}

	template <typename T>
	class Calc
	{
	public:
		Calc()
		{
			m_table.add_constants();
			m_table.add_function("custom", custom);
			//test<T> test;
			//m_table.add_function("test", test);
		}
		~Calc(){}


		//void AddPronumeral(string label)
		//{
		//	//if (m_pronumerals..find(label) == m_pronumerals.end()) return;
		//	m_pronumerals.insert(label);
		//}
		/*void SetPronumerals()
		{
			for (auto iter = m_pronumerals.begin(); iter != m_pronumerals.end(); iter++)
			{
				m_values.push_back(T);
				m_table.add_variable(*iter, m_values.end() - 1);
			}
			m_expression.register_symbol_table(m_table);
		}*/

		void AddPronumerals(string label)
		{
			if (m_pronumerals.find(label) == m_pronumerals.end()) return;
			T t;
			m_pronumerals.insert({label, t});
		}

		void SetPronumerals()
		{
			for (auto iter = m_pronumerals.begin(); iter != m_pronumerals.end(); iter++)
			{
				m_table.add_variable(iter->first, iter->second);
			}
			m_expression.register_symbol_table(m_table);
		}

		void SetValue(string label, T value)
		{
			m_pronumerals[label] = value;
		}

		void AddFunctions(string exp)
		{
			m_functions.push_back(exp);
		}

		void Reset()
		{
			vector<string> v_zero;
			map<string, T> m_zero;
			m_functions.swap(v_zero);
			m_pronumerals.swap(m_zero);

			for (auto iter = m_pronumerals.begin(); iter != m_pronumerals.end(); iter++)
			{
				m_table.remove_variable(iter->first);
			}
		}

		void Calculate()
		{
			for (auto iter = m_functions.begin(); iter != m_functions.end(); iter++)
			{
				m_parser.compile(*iter, m_expression);
				cout << m_expression.value() << endl;
			}
			
		}

		/*void AddFunction(string label, ifunction<T> ifunc)
		{
			m_table.add_function(label, ifunc);
		}*/
	private:
		
		vector<string> m_functions;
		//vector<string> m_pronumerals;
		//vector<T> m_values;
		map<string, T> m_pronumerals;
		symbol_table<T> m_table;
		expression<T> m_expression;
		//function_compositor<T> m_compositor;
		parser<T> m_parser;
	};



}

//template <typename T>
//void test_function(string exp)
//{
//	//typedef exprtk::symbol_table<T> symbol_table_t;
////typedef exprtk::expression<T>   expression_t;
////typedef exprtk::parser<T>       parser_t;
//
//	T o1, o2;
//	symbol_table_t symbol_table;
//	symbol_table.add_variable("o1", o1);
//	symbol_table.add_variable("o2", o2);
//	symbol_table.add_constants();
//
//	expression_t expression;
//	expression.register_symbol_table(symbol_table);
//
//	parser_t parser;
//	parser.compile(exp, expression);
//
//	o1 = T(4);
//	o2 = T(6);
//	cout << "[" << o1 << ', ' << o2 << "] " << exp << " = " << expression.value() << endl;
//}