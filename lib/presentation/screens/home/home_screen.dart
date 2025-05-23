import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverAPP'),
      ),
      body: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {

  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: const [
        _CustomListTile(
          title: 'State Provider',
          subTitle: 'Ventana de muestra nombres random',
          location: '/state-provider',
        ),
        _CustomListTile(
          title: 'Future Provider',
          subTitle: 'Ventana que muestra la lista de pokemons',
          location: '/future-provider',
        ),
        _CustomListTile(
          title: 'Stream Provider',
          subTitle: 'Esta ventana muestra el uso del Screen',
          location: '/stream-provider',
        ),
        _CustomListTile(
          title: 'Notifier Provider',
          subTitle: 'Esta ventana muestra el state Notifier',
          location: '/state-notifier-provider',
        ),
      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {

  final String title;
  final String subTitle;
  final String location;

  const _CustomListTile({
    required this.title,
    required this.subTitle,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: const Icon( Icons.arrow_forward_ios) ,
      onTap: () => context.push(location),
    );
  }
}