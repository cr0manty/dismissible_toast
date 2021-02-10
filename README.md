# Dismissible Toast

A Flutter Dismissible Toast plugin.

## How to Use

```yaml
# add this line to your dependencies
toast: ^0.0.1
```

```dart
import 'package:dismissible_toast/dismissible_toast.dart';
```

```dart
DismissibleToast.show("DismissibleToast plugin app", context, duration: DismissibleToastConstants.lengthShort, gravity: DismissibleToastConstants.bottom);
```

property | description
--------|------------
msg | String (Not Null)(required)
context | BuildContext (Not Null)(required)
duration| DismissibleToastConstants.lengthShort or DismissibleToastConstants.lengthLong (optional)
gravity | DismissibleToastConstants.top (or) DismissibleToastConstants.center (or) DismissibleToast.bottom
textStyle | TextStyle (default fontSize:15, color: Colors.white)
backgroundColor | Color (default Color(0xAA000000))
backgroundRadius | double （default 16)
border| Border (optional)
backgroundRadius | double （default 16)
border| Border (optional)
padding| EdgeInsert (optional) (default EdgeInsets.fromLTRB(16, 10, 16, 10))
margin| EdgeInsert (optional) (default EdgeInsets.symmetric(horizontal: 20))
