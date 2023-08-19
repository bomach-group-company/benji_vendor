import 'package:benji_vendor/utility/provider_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'routes/routes.dart';
import 'splash screens/startup splash screen.dart';
import 'theme/colors.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: InitProvider.providerInit(),
      child: MaterialApp(
        title: "Benji Vendor",
    
        color: kPrimaryColor,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(
              kDarkGreyColor,
            ),
            radius: const Radius.circular(
              6,
            ),
          ),
          textTheme: GoogleFonts.senTextTheme(
            // Update the textTheme property
            Theme.of(context).textTheme, // Use the default theme
          ),
        ),
        initialRoute: StartupSplashscreen.routeName,
        // home: const OverView(),
        routes: routes,
      ),
    );
  }
}
