import 'package:firebase_core/firebase_core.dart';
import 'package:fluro/fluro.dart';
import 'package:upb_web/Routes/application.dart';
import 'Routes/flour_routes.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState() {
    final router = FluroRouter();
    Routes.defineRoutes(router);
    Application.router = router;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CDG UPB WEB',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.windows: ZoomPageTransitionsBuilder(),
          },
        ),
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: Application.router.generator,
    );
  }
}
