# AnimateCon

AnimateCon is a lightweight and easy-to-use Flutter animation container that enables developers to effortlessly implement zooming, panning, and rotating animations. By utilizing AnimateCon, developers can seamlessly create complex and engaging animations within Flutter applications, thereby enhancing the overall user experience and making the interface more dynamic and interactive.

## Installation

### Install the AnimateCon

#### You should ensure that you add the following dependency in your Flutter project.
```shell
dependencies:
  animatecon: ^1.1.0
```

#### install packages from the command line:
```shell
flutter packages get
```

## Useage

#### import class
```dart
import 'package:animatecon/animatecon.dart';
```

#### use AnimateCon
```dart
// add animate container
body: Center(
        child: AnimateCon(
          key: _key,
          initProp: const {"alpha": 0},
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          )
        ),
      ),

/// control animate
final GlobalKey<AnimateConState> _key = GlobalKey<AnimateConState>();
bool _btnEnabled = true;

void _animate() {
    if (!_btnEnabled) return;
    _key.currentState!.animate({"y": 100, "alpha": 0.0}, {"y": 0.0, "alpha": 1.0},
        time: 500, ease: animateEase.back.easeOut, onComplete: () {
      _btnEnabled = true;
    });
    _btnEnabled = false;
}

/// stop animate
_key.currentState!.stop();
```

## License
AnimateCon is licensed under MIT license. View license.[https://github.com/flutterkit/AnimateCon/blob/master/LICENSE](https://github.com/flutterkit/zerker/blob/master/LICENSE)
