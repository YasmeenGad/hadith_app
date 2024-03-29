class Hadith {
  final String? key;
  final String? name;
  final String? explaination;
  final String? text;
  final String? translation;
  final String? audio;

  Hadith(
      {this.key,
      this.name,
      this.explaination,
      this.text,
      this.translation,
      this.audio});

  Map<String, dynamic> toMap() => {
        "key": key,
        "name": name,
        "text": text,
        "explaination": explaination,
        "translation": translation,
        "audio": audio,
      };

  factory Hadith.fromMap(Map<String, dynamic> json) => new Hadith(
        key: json["key"],
        name: json["name"],
        text: json["text"],
        explaination: json["explaination"],
        translation: json["translation"],
        audio: json["audio"],
      );
}
