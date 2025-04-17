import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';


final randomStreamProvider = StreamProvider.autoDispose<String>((ref) async* {

  await for(final name in RandomGenerator.getListRandomNames() ) {

    yield name;
  }

});

// final randomStreamProvider = StreamProvider<List<String>>((ref) async* {

//   await Future.delayed(const Duration(seconds: 2)) ; 

//   yield [];
//   await Future.delayed(const Duration(seconds: 1)) ; 

//   yield ['Edrick Lopez'];
//   await Future.delayed(const Duration(seconds: 1)) ; 

//   yield ['Edrick Lopez', 'Fernando'];
//   await Future.delayed(const Duration(seconds: 2)) ; 

//   yield ['Edrick Lopez', 'Fernando'];
// });