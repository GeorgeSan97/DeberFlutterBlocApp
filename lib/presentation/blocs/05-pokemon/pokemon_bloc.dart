import 'package:bloc/bloc.dart';
//import 'package:blocs_app/config/config.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  
  final Future<String> Function (int id) _fetchPokemonName;

  PokemonBloc({
    required fetchPokemon
  }) : _fetchPokemonName = fetchPokemon, 
  super(const PokemonState()) {

    on<PokemonAdded>((event, emit) {
      final newPokemons = Map<int, String>.from(state.pokemons);
      newPokemons[event.id] = event.name;
      emit( state.copyWith(pokemons: newPokemons) );
    });

  }

  Future<String> fetchPokemonName(int id) async {

    if (state.pokemons.containsKey(id)) {
      return state.pokemons[id]!;
    }

    try {
      final pokemonName = await  _fetchPokemonName(id);
      add(PokemonAdded(id, pokemonName));
      return pokemonName;

    } catch (e) {
      throw Exception('Failed to fecth Pokémon');
    }
  }
}
