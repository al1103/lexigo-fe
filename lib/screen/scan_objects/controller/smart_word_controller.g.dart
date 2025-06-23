// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_word_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$smartWordControllerHash() =>
    r'aa59657602a31a0d73366f20e3611a371be5c187';

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

abstract class _$SmartWordController
    extends BuildlessAutoDisposeAsyncNotifier<SmartWord?> {
  late final String word;

  FutureOr<SmartWord?> build(
    String word,
  );
}

/// See also [SmartWordController].
@ProviderFor(SmartWordController)
const smartWordControllerProvider = SmartWordControllerFamily();

/// See also [SmartWordController].
class SmartWordControllerFamily extends Family<AsyncValue<SmartWord?>> {
  /// See also [SmartWordController].
  const SmartWordControllerFamily();

  /// See also [SmartWordController].
  SmartWordControllerProvider call(
    String word,
  ) {
    return SmartWordControllerProvider(
      word,
    );
  }

  @override
  SmartWordControllerProvider getProviderOverride(
    covariant SmartWordControllerProvider provider,
  ) {
    return call(
      provider.word,
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
  String? get name => r'smartWordControllerProvider';
}

/// See also [SmartWordController].
class SmartWordControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SmartWordController, SmartWord?> {
  /// See also [SmartWordController].
  SmartWordControllerProvider(
    String word,
  ) : this._internal(
          () => SmartWordController()..word = word,
          from: smartWordControllerProvider,
          name: r'smartWordControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$smartWordControllerHash,
          dependencies: SmartWordControllerFamily._dependencies,
          allTransitiveDependencies:
              SmartWordControllerFamily._allTransitiveDependencies,
          word: word,
        );

  SmartWordControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.word,
  }) : super.internal();

  final String word;

  @override
  FutureOr<SmartWord?> runNotifierBuild(
    covariant SmartWordController notifier,
  ) {
    return notifier.build(
      word,
    );
  }

  @override
  Override overrideWith(SmartWordController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SmartWordControllerProvider._internal(
        () => create()..word = word,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        word: word,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SmartWordController, SmartWord?>
      createElement() {
    return _SmartWordControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SmartWordControllerProvider && other.word == word;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, word.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SmartWordControllerRef
    on AutoDisposeAsyncNotifierProviderRef<SmartWord?> {
  /// The parameter `word` of this provider.
  String get word;
}

class _SmartWordControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SmartWordController,
        SmartWord?> with SmartWordControllerRef {
  _SmartWordControllerProviderElement(super.provider);

  @override
  String get word => (origin as SmartWordControllerProvider).word;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
