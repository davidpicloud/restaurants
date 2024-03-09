// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hiveBoxHash() => r'b352a6a56a503beae8ef067108d2c962dd36cfa0';

/// See also [hiveBox].
@ProviderFor(hiveBox)
final hiveBoxProvider = FutureProvider<Box>.internal(
  hiveBox,
  name: r'hiveBoxProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$hiveBoxHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HiveBoxRef = FutureProviderRef<Box>;
String _$restaurantHash() => r'35e8280bce32495267553d08528e2ce562e4f35b';

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

/// See also [restaurant].
@ProviderFor(restaurant)
const restaurantProvider = RestaurantFamily();

/// See also [restaurant].
class RestaurantFamily extends Family<RestaurantWithMyReview> {
  /// See also [restaurant].
  const RestaurantFamily();

  /// See also [restaurant].
  RestaurantProvider call(
    Restaurant restaurantBase,
  ) {
    return RestaurantProvider(
      restaurantBase,
    );
  }

  @override
  RestaurantProvider getProviderOverride(
    covariant RestaurantProvider provider,
  ) {
    return call(
      provider.restaurantBase,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'restaurantProvider';
}

/// See also [restaurant].
class RestaurantProvider extends AutoDisposeProvider<RestaurantWithMyReview> {
  /// See also [restaurant].
  RestaurantProvider(
    Restaurant restaurantBase,
  ) : this._internal(
          (ref) => restaurant(
            ref as RestaurantRef,
            restaurantBase,
          ),
          from: restaurantProvider,
          name: r'restaurantProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$restaurantHash,
          dependencies: RestaurantFamily._dependencies,
          allTransitiveDependencies: RestaurantFamily._allTransitiveDependencies,
          restaurantBase: restaurantBase,
        );

  RestaurantProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.restaurantBase,
  }) : super.internal();

  final Restaurant restaurantBase;

  @override
  Override overrideWith(
    RestaurantWithMyReview Function(RestaurantRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RestaurantProvider._internal(
        (ref) => create(ref as RestaurantRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        restaurantBase: restaurantBase,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<RestaurantWithMyReview> createElement() {
    return _RestaurantProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RestaurantProvider && other.restaurantBase == restaurantBase;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, restaurantBase.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RestaurantRef on AutoDisposeProviderRef<RestaurantWithMyReview> {
  /// The parameter `restaurantBase` of this provider.
  Restaurant get restaurantBase;
}

class _RestaurantProviderElement extends AutoDisposeProviderElement<RestaurantWithMyReview> with RestaurantRef {
  _RestaurantProviderElement(super.provider);

  @override
  Restaurant get restaurantBase => (origin as RestaurantProvider).restaurantBase;
}

String _$myReviewHash() => r'2437db7e1f9a08ed92a962f9161abb0f4469c8cf';

abstract class _$MyReview extends BuildlessAutoDisposeNotifier<(int?, String?)> {
  late final int id;

  (int?, String?) build(
    int id,
  );
}

/// See also [MyReview].
@ProviderFor(MyReview)
const myReviewProvider = MyReviewFamily();

/// See also [MyReview].
class MyReviewFamily extends Family<(int?, String?)> {
  /// See also [MyReview].
  const MyReviewFamily();

  /// See also [MyReview].
  MyReviewProvider call(
    int id,
  ) {
    return MyReviewProvider(
      id,
    );
  }

  @override
  MyReviewProvider getProviderOverride(
    covariant MyReviewProvider provider,
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
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'myReviewProvider';
}

/// See also [MyReview].
class MyReviewProvider extends AutoDisposeNotifierProviderImpl<MyReview, (int?, String?)> {
  /// See also [MyReview].
  MyReviewProvider(
    int id,
  ) : this._internal(
          () => MyReview()..id = id,
          from: myReviewProvider,
          name: r'myReviewProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$myReviewHash,
          dependencies: MyReviewFamily._dependencies,
          allTransitiveDependencies: MyReviewFamily._allTransitiveDependencies,
          id: id,
        );

  MyReviewProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  (int?, String?) runNotifierBuild(
    covariant MyReview notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(MyReview Function() create) {
    return ProviderOverride(
      origin: this,
      override: MyReviewProvider._internal(
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
  AutoDisposeNotifierProviderElement<MyReview, (int?, String?)> createElement() {
    return _MyReviewProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyReviewProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MyReviewRef on AutoDisposeNotifierProviderRef<(int?, String?)> {
  /// The parameter `id` of this provider.
  int get id;
}

class _MyReviewProviderElement extends AutoDisposeNotifierProviderElement<MyReview, (int?, String?)> with MyReviewRef {
  _MyReviewProviderElement(super.provider);

  @override
  int get id => (origin as MyReviewProvider).id;
}

String _$restaurantProviderListHash() => r'556580a75eb7286224abfd52ccbb4cfad6beef04';

/// See also [RestaurantProviderList].
@ProviderFor(RestaurantProviderList)
final restaurantProviderListProvider =
    AutoDisposeNotifierProvider<RestaurantProviderList, List<RestaurantProvider>>.internal(
  RestaurantProviderList.new,
  name: r'restaurantProviderListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$restaurantProviderListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RestaurantProviderList = AutoDisposeNotifier<List<RestaurantProvider>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
