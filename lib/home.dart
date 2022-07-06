import 'package:fluent_ui/fluent_ui.dart';

import 'test.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
            children: Test.on(context)
                .series
                .labels
                .map((e) => Button(
                      child: Text(e),
                      onPressed: () {
                        Test.of(context).addList(e);
                      },
                    ))
                .toList()),
        TextBox(
          controller: TextEditingController(text: Test.on(context).formula),
          onChanged: (val) => Test.of(context).setFormula(val),
        ),
        Text(Test.on(context).formula),
        // Row(
        //   children: [
        //     const Text("= "),
        //     Text(Test.on(context).result.toString()),
        //   ],
        // ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("= "),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              child: Wrap(
                children: List.generate(
                    Test.on(context).results.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child:
                              Text(Test.on(context).results[index].toString()),
                        )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
