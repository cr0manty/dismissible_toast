import 'package:dismissible_toast/src/constants.dart';
import 'package:dismissible_toast/src/widget.dart';
import 'package:flutter/material.dart';

class DismissibleToast {
  static void show(
    String msg,
    BuildContext context, {
    Border border,
    int duration = DismissibleToastConstants.lengthLong,
    int gravity = DismissibleToastConstants.bottom,
    Color backgroundColor = const Color(0xAA000000),
    TextStyle textStyle = const TextStyle(fontSize: 15, color: Colors.white),
    double backgroundRadius = 20,
    EdgeInsets padding = const EdgeInsets.fromLTRB(16, 10, 16, 10),
    EdgeInsets margin = const EdgeInsets.symmetric(horizontal: 20),
  }) {
    _ToastView.instance.dismiss(removeAll: true);
    _ToastView.instance.createView(
      msg,
      context,
      duration,
      gravity,
      backgroundColor,
      textStyle,
      backgroundRadius,
      border,
      padding,
      margin,
    );
  }

  static void dismissAll() => _ToastView.instance.dismiss(removeAll: true);
}

class _ToastView {
  static final _ToastView instance = _ToastView._();

  _ToastView._();

  final Map<Key, OverlayEntry> _overlayEntryList = {};

  Future<void> createView(
    String msg,
    BuildContext context,
    int duration,
    int gravity,
    Color background,
    TextStyle textStyle,
    double backgroundRadius,
    Border border,
    EdgeInsets padding,
    EdgeInsets margin,
  ) async {
    OverlayState overlayState = Overlay.of(context);
    final Key id = UniqueKey();

    final entry = OverlayEntry(builder: (context) {
      return DismissibleToastWidget(
        widget: GestureDetector(
          onTap: () => dismiss(id: id),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(backgroundRadius),
                  border: border,
                ),
                margin: margin,
                padding: padding,
                child: Text(
                  msg,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: textStyle,
                ),
              ),
            ),
          ),
        ),
        gravity: gravity,
      );
    });
    _overlayEntryList[id] = entry;
    overlayState.insert(entry);
    await Future.delayed(
      Duration(
        seconds: duration ?? DismissibleToastConstants.lengthShort,
      ),
    );
    dismiss(id: id);
  }

  void dismiss({Key id, bool removeAll = false}) {
    if (removeAll) {
      _overlayEntryList.forEach((key, value) => value?.remove());
      _overlayEntryList?.clear();
    } else {
      _overlayEntryList[id]?.remove();
      _overlayEntryList.removeWhere((key, value) => key == id);
    }
  }
}
