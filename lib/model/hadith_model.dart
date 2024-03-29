class Hadith {
  final String key;
  final String name;
  final String explaination;
  final String text;
  final String translation;
  final String audio;

  Hadith({required this.key,
    required this.name,
    required this.explaination,
    required this.text,
    required this.translation,
    required this.audio});

  Map<String, dynamic> toMap() =>
      {
        "key": key,
        "name": name,
        "text": text,
        "explaination": explaination,
        "translation": translation,
        "audio": audio,
      };

  factory Hadith.fromMap(Map<String, dynamic> json) =>
      new Hadith(
        key: json["key"],
        name: json["name"],
        text: json["text"],
        explaination: json["explaination"],
        translation: json["translation"],
        audio: json["audio"],
      );
}
