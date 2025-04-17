import 'package:random_name_generator/random_name_generator.dart';

class RandomGenerator {

  static String getRandonName() {

    final randomNames = RandomNames(Zone.spain);

    return randomNames.fullName();
  }

  static Stream<String> getListRandomNames() {

    return Stream.periodic(
      const Duration(seconds: 2),
      (i) {

        print('Stream New Value');

        return getRandonName();
      }
    );
  }
}