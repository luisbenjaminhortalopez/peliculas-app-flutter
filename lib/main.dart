import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:peliculas_app/screens/screens.dart';
import 'package:provider/provider.dart';


void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      //lazy siempre esta en true y se refiere a que moviesProvider se manda llamar hasya que sea necesario
      ChangeNotifierProvider(create: (_)=>MoviesProvider(), lazy: false,)
    ],
    child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
     initialRoute: 'home',
     routes: {
      'home': ( _ )=>const HomeScreen(),
      'details': ( _ )=>const DetailScreen(),
     },
     theme: ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
      )
     ),
    );
  }
}