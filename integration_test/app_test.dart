import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:learning/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Testing cart screen by clicking Pay button and expecting a message popping up in screen!', (WidgetTester tester) async{
    app.main();
    await tester.pumpAndSettle();
    final Finder button = find.text('Pay');
    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(find.text('Successful!'),findsOneWidget);
  });

  test('One should be one', (){
    int expectedno = 1;
    expect(expectedno, 1);
  });

  test('Date should be today as 27th january',(){
    DateTime datenow =  DateTime.now();
    expect(datenow.toString().substring(0,10),'2024-01-27');
  });

}