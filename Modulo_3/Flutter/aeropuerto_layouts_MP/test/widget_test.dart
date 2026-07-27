import 'package:flutter_test/flutter_test.dart';
import 'package:aeropuerto_layouts/main.dart';

void main() {
  testWidgets('App loads correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const AppControlVuelos());
    await tester.pumpAndSettle();
  });
}
