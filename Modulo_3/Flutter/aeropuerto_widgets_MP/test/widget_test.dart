import 'package:flutter_test/flutter_test.dart';
import 'package:aeropuerto_widgets/main.dart';

void main() {
  testWidgets('Paso 1 muestra bienvenida', (WidgetTester tester) async {
    await tester.pumpWidget(const Bienvenida());
    expect(find.text('Bienvenido al Aeropuerto'), findsOneWidget);
  });
}
