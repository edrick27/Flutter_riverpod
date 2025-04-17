import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/providers/providers.dart';

class StateProviderScreen extends ConsumerWidget {

  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

     final titleStyle = Theme.of(context).textTheme.titleMedium;
     final name = ref.watch(RandomNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'State Provider', 
          style: titleStyle,
        ),
      ),
      body: Center(
        child: Text(name),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {

          ref.invalidate(RandomNameProvider);
        }
      ),
    );
  }
}