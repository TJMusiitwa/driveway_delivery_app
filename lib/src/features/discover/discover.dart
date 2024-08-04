import 'package:flutter/cupertino.dart' show CupertinoSearchTextField;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sliding_top_panel/sliding_top_panel.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final List<String> types = [
    'Everything',
    'Thai Cuisine',
    'Burgers',
    'Pizza',
    'Seafood',
    'Vegan',
    'Sandwiches',
    'Indian',
  ];

  final SlidingPanelTopController _controller = SlidingPanelTopController();
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    //_controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton.icon(
            onPressed: () => _controller.open(),
            icon: const Icon(Icons.pin_drop),
            label: const Text(
              '72 Potrero Ave',
            )),
        centerTitle: false,
      ),
      body: SlidingTopPanel(
        controller: _controller,
        maxHeight: MediaQuery.of(context).size.height / 2.5,
        decorationPanel: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        panel: (context) {
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 150,
                    decoration: const BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),
                RadioListTile(
                    title: const Text('Use current location'),
                    subtitle: const Text('72 Potrero Ave'),
                    value: true,
                    groupValue: true,
                    activeColor: Theme.of(context).colorScheme.primary,
                    onChanged: (address) {}),
                const Divider(),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text('Add new address'))
              ],
            ),
          );
        },
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Discover',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CupertinoSearchTextField(
                  placeholder: 'Search for food...',
                  prefixIcon: const Icon(Icons.fastfood),
                  onSubmitted: (value) {},
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 6),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 16),
                child: SizedBox(
                  height: 35,
                  child: ListView.separated(
                    itemCount: types.length,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return FilterChip(
                        label: Text(types[index]),
                        onSelected: (selectedTag) {
                          debugPrint(selectedTag.toString());
                        },
                        shape: const StadiumBorder(),
                        //selected: true,
                        selectedColor: Theme.of(context).primaryColor,
                        showCheckmark: false,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(width: 8),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: GridView.custom(
                    shrinkWrap: true,
                    controller: scrollController,
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 3,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      repeatPattern: QuiltedGridRepeatPattern.same,
                      pattern: const [
                        QuiltedGridTile(2, 2),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                        ((context, index) => GridTile(
                              child: Image.asset(
                                'assets/img/meal2.jpg',
                                fit: BoxFit.cover,
                              ),
                            )),
                        childCount: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
