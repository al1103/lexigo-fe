// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_level_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vocabularyLevelDetailControllerHash() =>
    r'ca004014b5e467c7caa0c8937172875ca0320544';

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

abstract class _$VocabularyLevelDetailController
    extends BuildlessAutoDisposeAsyncNotifier<
        PayloadPageableDto<VocabularyModel>> {
  late final String level;

  FutureOr<PayloadPageableDto<VocabularyModel>> build(
    String level,
  );
}

/// See also [VocabularyLevelDetailController].
@ProviderFor(VocabularyLevelDetailController)
const vocabularyLevelDetailControllerProvider =
    VocabularyLevelDetailControllerFamily();

/// See also [VocabularyLevelDetailController].
class VocabularyLevelDetailControllerFamily
    extends Family<AsyncValue<PayloadPageableDto<VocabularyModel>>> {
  /// See also [VocabularyLevelDetailController].
  const VocabularyLevelDetailControllerFamily();

  /// See also [VocabularyLevelDetailController].
  VocabularyLevelDetailControllerProvider call(
    String level,
  ) {
    return VocabularyLevelDetailControllerProvider(
      level,
    );
  }

  @override
  VocabularyLevelDetailControllerProvider getProviderOverride(
    covariant VocabularyLevelDetailControllerProvider provider,
  ) {
    return call(
      provider.level,
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
  String? get name => r'vocabularyLevelDetailControllerProvider';
}

/// See also [VocabularyLevelDetailController].
class VocabularyLevelDetailControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        VocabularyLevelDetailController, PayloadPageableDto<VocabularyModel>> {
  /// See also [VocabularyLevelDetailController].
  VocabularyLevelDetailControllerProvider(
    String level,
  ) : this._internal(
          () => VocabularyLevelDetailController()..level = level,
          from: vocabularyLevelDetailControllerProvider,
          name: r'vocabularyLevelDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vocabularyLevelDetailControllerHash,
          dependencies: VocabularyLevelDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              VocabularyLevelDetailControllerFamily._allTransitiveDependencies,
          level: level,
        );

  VocabularyLevelDetailControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.level,
  }) : super.internal();

  final String level;

  @override
  FutureOr<PayloadPageableDto<VocabularyModel>> runNotifierBuild(
    covariant VocabularyLevelDetailController notifier,
  ) {
    return notifier.build(
      level,
    );
  }

  @override
  Override overrideWith(VocabularyLevelDetailController Function() create) {
    return ProviderOverride(
      origin: this,
      override: VocabularyLevelDetailControllerProvider._internal(
        () => create()..level = level,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        level: level,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<VocabularyLevelDetailController,
      PayloadPageableDto<VocabularyModel>> createElement() {
    return _VocabularyLevelDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VocabularyLevelDetailControllerProvider &&
        other.level == level;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, level.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VocabularyLevelDetailControllerRef on AutoDisposeAsyncNotifierProviderRef<
    PayloadPageableDto<VocabularyModel>> {
  /// The parameter `level` of this provider.
  String get level;
}

class _VocabularyLevelDetailControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        VocabularyLevelDetailController, PayloadPageableDto<VocabularyModel>>
    with VocabularyLevelDetailControllerRef {
  _VocabularyLevelDetailControllerProviderElement(super.provider);

  @override
  String get level => (origin as VocabularyLevelDetailControllerProvider).level;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
