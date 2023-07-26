import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:google_fonts/google_fonts.dart';
import './screens/tabs.dart';

Color color = const Color.fromARGB(255, 176, 255, 38);

  // useMaterial3: true,
  // colorScheme: ColorScheme.fromSwatch(
  //   brightness: Brightness.dark,
  //   primaryColorDark: const Color.fromRGBO(38, 38, 38, 0.4),
  //   primarySwatch: MaterialColorGenerator.from(color),
  // seedColor: const Color.fromARGB(255, 131, 57, 0),


const colorScheme = ColorScheme.light(
  primary: Colors.orangeAccent,
  onPrimary: Colors.white,
  secondary: Colors.black87,
  error: Colors.red,
);

const darkColorScheme = ColorScheme.dark(
  primary: Colors.orangeAccent,
  onPrimary: Colors.black87,
  secondary: Colors.white,
  error: Colors.red,
);
// textTheme: GoogleFonts.latoTextTheme(),

// class MaterialColorGenerator {
//   static MaterialColor from(Color color) {
//     return MaterialColor(color.value, <int, Color>{
//       50: color.withOpacity(0.1),
//       100: color.withOpacity(0.2),
//       200: color.withOpacity(0.3),
//       300: color.withOpacity(0.4),
//       400: color.withOpacity(0.5),
//       500: color.withOpacity(0.6),
//       600: color.withOpacity(0.7),
//       700: color.withOpacity(0.8),
//       800: color.withOpacity(0.9),
//       900: color.withOpacity(1.0),
//     });
//   }
// }

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: colorScheme,
        hintColor: Colors.orangeAccent,
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: darkColorScheme,
        hintColor: Colors.orangeAccent,
      ),
      title: 'Meals',
      home: const TabsScreen(),
    );
  }
}
