import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<Test>(create: (context) {
          Test.context = context;
          return Test();
        })
      ],
      builder: (_, __) {
        return FluentApp(
          title: 'Flutter Parse Demo',
          theme: ThemeData(),
          home: NavigationView(
            pane: NavigationPane(
              displayMode: PaneDisplayMode.compact,
            ),
            content: const Home(),
          ),
        );
      },
    );
  }
}
