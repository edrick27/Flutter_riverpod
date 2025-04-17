import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/providers/pokemon_provider.dart';

class PokemonScreen extends ConsumerWidget {

  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final pokemonId = ref.watch(pokemonIdProvider);
    final pokemonAsync = ref.watch(pokemonNameProvider);
    // final pokemonAsync = ref.watch(pokemonNameProvider(pokemonId));

    return Scaffold(
      appBar: AppBar(
        title: Text('ID del pokemon: $pokemonId'),
      ),
      body: Center(child: _body(pokemonAsync)),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'flt-1',
            child: const Icon(
              Icons.exposure_plus_1,
            ),
            onPressed: () {
              ref.read( pokemonIdProvider.notifier).update((int state) => state + 1);
            }
          ),

          const SizedBox(
            height: 10.0,
          ),

          FloatingActionButton(
            heroTag: 'flt-2',
            child: const Icon(
              Icons.exposure_minus_1,
            ),
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).update((int state) => state-1 );
            }
          ),
        ],
      ),
    );
  }
  
  Widget _body(AsyncValue pokemonAsync) {

    return pokemonAsync.when(
      data: (value) {

        return Text(
          value,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 18.0,
          ),
        );
      }, 
      error: (error, _) => Text('Error: $error'), 
      loading: () {
        return const CircularProgressIndicator();
      }
    );
  }
}