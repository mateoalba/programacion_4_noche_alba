import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/auth_provider.dart';
import 'router/app_router.dart';

void main() => runApp(const ProviderScope(child: AppAeropuerto()));

class AppAeropuerto extends ConsumerWidget {
  const AppAeropuerto({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authProvider);
    final router = appRouter(ref);

    return MaterialApp.router(
      title: 'Control de Vuelos',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    );
  }
}
