// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSingleProductHash() => r'31e438007a2457e73878c08270df10959e8447bd';

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

/// See also [getSingleProduct].
@ProviderFor(getSingleProduct)
const getSingleProductProvider = GetSingleProductFamily();

/// See also [getSingleProduct].
class GetSingleProductFamily extends Family<AsyncValue<Product>> {
  /// See also [getSingleProduct].
  const GetSingleProductFamily();

  /// See also [getSingleProduct].
  GetSingleProductProvider call(
    int productId,
  ) {
    return GetSingleProductProvider(
      productId,
    );
  }

  @override
  GetSingleProductProvider getProviderOverride(
    covariant GetSingleProductProvider provider,
  ) {
    return call(
      provider.productId,
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
  String? get name => r'getSingleProductProvider';
}

/// See also [getSingleProduct].
class GetSingleProductProvider extends AutoDisposeFutureProvider<Product> {
  /// See also [getSingleProduct].
  GetSingleProductProvider(
    int productId,
  ) : this._internal(
          (ref) => getSingleProduct(
            ref as GetSingleProductRef,
            productId,
          ),
          from: getSingleProductProvider,
          name: r'getSingleProductProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSingleProductHash,
          dependencies: GetSingleProductFamily._dependencies,
          allTransitiveDependencies:
              GetSingleProductFamily._allTransitiveDependencies,
          productId: productId,
        );

  GetSingleProductProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
  }) : super.internal();

  final int productId;

  @override
  Override overrideWith(
    FutureOr<Product> Function(GetSingleProductRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetSingleProductProvider._internal(
        (ref) => create(ref as GetSingleProductRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Product> createElement() {
    return _GetSingleProductProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSingleProductProvider && other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetSingleProductRef on AutoDisposeFutureProviderRef<Product> {
  /// The parameter `productId` of this provider.
  int get productId;
}

class _GetSingleProductProviderElement
    extends AutoDisposeFutureProviderElement<Product> with GetSingleProductRef {
  _GetSingleProductProviderElement(super.provider);

  @override
  int get productId => (origin as GetSingleProductProvider).productId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
