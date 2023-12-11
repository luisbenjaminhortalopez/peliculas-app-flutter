import 'dart:convert';
import 'package:peliculas_app/models/models.dart';
import 'package:peliculas_app/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{

  String _baseUrl  = 'api.themoviedb.org';
  String _apiKey   = '98cec038d4055111d26bdc5b1e83351c';
  String _language = 'es-LA';

  List<Movie> onDisplayMovies = [];

    MoviesProvider(){
    print('Movies Provider inicializado');
    this.getOnDisplayMovies();
  }
  getOnDisplayMovies() async {
   var url = Uri.https(this._baseUrl, '3/movie/now_playing', {
    'api_key':_apiKey,
    'language':_language,
    'page': '1'
   } );
  
final response = await http.get(url);
final Map<String, dynamic> decodedData = json.decode(response.body);
final nowPLayingResponse = NowPLayingResponse.fromJson(decodedData);
onDisplayMovies = nowPLayingResponse.results;
notifyListeners();
  }
}