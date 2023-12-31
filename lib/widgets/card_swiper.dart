import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app/models/movie.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key, required this.movies});

final List<Movie> movies;
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(itemCount: movies.length,
      layout: SwiperLayout.STACK,
      itemWidth: size.width * 0.6,
      itemHeight: size.height * 0.4 ,
      itemBuilder: ( _ , int index){
        final movie = movies[index];
        //GestureDetector nos permite envolver lo demas en este widget para ir a ootra pagina
return GestureDetector(
  onTap: ()=> Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
  //otro widget que nos ayuda a redondear los bordes
  child:   ClipRRect(
  
    borderRadius: BorderRadius.circular(20),
  
    child:  FadeInImage(placeholder: const AssetImage('assets/no-image.jpg'), image: NetworkImage(movie.fullPosterImg),
  
    fit: BoxFit.cover,
  
    )),
);
      },
      ),
    );
  }
}