import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'states/user.dart';
import 'common/global.dart';
import 'routers/app_pages.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Global.init().then((e) => {runApp(const MyApp())});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (builder) => UserModel(),
      child: MaterialApp.router(
        title: 'Flutter Template',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        routeInformationParser: AppPages.router.routeInformationParser,
        routerDelegate: AppPages.router.routerDelegate,
      ),
    );
  }
}
