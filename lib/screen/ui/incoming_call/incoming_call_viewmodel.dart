import 'package:stacked/stacked.dart';

class IncomingCallModelView extends BaseViewModel {
  bool _onStartDrag = false;
  bool get onStartDrag => _onStartDrag;

  bool _onEndDrag = false;
  bool get onEndDrag => _onEndDrag;

  void onStartDragfunction(bool dragged) {
    _onStartDrag = dragged;
    notifyListeners();
  }

  void onEndDragfunction(bool dragged) {
    _onEndDrag = dragged;
    notifyListeners();
  }
}
