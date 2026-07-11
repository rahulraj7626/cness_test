import 'package:cness_test/core/di/injection_container.dart' as di;
import 'package:cness_test/core/di/injection_container.dart';
import 'package:cness_test/core/routes/app_router.dart';
import 'package:flutter/material.dart';

/// Application entry point.
/// Initializes dependencies and launches the app.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

/// Root widget of the application.
/// Configures app theme and navigation.
class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = sl<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CNESS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: appRouter.config(),
    );
  }
}
