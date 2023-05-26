import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:tokosmileui/modules/homepage.dart';
import 'package:tokosmileui/shared/constants/strings.dart';
import 'package:tokosmileui/shared/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: Size(logicalWidth(), logicalHeight()),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        scrollBehavior: SBehavior(),
        title: Strings.appName,
        // home: SplashScreen(),
        home: const HomePage(),
        theme: ThemeData(
          fontFamily: Strings.inter,
        ),
        //  onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
