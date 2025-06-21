import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/common/widgets/empty_state.dart';
import 'package:lexigo/common/widgets/error_state.dart';
import 'package:lexigo/common/widgets/loading_widget.dart';

class AsyncWidget<T> extends StatelessWidget {
  const AsyncWidget({
    required this.value,
    required this.data,
    super.key,
    this.error,
    this.loading,
    this.empty,
    this.isEmpty,
  });
  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final Widget Function(Object error, StackTrace stackTrace)? error;
  final Widget? loading;
  final Widget? empty;
  final bool Function(T data)? isEmpty;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: (data) {
        if (isEmpty?.call(data) == true) {
          return empty ??
              const EmptyState(
                icon: Icons.inbox,
                title: 'No data',
                subtitle: 'No information available',
              );
        }
        return this.data(data);
      },
      loading: () => loading ?? const AppLoading(),
      error: (err, stack) =>
          error?.call(err, stack) ??
          ErrorState(
            message: err.toString(),
            onRetry: () {
              // Refresh logic would go here
            },
          ),
    );
  }
}
