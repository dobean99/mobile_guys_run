
class Entry {
  int? id;
  String? date;
  String? duration;
  double? distance;
  double? speed;

  Entry({
    this.id,
    this.date,
    this.duration,
    this.distance,
    this.speed,
  });
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'date': date,
      'duration': duration,
      'speed': speed,
      'distance': distance
    };

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
        id: json['id'],
        date: json['date'],
        duration: json['duration'],
        distance: json['distance'],
        speed: json['speed']);
  }

}
