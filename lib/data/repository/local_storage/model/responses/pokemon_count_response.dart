class PokemonCountResponse {
  late int value;
  late bool isSaved;

  PokemonCountResponse.unsaved() {
    value = 0;
    isSaved = false;
  }

  PokemonCountResponse.saved(this.value) {
    isSaved = true;
  }
}