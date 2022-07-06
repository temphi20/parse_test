import 'package:fluent_ui/fluent_ui.dart';

import 'test.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          TextBox(
            onChanged: (val) => Test.of(context).parse(val),
          ),
          Text(Test.on(context).formula),
          Row(
            children: [
              const Text("= "),
              Text(Test.on(context).result.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
