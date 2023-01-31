import 'package:calender/Utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/Calenderprovider.dart';
import 'Provider/DatabaseProvider.dart';
import 'Provider/themePro.dart';
import 'Routes/Routes.dart';
import 'Routes/RoutesName.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeFun()),
          ChangeNotifierProvider(create: (_) => CalendarData()),
        ],
        child: Builder(builder: (context) {
          final themeChanger = Provider.of<ThemeFun>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            darkTheme: customDarkTheme(),
            themeMode: themeChanger.themeMode,
            theme: customLightTheme(),
            initialRoute: RoutesName.splash,
            onGenerateRoute: Routes.generateRoute,
          );
        }));
  }
}
