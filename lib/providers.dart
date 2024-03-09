import 'package:hive_flutter/hive_flutter.dart';
import 'package:rest/restaurant.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
FutureOr<Box> hiveBox(HiveBoxRef ref) => Hive.openBox('myReviews');

@riverpod
class MyReview extends _$MyReview {
  @override
  (int?, String?) build(int id) =>
      (ref.watch(hiveBoxProvider).value?.get('rating$id'), ref.read(hiveBoxProvider).value?.get('review$id'));

  void updateRating(int? rating) {
    ref.read(hiveBoxProvider).value?.put('rating$id', rating);
    state = (rating, ref.read(hiveBoxProvider).value?.get('review$id'));
  }

  void updateReview(String review) {
    ref.read(hiveBoxProvider).value?.put('review$id', review);
    state = (ref.read(hiveBoxProvider).value?.get('rating$id'), review);
  }
}

@riverpod
RestaurantWithMyReview restaurant(RestaurantRef ref, Restaurant restaurantBase) {
  final myReview = ref.watch(myReviewProvider(restaurantBase.id));
  return RestaurantWithMyReview(restaurant: restaurantBase, myRating: myReview.$1, myComment: myReview.$2);
}

@riverpod
class RestaurantProviderList extends _$RestaurantProviderList {
  @override
  List<RestaurantProvider> build() {
    return [for (final restaurant in restaurantBaseList) restaurantProvider(restaurant)];
  }

  void search(String query) {
    state = [
      for (final restaurant in restaurantBaseList)
        if (restaurant.name.toLowerCase().contains(query.toLowerCase()) ||
            restaurant.type.toLowerCase().contains(query.toLowerCase()) ||
            restaurant.location.toLowerCase().contains(query.toLowerCase()))
          restaurantProvider(restaurant)
    ];
  }
}
