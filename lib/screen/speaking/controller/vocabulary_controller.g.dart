// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vocabularyControllerHash() =>
    r'9bdba60b993d65c7d158592151432f3700a868f4';

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

abstract class _$VocabularyController extends BuildlessAutoDisposeAsyncNotifier<
    PayloadPageableDto<VocabularyModel>> {
  late final String? search;
  late final int? page;

  FutureOr<PayloadPageableDto<VocabularyModel>> build(
    String? search,
    int? page,
  );
}

/// See also [VocabularyController].
@ProviderFor(VocabularyController)
const vocabularyControllerProvider = VocabularyControllerFamily();

/// See also [VocabularyController].
class VocabularyControllerFamily
    extends Family<AsyncValue<PayloadPageableDto<VocabularyModel>>> {
  /// See also [VocabularyController].
  const VocabularyControllerFamily();

  /// See also [VocabularyController].
  VocabularyControllerProvider call(
    String? search,
    int? page,
  ) {
    return VocabularyControllerProvider(
      search,
      page,
    );
  }

  @override
  VocabularyControllerProvider getProviderOverride(
    covariant VocabularyControllerProvider provider,
  ) {
    return call(
      provider.search,
      provider.page,
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
  String? get name => r'vocabularyControllerProvider';
}

/// See also [VocabularyController].
class VocabularyControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    VocabularyController, PayloadPageableDto<VocabularyModel>> {
  /// See also [VocabularyController].
  VocabularyControllerProvider(
    String? search,
    int? page,
  ) : this._internal(
          () => VocabularyController()
            ..search = search
            ..page = page,
          from: vocabularyControllerProvider,
          name: r'vocabularyControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vocabularyControllerHash,
          dependencies: VocabularyControllerFamily._dependencies,
          allTransitiveDependencies:
              VocabularyControllerFamily._allTransitiveDependencies,
          search: search,
          page: page,
        );

  VocabularyControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.search,
    required this.page,
  }) : super.internal();

  final String? search;
  final int? page;

  @override
  FutureOr<PayloadPageableDto<VocabularyModel>> runNotifierBuild(
    covariant VocabularyController notifier,
  ) {
    return notifier.build(
      search,
      page,
    );
  }

  @override
  Override overrideWith(VocabularyController Function() create) {
    return ProviderOverride(
      origin: this,
      override: VocabularyControllerProvider._internal(
        () => create()
          ..search = search
          ..page = page,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        search: search,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<VocabularyController,
      PayloadPageableDto<VocabularyModel>> createElement() {
    return _VocabularyControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VocabularyControllerProvider &&
        other.search == search &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VocabularyControllerRef on AutoDisposeAsyncNotifierProviderRef<
    PayloadPageableDto<VocabularyModel>> {
  /// The parameter `search` of this provider.
  String? get search;

  /// The parameter `page` of this provider.
  int? get page;
}

class _VocabularyControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<VocabularyController,
        PayloadPageableDto<VocabularyModel>> with VocabularyControllerRef {
  _VocabularyControllerProviderElement(super.provider);

  @override
  String? get search => (origin as VocabularyControllerProvider).search;
  @override
  int? get page => (origin as VocabularyControllerProvider).page;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
