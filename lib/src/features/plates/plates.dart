import 'package:flutter/cupertino.dart'
    show showCupertinoDialog, CupertinoSearchTextField;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PlatesPage extends StatelessWidget {
  const PlatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.pin_drop),
            label: const Text(
              '72 Potrero Ave',
            )),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Plates',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  IconButton(
                      onPressed: () {
                        showCupertinoDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: const Text('Private Plates'),
                                  content: const Text(
                                      'Your plates are private and only visible to you.'),
                                  actions: [
                                    TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text('I Understand'))
                                  ],
                                ));
                      },
                      icon: const Icon(Icons.lock))
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoSearchTextField(
                placeholder: 'Search through your plates...',
                prefixIcon: const Icon(Icons.pie_chart),
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
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: SizedBox(
                height: 30,
                child: Row(
                  children: [
                    FilterChip(
                        selected: true,
                        label: const Text('Recently Crafted'),
                        onSelected: (filter) {}),
                    const SizedBox(width: 10),
                    FilterChip(
                        label: const Text('Alphabetical'),
                        onSelected: (filter) {}),
                  ],
                ),
              ),
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
                childAspectRatio: 0.7,
              ),
              shrinkWrap: true,
              itemCount: 3,
              controller: scrollController,
              padding: const EdgeInsets.all(20),
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 400,
                  width: 100,
                  child: Card(
                    elevation: 1,
                    shadowColor: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: ClipOval(
                              child: GridView.custom(
                                shrinkWrap: true,
                                controller: scrollController,
                                gridDelegate: SliverQuiltedGridDelegate(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 2,
                                  crossAxisSpacing: 3,
                                  repeatPattern: QuiltedGridRepeatPattern.same,
                                  pattern: const [
                                    QuiltedGridTile(2, 1),
                                    QuiltedGridTile(1, 1),
                                    QuiltedGridTile(1, 1),
                                  ],
                                ),
                                childrenDelegate: SliverChildBuilderDelegate(
                                    ((context, index) => Image.asset(
                                          'assets/img/dark.png',
                                          fit: BoxFit.cover,
                                        )),
                                    childCount: 3),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Breakfast',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Text('32 items',
                              style: Theme.of(context).textTheme.labelMedium!),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
