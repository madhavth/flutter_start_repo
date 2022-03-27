import 'package:flutter_start_repo/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("empty testing", ()
  {
    app.main();

    testWidgets("testing 1", (tester) async {
      //example
      // await tester.pumpAndSettle();
      // final button = find.text("hello");
      //
      // expect(tester, findsWidgets);
      //
      // await tester.tap(button);
      // await tester.pumpAndSettle();
      expect(true, true);
    });

    testWidgets("testing 2", (tester) async {
      expect(true, false);
    });
  });
}