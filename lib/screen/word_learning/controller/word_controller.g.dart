// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$wordControllerHash() => r'c9166456f2ee4f2ba89672e77d228ec3caddd293';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$WordController
    extends BuildlessAutoDisposeAsyncNotifier<List<LessonsDetail>> {
  late final int? id;

  FutureOr<List<LessonsDetail>> build(
    int? id,
  );
}

/// See also [WordController].
@ProviderFor(WordController)
const wordControllerProvider = WordControllerFamily();

/// See also [WordController].
class WordControllerFamily extends Family<AsyncValue<List<LessonsDetail>>> {
  /// See also [WordController].
  const WordControllerFamily();

  /// See also [WordController].
  WordControllerProvider call(
    int? id,
  ) {
    return WordControllerProvider(
      id,
    );
  }

  @override
  WordControllerProvider getProviderOverride(
    covariant WordControllerProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'wordControllerProvider';
}

/// See also [WordController].
class WordControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    WordController, List<LessonsDetail>> {
  /// See also [WordController].
  WordControllerProvider(
    int? id,
  ) : this._internal(
          () => WordController()..id = id,
          from: wordControllerProvider,
          name: r'wordControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$wordControllerHash,
          dependencies: WordControllerFamily._dependencies,
          allTransitiveDependencies:
              WordControllerFamily._allTransitiveDependencies,
          id: id,
        );

  WordControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int? id;

  @override
  FutureOr<List<LessonsDetail>> runNotifierBuild(
    covariant WordController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(WordController Function() create) {
    return ProviderOverride(
      origin: this,
      override: WordControllerProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<WordController, List<LessonsDetail>>
      createElement() {
    return _WordControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WordControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WordControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<LessonsDetail>> {
  /// The parameter `id` of this provider.
  int? get id;
}

class _WordControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WordController,
        List<LessonsDetail>> with WordControllerRef {
  _WordControllerProviderElement(super.provider);

  @override
  int? get id => (origin as WordControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
