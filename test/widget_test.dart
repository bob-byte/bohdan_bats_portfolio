// Basic smoke test: app widget builds without running full main().

import 'package:flutter_test/flutter_test.dart';

import 'package:bohdan_bats_portfolio/main.dart';

void main() {
  testWidgets('MyApp builds', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();
    expect(find.byType(MyApp), findsOneWidget);
  });
}
