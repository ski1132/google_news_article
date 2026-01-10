import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteHistoryObserver extends GetObserver {
  static final List<String> history = [];

  static void backToBeforeRouteName(String routeName) {
    final routeIndex = RouteHistoryObserver.history.indexWhere(
      (route) => route == routeName,
    );
    final numberToRouteBack = RouteHistoryObserver.history.length - routeIndex;
    for (int i = 0; i < numberToRouteBack; i++) {
      Get.back();
    }
  }

  static void backToRouteName(String routeName) {
    final routeIndex = RouteHistoryObserver.history.indexWhere(
      (route) => route == routeName,
    );
    final numberToRouteBack =
        RouteHistoryObserver.history.length - routeIndex - 1;

    for (int i = 0; i < numberToRouteBack; i++) {
      Get.back();
    }
  }

  void _add(Route? route) {
    final name = route?.settings.name;
    if (name != null && name.isNotEmpty) {
      history.add(name);
    }
  }

  void _remove(Route? route) {
    final name = route?.settings.name;
    history.removeWhere((e) => e == name);
  }

  void _clearAll() {
    history.clear();
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _add(route);
    _log('PUSH', route);
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _remove(route);
    _log('POP', route);
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _remove(route);
    _log('REMOVE', route);
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _remove(oldRoute);
    _add(newRoute);
    _log('REPLACE', newRoute);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  // ปลอดภัยกับ offAll → หลอด stack เดิมทั้งหมด
  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    if (history.isEmpty) return;
    _clearAll(); // ✅ optional: ถ้าคุณใช้ offAll ให้เคลียร์ history
  }

  void _log(String action, Route? route) {
    debugPrint("[$action] ${route?.settings.name}");
    debugPrint("History Stack: $history\n");
  }
}
