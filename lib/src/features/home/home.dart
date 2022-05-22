import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_top_panel/sliding_top_panel.dart';

enum ViewType {
  grid,
  list,
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const List<String> tags = [
    'Fastest Delivery',
    'Top Rated',
    'Wallet Friendly',
    'Near You',
    'New in Town',
    'National Favorites',
    'New and Noteworthy',
    'Cheat Day',
    'Popular',
    'Trending',
    'Stay Well',
    'Premium Pricing',
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _crossAxisCount = 2;

  double _itemAspectRatio = 0.85;

  ViewType _viewType = ViewType.grid;

  final SlidingPanelTopController _controller = SlidingPanelTopController();
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
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
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Restaurants',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      const Spacer(),
                      //? Could do with Animated Icon/Animated Cross fade
                      IconButton(
                        onPressed: () {
                          if (_viewType == ViewType.list) {
                            _crossAxisCount = 2;
                            _itemAspectRatio = 0.85;
                            _viewType = ViewType.grid;
                          } else {
                            _crossAxisCount = 1;
                            _itemAspectRatio = 1.7;
                            _viewType = ViewType.list;
                          }
                          setState(() {});
                        },
                        icon: Icon(_viewType == ViewType.grid
                            ? Icons.list
                            : Icons.grid_view_outlined),
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CupertinoSearchTextField(
                    placeholder: 'Search for restaurants...',
                    prefixIcon: const Icon(Icons.store),
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
                  padding: const EdgeInsets.only(left: 25, top: 16, bottom: 16),
                  child: SizedBox(
                    height: 35,
                    child: ListView.separated(
                      itemCount: HomePage.tags.length,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return FilterChip(
                          label: Text(HomePage.tags[index]),
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
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _crossAxisCount,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: _itemAspectRatio,
                  ),
                  controller: scrollController,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  itemCount: 14,
                  itemBuilder: (BuildContext context, int index) {
                    return HomeItem(viewType: _viewType);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

class HomeItem extends StatelessWidget {
  const HomeItem({
    Key? key,
    required ViewType viewType,
  })  : _viewType = viewType,
        super(key: key);

  final ViewType _viewType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: _viewType == ViewType.grid
          ? MediaQuery.of(context).size.width / 2
          : null,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: SizedBox(
                height: 100,
                child: ListView.separated(
                  itemCount: 10,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset('assets/img/meal1.jpg',
                        fit: BoxFit.cover);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(width: 8),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text(
                'Restaurant Categories',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 4),
              child: Text(
                'Restaurant Name',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 16, 10, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.stars_outlined,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    '4.5',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.timer_outlined,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    '30\'',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.favorite_outline,
                    color: Colors.grey,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
