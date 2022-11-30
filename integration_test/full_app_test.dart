import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:balance/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Full app testing', () {
    testWidgets('Add and delete bill', (widgetTester) async{
      app.main();

      await widgetTester.pumpAndSettle();

      var create = find.byKey(const Key('createBill'));
      //var expense = find.byKey(const Key('expense'));
      var income = find.byKey(const Key('income'));
      var appbar = find.byKey(const Key('appbar'));
      var submit = find.byKey(const Key('submit'));

      await widgetTester.tap(create);
      await widgetTester.pumpAndSettle();

      await widgetTester.tap(income);

      await widgetTester.enterText(find.byKey(const Key('title')), 'Salary');
      await widgetTester.enterText(find.byKey(const Key('amount')), '10000');

      // The Keyboard make a overflow, because don't hide at time before change to the balance's screen.
      // This show a error in the test.
      // I try to make a tap on appbar to hide the keyboard but don't work.
      await widgetTester.tap(appbar);

      await widgetTester.tap(submit);
      await widgetTester.pumpAndSettle();

      var dismissible = find.byKey(const Key('dismissible'));
      await widgetTester.drag(dismissible, const Offset(500, 0));

    });
  });

}