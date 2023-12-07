import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Features/Splash/presentation/views/widgets/custom_text_form_field.dart';
import 'core/utils/functions/open_boxes_in_hive.dart';
import 'core/utils/functions/selecting_next_screen.dart';
import 'core/utils/functions/setup_service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  setUpServiceLocator();
  Bloc.observer = MyBlocObserver();
  await openBoxesInHive();
  selectingNextScreen();
  print(mainBooksController.text);
  print(mainBooks);
  runApp(const Bookly());
}


class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: kPrimaryColor, // Set the color of the bottom safe area
        statusBarColor: Colors.transparent, // Optional: Set the status bar color
      ),
    );
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        primaryColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme:
            GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
    );
  }
}
