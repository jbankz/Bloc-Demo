import 'dart:math';

/***
 * This class will be used to simulate a delayers for some seconds
 * just as a normal network would have done when getting informations from a rest API
 */

class MockDelayService {
  Random random = Random();
  Random rnd = Random();

  Future<dynamic> delay() async {
    var now = DateTime.now();
    Random rnd2 = Random(now.millisecondsSinceEpoch);

    int randomNumber = random.nextInt(100);

    int min = 13, max = 42;

    await Future.delayed(const Duration(seconds: 5));
    int r = min + rnd.nextInt(max - min);
    return r;
  }
}
