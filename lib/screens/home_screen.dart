import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/card_swiper.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Peliculas en cines'),
          elevation: 10,
          backgroundColor: Colors.red,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.search_outlined))
          ],
        ),
           body: const SingleChildScrollView(
            child: Column(
          children: [
            CardSwiper(),
            MovieSlider()
          ],
        ),
           )
     );
  }
}
