
import 'view_state_model.dart';

abstract class ViewStateListModel<T> extends ViewStateModel {
  /// 页面数据
  List<T> list = [];

  /// 第一次进入加载骨架屏

  initData() async {
    setBusy();
    await refresh(init: true);
  }

  refresh({bool init = false}) async {
    try {
      List<T> data = await loadData();
      if (data.isEmpty) {
        list.clear();
        setEmpty();
      } else {
        onCompleted(data);
        list.clear();
        list.addAll(data);
        setIdle();
      }
    } catch (e, s) {
      if(init) {
        list.clear();
        setError(e, s);
      }
    }
  }
  Future<List<T>> loadData();

  onCompleted(List<T> data) {}
}
