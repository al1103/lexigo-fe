import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_service.g.dart';

enum NetworkStatus {
  connected,
  disconnected,
  unknown,
}

extension NetworkStatusExtension on NetworkStatus {
  bool get isConnected => this == NetworkStatus.connected;
  bool get isDisconnected => this == NetworkStatus.disconnected;

  String get displayMessage {
    switch (this) {
      case NetworkStatus.connected:
        return 'Online • Ready to help';
      case NetworkStatus.disconnected:
        return 'Mất kết nối • Offline';
      case NetworkStatus.unknown:
        return 'Đang kiểm tra kết nối...';
    }
  }
}

class NetworkService {
  NetworkService() {
    _init();
  }

  final Connectivity _connectivity = Connectivity();
  final StreamController<NetworkStatus> _statusController =
      StreamController<NetworkStatus>.broadcast();

  NetworkStatus _currentStatus = NetworkStatus.unknown;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  // Public getters
  NetworkStatus get currentStatus => _currentStatus;
  Stream<NetworkStatus> get statusStream => _statusController.stream;

  void _init() {
    // Listen to connectivity changes
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );

    // Check initial connectivity
    _checkInitialConnectivity();
  }

  Future<void> _checkInitialConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      _updateConnectionStatus(result);
    } catch (e) {
      _updateStatus(NetworkStatus.unknown);
    }
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    final hasConnection = results.any(
      (result) =>
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.ethernet,
    );

    final newStatus =
        hasConnection ? NetworkStatus.connected : NetworkStatus.disconnected;

    _updateStatus(newStatus);
  }

  void _updateStatus(NetworkStatus status) {
    if (_currentStatus != status) {
      _currentStatus = status;
      _statusController.add(status);
    }
  }

  /// Check if device has internet connection
  Future<bool> hasConnection() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return result.any(
        (connectivity) =>
            connectivity == ConnectivityResult.wifi ||
            connectivity == ConnectivityResult.mobile ||
            connectivity == ConnectivityResult.ethernet,
      );
    } catch (e) {
      return false;
    }
  }

  /// Get connection type as string
  Future<String> getConnectionType() async {
    try {
      final result = await _connectivity.checkConnectivity();

      if (result.contains(ConnectivityResult.wifi)) {
        return 'WiFi';
      } else if (result.contains(ConnectivityResult.mobile)) {
        return 'Mobile Data';
      } else if (result.contains(ConnectivityResult.ethernet)) {
        return 'Ethernet';
      } else {
        return 'No Connection';
      }
    } catch (e) {
      return 'Unknown';
    }
  }

  void dispose() {
    _connectivitySubscription?.cancel();
    _statusController.close();
  }
}

@Riverpod(keepAlive: true)
NetworkService networkService(Ref ref) {
  final service = NetworkService();

  // Dispose service when provider is disposed
  ref.onDispose(service.dispose);

  return service;
}

@Riverpod(keepAlive: true)
Stream<NetworkStatus> networkStatusStream(Ref ref) {
  return ref.watch(networkServiceProvider).statusStream;
}

@Riverpod(keepAlive: true)
NetworkStatus currentNetworkStatus(Ref ref) {
  final asyncValue = ref.watch(networkStatusStreamProvider);

  return asyncValue.when(
    data: (status) => status,
    loading: () => NetworkStatus.unknown,
    error: (_, __) => NetworkStatus.unknown,
  );
}
