import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:modulo06_widgets/widgets/catalogo_basicos.dart';

void main() {
  testWidgets('CatalogoBasicos renders without error', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CatalogoBasicos()));
    expect(find.text('Widgets básicos'), findsOneWidget);
  });
}
