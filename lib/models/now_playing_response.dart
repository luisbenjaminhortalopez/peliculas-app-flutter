import 'dart:convert';

import 'movie.dart';

class NowPLayingResponse {
    Dates dates;
    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    NowPLayingResponse({
        required this.dates,
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory NowPLayingResponse.fromRawJson(String str) => NowPLayingResponse.fromJson(json.decode(str));


    factory NowPLayingResponse.fromJson(Map<String, dynamic> json) => NowPLayingResponse(
        dates       : Dates.fromJson(json["dates"]),
        page        : json["page"],
        results     : List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages  : json["total_pages"],
        totalResults: json["total_results"],
    );

//solo se utiliza para peticiones http
    // Map<String, dynamic> toJson() => {
    //     "dates": dates.toJson(),
    //     "page": page,
    //     "results": List<dynamic>.from(results.map((x) => x.toJson())),
    //     "total_pages": totalPages,
    //     "total_results": totalResults,
    // };
}

class Dates {
    DateTime maximum;
    DateTime minimum;

    Dates({
        required this.maximum,
        required this.minimum,
    });

    factory Dates.fromRawJson(String str) => Dates.fromJson(json.decode(str));


    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );

  
}

