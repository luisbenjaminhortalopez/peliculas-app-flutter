import 'package:peliculas_app/widgets/widgets.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 260,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Populares',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                )),
            //expanded toma todo el espacio restante de la columna para renderizar el widget
          const   SizedBox(height: 5,),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (_, int index) => const _MoviePoster()),
            ),
          ],
        ));
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child:  Column(children: [
        GestureDetector(
            onTap: ()=> Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://creativereview.imgix.net/content/uploads/2019/12/joker_full.jpg?auto=compress,format&q=60&w=1012&h=1500'),
              width: 130,
              height: 190,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Titulo',
          style: TextStyle(color: Colors.white),
          maxLines: 2,
          textAlign: TextAlign.center,
          //coloca 3 puntos si el texto es mas largo de lo que permite el espacio
          overflow: TextOverflow.ellipsis,
        ),
      ]),
    );
  }
}
