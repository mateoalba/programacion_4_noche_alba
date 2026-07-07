import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:modulo12_api/main.dart';

void main() {
  testWidgets('App shows menu with 5 pasos', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: AppHttp()));

    expect(find.text('Módulo 12 — API REST'), findsOneWidget);
    expect(find.text('Paso 1 · FutureBuilder crudo'), findsOneWidget);
    expect(find.text('Paso 5 · Arquitectura completa'), findsOneWidget);
  });
}
