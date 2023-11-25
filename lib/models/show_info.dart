import 'dart:convert';

import 'package:collection/collection.dart';

class ShowInfo {
  ShowInfo({
    this.score,
    this.show,
  });

  final double? score;
  final Show? show;

  ShowInfo copyWith({
    double? score,
    Show? show,
  }) {
    return ShowInfo(
      score: score ?? this.score,
      show: show ?? this.show,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (score != null) {
      result.addAll({'score': score});
    }
    if (show != null) {
      result.addAll({'show': show!.toMap()});
    }

    return result;
  }

  factory ShowInfo.fromMap(Map<String, dynamic> map) {
    return ShowInfo(
      score: map['score']?.toDouble(),
      show: map['show'] != null ? Show.fromMap(map['show']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShowInfo.fromJson(String source) =>
      ShowInfo.fromMap(json.decode(source));

  @override
  String toString() => 'ShowInfo(score: $score, show: $show)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShowInfo && other.score == score && other.show == show;
  }

  @override
  int get hashCode => score.hashCode ^ show.hashCode;
}

class Show {
  Show({
    this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.schedule,
    this.rating,
    this.weight,
    this.network,
    this.webChannel,
    this.dvdCountry,
    this.externals,
    this.image,
    this.summary,
    this.updated,
    this.links,
  });

  final int? id;
  final String? url;
  final String? name;
  final String? type;
  final String? language;
  final List<String>? genres;
  final String? status;
  final int? runtime;
  final int? averageRuntime;
  final DateTime? premiered;
  final DateTime? ended;
  final String? officialSite;
  final Schedule? schedule;
  final Rating? rating;
  final int? weight;
  final Network? network;
  final dynamic webChannel;
  final dynamic dvdCountry;
  final Externals? externals;
  final Image? image;
  final String? summary;
  final int? updated;
  final Links? links;

  Show copyWith({
    int? id,
    String? url,
    String? name,
    String? type,
    String? language,
    List<String>? genres,
    String? status,
    int? runtime,
    int? averageRuntime,
    DateTime? premiered,
    DateTime? ended,
    String? officialSite,
    Schedule? schedule,
    Rating? rating,
    int? weight,
    Network? network,
    dynamic webChannel,
    dynamic dvdCountry,
    Externals? externals,
    Image? image,
    String? summary,
    int? updated,
    Links? links,
  }) {
    return Show(
      id: id ?? this.id,
      url: url ?? this.url,
      name: name ?? this.name,
      type: type ?? this.type,
      language: language ?? this.language,
      genres: genres ?? this.genres,
      status: status ?? this.status,
      runtime: runtime ?? this.runtime,
      averageRuntime: averageRuntime ?? this.averageRuntime,
      premiered: premiered ?? this.premiered,
      ended: ended ?? this.ended,
      officialSite: officialSite ?? this.officialSite,
      schedule: schedule ?? this.schedule,
      rating: rating ?? this.rating,
      weight: weight ?? this.weight,
      network: network ?? this.network,
      webChannel: webChannel ?? this.webChannel,
      dvdCountry: dvdCountry ?? this.dvdCountry,
      externals: externals ?? this.externals,
      image: image ?? this.image,
      summary: summary ?? this.summary,
      updated: updated ?? this.updated,
      links: links ?? this.links,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (url != null) {
      result.addAll({'url': url});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (type != null) {
      result.addAll({'type': type});
    }
    if (language != null) {
      result.addAll({'language': language});
    }
    if (genres != null) {
      result.addAll({'genres': genres});
    }
    if (status != null) {
      result.addAll({'status': status});
    }
    if (runtime != null) {
      result.addAll({'runtime': runtime});
    }
    if (averageRuntime != null) {
      result.addAll({'averageRuntime': averageRuntime});
    }
    if (premiered != null) {
      result.addAll({'premiered': premiered!.millisecondsSinceEpoch});
    }
    if (ended != null) {
      result.addAll({'ended': ended!.millisecondsSinceEpoch});
    }
    if (officialSite != null) {
      result.addAll({'officialSite': officialSite});
    }
    if (schedule != null) {
      result.addAll({'schedule': schedule!.toMap()});
    }
    if (rating != null) {
      result.addAll({'rating': rating!.toMap()});
    }
    if (weight != null) {
      result.addAll({'weight': weight});
    }
    if (network != null) {
      result.addAll({'network': network!.toMap()});
    }
    result.addAll({'webChannel': webChannel});
    result.addAll({'dvdCountry': dvdCountry});
    if (externals != null) {
      result.addAll({'externals': externals!.toMap()});
    }
    if (image != null) {
      result.addAll({'image': image!.toMap()});
    }
    if (summary != null) {
      result.addAll({'summary': summary});
    }
    if (updated != null) {
      result.addAll({'updated': updated});
    }
    if (links != null) {
      result.addAll({'links': links!.toMap()});
    }

    return result;
  }

  factory Show.fromMap(Map<String, dynamic> map) {
    return Show(
      id: map['id']?.toInt(),
      url: map['url'],
      name: map['name'],
      type: map['type'],
      language: map['language'],
      genres: List<String>.from(map['genres']),
      status: map['status'],
      runtime: map['runtime']?.toInt(),
      averageRuntime: map['averageRuntime']?.toInt(),
      premiered: DateTime.tryParse(map['premiered'] ?? '') ?? DateTime.now(),
      ended: DateTime.tryParse(map['ended'] ?? '') ?? DateTime.now(),
      officialSite: map['officialSite'],
      schedule:
          map['schedule'] != null ? Schedule.fromMap(map['schedule']) : null,
      rating: map['rating'] != null ? Rating.fromMap(map['rating']) : null,
      weight: map['weight']?.toInt(),
      network: map['network'] != null ? Network.fromMap(map['network']) : null,
      webChannel: map['webChannel'],
      dvdCountry: map['dvdCountry'],
      externals:
          map['externals'] != null ? Externals.fromMap(map['externals']) : null,
      image: map['image'] != null ? Image.fromMap(map['image']) : null,
      summary: map['summary'],
      updated: map['updated']?.toInt(),
      links: map['links'] != null ? Links.fromMap(map['links']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Show.fromJson(String source) => Show.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Show(id: $id, url: $url, name: $name, type: $type, language: $language, genres: $genres, status: $status, runtime: $runtime, averageRuntime: $averageRuntime, premiered: $premiered, ended: $ended, officialSite: $officialSite, schedule: $schedule, rating: $rating, weight: $weight, network: $network, webChannel: $webChannel, dvdCountry: $dvdCountry, externals: $externals, image: $image, summary: $summary, updated: $updated, links: $links)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Show &&
        other.id == id &&
        other.url == url &&
        other.name == name &&
        other.type == type &&
        other.language == language &&
        listEquals(other.genres, genres) &&
        other.status == status &&
        other.runtime == runtime &&
        other.averageRuntime == averageRuntime &&
        other.premiered == premiered &&
        other.ended == ended &&
        other.officialSite == officialSite &&
        other.schedule == schedule &&
        other.rating == rating &&
        other.weight == weight &&
        other.network == network &&
        other.webChannel == webChannel &&
        other.dvdCountry == dvdCountry &&
        other.externals == externals &&
        other.image == image &&
        other.summary == summary &&
        other.updated == updated &&
        other.links == links;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        url.hashCode ^
        name.hashCode ^
        type.hashCode ^
        language.hashCode ^
        genres.hashCode ^
        status.hashCode ^
        runtime.hashCode ^
        averageRuntime.hashCode ^
        premiered.hashCode ^
        ended.hashCode ^
        officialSite.hashCode ^
        schedule.hashCode ^
        rating.hashCode ^
        weight.hashCode ^
        network.hashCode ^
        webChannel.hashCode ^
        dvdCountry.hashCode ^
        externals.hashCode ^
        image.hashCode ^
        summary.hashCode ^
        updated.hashCode ^
        links.hashCode;
  }
}

class Externals {
  Externals({
    this.tvrage,
    this.thetvdb,
    this.imdb,
  });

  final dynamic tvrage;
  final int? thetvdb;
  final String? imdb;

  Externals copyWith({
    dynamic tvrage,
    int? thetvdb,
    String? imdb,
  }) {
    return Externals(
      tvrage: tvrage ?? this.tvrage,
      thetvdb: thetvdb ?? this.thetvdb,
      imdb: imdb ?? this.imdb,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'tvrage': tvrage});
    if (thetvdb != null) {
      result.addAll({'thetvdb': thetvdb});
    }
    if (imdb != null) {
      result.addAll({'imdb': imdb});
    }

    return result;
  }

  factory Externals.fromMap(Map<String, dynamic> map) {
    return Externals(
      tvrage: map['tvrage'],
      thetvdb: map['thetvdb']?.toInt(),
      imdb: map['imdb'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Externals.fromJson(String source) =>
      Externals.fromMap(json.decode(source));

  @override
  String toString() =>
      'Externals(tvrage: $tvrage, thetvdb: $thetvdb, imdb: $imdb)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Externals &&
        other.tvrage == tvrage &&
        other.thetvdb == thetvdb &&
        other.imdb == imdb;
  }

  @override
  int get hashCode => tvrage.hashCode ^ thetvdb.hashCode ^ imdb.hashCode;
}

class Image {
  Image({
    this.medium,
    this.original,
  });

  final String? medium;
  final String? original;

  Image copyWith({
    String? medium,
    String? original,
  }) {
    return Image(
      medium: medium ?? this.medium,
      original: original ?? this.original,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (medium != null) {
      result.addAll({'medium': medium});
    }
    if (original != null) {
      result.addAll({'original': original});
    }

    return result;
  }

  factory Image.fromMap(Map<String, dynamic> map) {
    return Image(
      medium: map['medium'],
      original: map['original'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Image.fromJson(String source) => Image.fromMap(json.decode(source));

  @override
  String toString() => 'Image(medium: $medium, original: $original)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Image &&
        other.medium == medium &&
        other.original == original;
  }

  @override
  int get hashCode => medium.hashCode ^ original.hashCode;
}

class Links {
  Links({
    this.self,
    this.previousEpisode,
  });

  final PreviousEpisode? self;
  final PreviousEpisode? previousEpisode;

  Links copyWith({
    PreviousEpisode? self,
    PreviousEpisode? previousEpisode,
  }) {
    return Links(
      self: self ?? this.self,
      previousEpisode: previousEpisode ?? this.previousEpisode,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (self != null) {
      result.addAll({'self': self!.toMap()});
    }
    if (previousEpisode != null) {
      result.addAll({'previousEpisode': previousEpisode!.toMap()});
    }

    return result;
  }

  factory Links.fromMap(Map<String, dynamic> map) {
    return Links(
      self: map['self'] != null ? PreviousEpisode.fromMap(map['self']) : null,
      previousEpisode: map['previousEpisode'] != null
          ? PreviousEpisode.fromMap(map['previousEpisode'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Links.fromJson(String source) => Links.fromMap(json.decode(source));

  @override
  String toString() => 'Links(self: $self, previousEpisode: $previousEpisode)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Links &&
        other.self == self &&
        other.previousEpisode == previousEpisode;
  }

  @override
  int get hashCode => self.hashCode ^ previousEpisode.hashCode;
}

class PreviousEpisode {
  PreviousEpisode({
    this.href,
  });

  final String? href;

  PreviousEpisode copyWith({
    String? href,
  }) {
    return PreviousEpisode(
      href: href ?? this.href,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (href != null) {
      result.addAll({'href': href});
    }

    return result;
  }

  factory PreviousEpisode.fromMap(Map<String, dynamic> map) {
    return PreviousEpisode(
      href: map['href'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PreviousEpisode.fromJson(String source) =>
      PreviousEpisode.fromMap(json.decode(source));

  @override
  String toString() => 'PreviousEpisode(href: $href)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PreviousEpisode && other.href == href;
  }

  @override
  int get hashCode => href.hashCode;
}

class Network {
  Network({
    this.id,
    this.name,
    this.country,
    this.officialSite,
  });

  final int? id;
  final String? name;
  final Country? country;
  final dynamic officialSite;

  Network copyWith({
    int? id,
    String? name,
    Country? country,
    dynamic officialSite,
  }) {
    return Network(
      id: id ?? this.id,
      name: name ?? this.name,
      country: country ?? this.country,
      officialSite: officialSite ?? this.officialSite,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (country != null) {
      result.addAll({'country': country!.toMap()});
    }
    result.addAll({'officialSite': officialSite});

    return result;
  }

  factory Network.fromMap(Map<String, dynamic> map) {
    return Network(
      id: map['id']?.toInt(),
      name: map['name'],
      country: map['country'] != null ? Country.fromMap(map['country']) : null,
      officialSite: map['officialSite'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Network.fromJson(String source) =>
      Network.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Network(id: $id, name: $name, country: $country, officialSite: $officialSite)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Network &&
        other.id == id &&
        other.name == name &&
        other.country == country &&
        other.officialSite == officialSite;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        country.hashCode ^
        officialSite.hashCode;
  }
}

class Country {
  Country({
    this.name,
    this.code,
    this.timezone,
  });

  final String? name;
  final String? code;
  final String? timezone;

  Country copyWith({
    String? name,
    String? code,
    String? timezone,
  }) {
    return Country(
      name: name ?? this.name,
      code: code ?? this.code,
      timezone: timezone ?? this.timezone,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (code != null) {
      result.addAll({'code': code});
    }
    if (timezone != null) {
      result.addAll({'timezone': timezone});
    }

    return result;
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      name: map['name'],
      code: map['code'],
      timezone: map['timezone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) =>
      Country.fromMap(json.decode(source));

  @override
  String toString() => 'Country(name: $name, code: $code, timezone: $timezone)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Country &&
        other.name == name &&
        other.code == code &&
        other.timezone == timezone;
  }

  @override
  int get hashCode => name.hashCode ^ code.hashCode ^ timezone.hashCode;
}

class Rating {
  Rating({
    this.average,
  });

  final double? average;

  Rating copyWith({
    double? average,
  }) {
    return Rating(
      average: average ?? this.average,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (average != null) {
      result.addAll({'average': average});
    }

    return result;
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      average: map['average']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Rating.fromJson(String source) => Rating.fromMap(json.decode(source));

  @override
  String toString() => 'Rating(average: $average)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Rating && other.average == average;
  }

  @override
  int get hashCode => average.hashCode;
}

class Schedule {
  Schedule({
    this.time,
    this.days,
  });

  final String? time;
  final List<String>? days;

  Schedule copyWith({
    String? time,
    List<String>? days,
  }) {
    return Schedule(
      time: time ?? this.time,
      days: days ?? this.days,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (time != null) {
      result.addAll({'time': time});
    }
    if (days != null) {
      result.addAll({'days': days});
    }

    return result;
  }

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      time: map['time'],
      days: List<String>.from(map['days']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Schedule.fromJson(String source) =>
      Schedule.fromMap(json.decode(source));

  @override
  String toString() => 'Schedule(time: $time, days: $days)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Schedule &&
        other.time == time &&
        listEquals(other.days, days);
  }

  @override
  int get hashCode => time.hashCode ^ days.hashCode;
}
