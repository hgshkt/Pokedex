class Pokemon {
  final int id;
  final String name;
  final String imagePath;
  final String typeFirst;
  final String typeSecond;
  final int weight;
  final String firstAbility;
  final String secondAbility;

  Pokemon({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.typeFirst,
    required this.typeSecond,
    required this.weight,
    required this.firstAbility,
    required this.secondAbility,
  });

  Pokemon.empty()
      : id = 0,
        name = 'name',
        imagePath = 'image path',
        typeFirst = 'normal',
        typeSecond = 'normal',
        weight = 0,
        firstAbility = 'firstAbility',
        secondAbility = 'secondAbility';
}
