import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mymealsapp_ue204085/enums%20and%20extensions/all.dart';
import 'package:mymealsapp_ue204085/providers/filters_provider.dart';

// import '../screens/tabs.dart';
// import '../widgets/main_drawer.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  void changeFilter(Filter filter, bool value) {
    final filtersNotifier = ref.read(filtersProvider.notifier);
    filtersNotifier.setFilter(filter, value);
  }

  @override
  Widget build(BuildContext context) {
    final filters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: filters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              changeFilter(Filter.glutenFree, isChecked);
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Color.fromARGB(255, 236, 0, 0),
                    fontSize: 30,
                  ),
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Color.fromARGB(255, 236, 0, 216),
                    fontSize: 15,
                  ),
            ),
            activeColor: Color.fromARGB(255, 0, 90, 236),
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: filters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              changeFilter(Filter.lactoseFree, isChecked);
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Color.fromARGB(255, 236, 0, 0),
                    fontSize: 30,
                  ),
            ),
            subtitle: Text(
              'Only include lactose-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Color.fromARGB(255, 236, 0, 216),
                    fontSize: 15,
                  ),
            ),
            activeColor: Color.fromARGB(255, 0, 90, 236),
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: filters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              changeFilter(Filter.vegetarian, isChecked);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Color.fromARGB(255, 236, 0, 0),
                    fontSize: 30,
                  ),
            ),
            subtitle: Text(
              'Only include vegetarian meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Color.fromARGB(255, 236, 0, 216),
                    fontSize: 15,
                  ),
            ),
            activeColor: Color.fromARGB(255, 13, 156, 32),
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: filters[Filter.vegan]!,
            onChanged: (isChecked) {
              changeFilter(Filter.vegan, isChecked);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Color.fromARGB(255, 236, 0, 0),
                    fontSize: 30,
                  ),
            ),
            subtitle: Text(
              'Only include vegan meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Color.fromARGB(255, 236, 0, 216),
                    fontSize: 15,
                  ),
            ),
            activeColor: Color.fromARGB(248, 12, 186, 47),
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
