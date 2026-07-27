import 'package:flutter_test/flutter_test.dart';
import 'package:aeropuerto_formularios/main.dart';

void main() {
  testWidgets('App renders', (WidgetTester tester) async {
    await tester.pumpWidget(const AeropuertoApp());
    expect(find.text('Paso 1'), findsOneWidget);
  });
}
