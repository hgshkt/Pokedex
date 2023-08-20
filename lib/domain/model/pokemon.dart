class Pokemon {
  final int id;
  final String name;
  final String imagePath;
  final String firstAbility;
  final String secondAbility;

  Pokemon({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.firstAbility,
    required this.secondAbility,
  });

  Pokemon.empty()
      : id = 0,
        name = 'name',
        imagePath = 'image path',
        firstAbility = 'firstAbility',
        secondAbility = 'secondAbility';
}
