import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rest/providers.dart';
import 'package:rest/restaurant_card.dart';
import 'package:rest/restaurant_details.dart';

void main() async {
  await Hive.initFlutter();
  runApp(ProviderScope(child: Consumer(builder: (context, ref, child) {
    final boxProvider = ref.watch(hiveBoxProvider);
    if (boxProvider.isLoading) const Center(child: CircularProgressIndicator());
    return const MyApp();
  })));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantProviderList = ref.watch(restaurantProviderListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Restaurants Demo Page')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 8),
            HookBuilder(builder: (context) {
              final controller = useTextEditingController();

              return TextField(
                controller: controller,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  hintText: 'Keresés',
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () =>
                            ref.read(restaurantProviderListProvider.notifier).search(controller.value.text),
                        icon: const Icon(Icons.search),
                      ),
                      IconButton(
                        onPressed: () {
                          ref.read(restaurantProviderListProvider.notifier).search('');
                          controller.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ],
                  ),
                ),
                textInputAction: TextInputAction.search,
                onSubmitted: ref.read(restaurantProviderListProvider.notifier).search,
                onTapOutside: (e) => FocusScope.of(context).requestFocus(FocusNode()),
              );
            }),
            const SizedBox(height: 16),
            restaurantProviderList.isEmpty
                ? const Text('Nincs találat')
                : Expanded(
                    child: ListView.builder(
                      itemCount: restaurantProviderList.length,
                      itemBuilder: (context, index) => Consumer(builder: (context, ref, child) {
                        final provider = restaurantProviderList[index];
                        final data = ref.watch(provider);
                        return InkWell(
                            onTap: () => showDialog(
                                context: context, builder: (context) => RestaurantDetails(provider: provider)),
                            child: RestaurantCard(data: data));
                      }),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
