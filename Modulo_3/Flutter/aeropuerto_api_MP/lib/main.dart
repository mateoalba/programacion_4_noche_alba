import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'presentation/navigation/app_router.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(const ProviderScope(child: AppControlVuelos()));
}

class AppControlVuelos extends ConsumerWidget {
  const AppControlVuelos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      title: 'Control de Vuelos',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.temaClaro,
      darkTheme: AppTheme.temaOscuro,
      themeMode: ThemeMode.dark,
      routerConfig: router,
    );
  }
}
