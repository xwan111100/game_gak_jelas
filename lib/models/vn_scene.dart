class VNScene {
  final String id;
  final String background;
  final String? characterName;
  final String? characterSprite;
  final String dialog;
  final List<VNChoice>? choices;
  final String? nextSceneId;

  VNScene({
    required this.id,
    required this.background,
    this.characterName,
    this.characterSprite,
    required this.dialog,
    this.choices,
    this.nextSceneId,
  });

  bool get hasChoices => choices != null && choices!.isNotEmpty;
}

class VNChoice {
  final String text;
  final String nextSceneId;

  VNChoice({
    required this.text,
    required this.nextSceneId,
  });
}