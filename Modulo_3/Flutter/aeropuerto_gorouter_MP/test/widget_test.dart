import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aeropuerto_gorouter/main.dart';

void main() {
  testWidgets('App compila sin errores', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: AppAeropuerto()));
    expect(find.byType(AppAeropuerto), findsOneWidget);
  });
}
