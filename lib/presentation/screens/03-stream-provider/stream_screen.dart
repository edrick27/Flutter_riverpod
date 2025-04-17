import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/providers/providers.dart';

class StreamScreen extends ConsumerWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final randomNames$ = ref.watch(randomStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Screen'),
      ),
      body: _body(randomNames$),
    );
  }

  Widget _body(AsyncValue<String> randomNames$) {

    return randomNames$.when(data: (data) {

      return Center(
        child: Text(data),
      );
    }, error: (error, _) {
      return const Text('');
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }
}
