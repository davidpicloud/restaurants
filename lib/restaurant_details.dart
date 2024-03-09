import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rating_summary/rating_summary.dart';
import 'package:rest/providers.dart';

class RestaurantDetails extends ConsumerWidget {
  final RestaurantProvider provider;

  const RestaurantDetails({super.key, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int ratingCount(int r) => ref.read(provider).ratings.where((rating) => rating == r).length;

    final data = ref.watch(provider);
    return Scaffold(
      appBar: AppBar(title: Text(data.restaurant.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.fastfood, color: Colors.orange, size: 20),
                const SizedBox(width: 8),
                Text(data.restaurant.type, style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.blue, size: 20),
                const SizedBox(width: 8),
                Text(data.restaurant.location, style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Értékelésem:', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 24),
                DropdownButton<int>(
                  hint: const Text('Válassz!'),
                  value: data.myRating,
                  borderRadius: BorderRadius.circular(10),
                  items:
                      List.generate(5, (index) => DropdownMenuItem<int>(value: index + 1, child: Text('${index + 1}'))),
                  onChanged: (int? value) =>
                      ref.read(MyReviewProvider(data.restaurant.id).notifier).updateRating(value),
                ),
              ],
            ),
            HookBuilder(builder: (context) {
              final provider = MyReviewProvider(data.restaurant.id);
              final controller =
                  useTextEditingController.fromValue(TextEditingValue(text: ref.read(provider).$2 ?? ''));

              return TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Írj egy értékelést!',
                  contentPadding: const EdgeInsets.all(12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  suffix: IconButton(
                    onPressed: () => ref.read(provider.notifier).updateReview(controller.value.text),
                    icon: const Icon(Icons.send),
                  ),
                ),
                maxLines: 3,
                textInputAction: TextInputAction.send,
                onSubmitted: ref.read(provider.notifier).updateReview,
              );
            }),
            const SizedBox(height: 8),
            const Text('További értékelések:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            RatingSummary(
              counter: data.ratings.length,
              average: data.averageRating,
              showAverage: true,
              counterFiveStars: ratingCount(5),
              counterFourStars: ratingCount(4),
              counterThreeStars: ratingCount(3),
              counterTwoStars: ratingCount(2),
              counterOneStars: ratingCount(1),
              label: 'Értékelés',
            ),
            const SizedBox(height: 8),
            ...[
              for (final review in data.restaurant.reviews)
                ListTile(title: Text(review.user), subtitle: Text(review.comment)),
            ],
          ],
        ),
      ),
    );
  }
}
