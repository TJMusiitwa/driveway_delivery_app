import 'package:flutter/material.dart';
import 'package:flutter_polygon_clipper/flutter_polygon_clipper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static final badges = {
    Icons.rocket: Colors.blue,
    Icons.dark_mode: Colors.black,
    Icons.support: Colors.green,
    Icons.local_police: Colors.orange,
    Icons.photo_camera: const Color(0xFF4952DF),
    Icons.contactless: Colors.red.shade400,
    Icons.cabin: Colors.brown,
    Icons.volunteer_activism: Colors.lightGreen,
    Icons.local_hospital: Colors.pink,
    Icons.ring_volume: Colors.deepOrange,
    Icons.stars: Colors.purple,
    Icons.psychology: Colors.teal,
    Icons.mic: Colors.blueAccent,
    Icons.handshake: Colors.amber,
    Icons.spa: Colors.red,
    Icons.celebration: Colors.deepPurpleAccent,
    Icons.airline_seat_recline_normal: Colors.indigoAccent,
    Icons.explore: Colors.indigo,
    Icons.sports_score: Colors.black
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.star_outline),
                  Icon(Icons.hotel_class_outlined),
                  Icon(Icons.auto_awesome_outlined)
                ],
              ),
              const SizedBox(height: 5),
              LinearProgressIndicator(
                value: 0.65,
                minHeight: 6,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor:
                            const Color(0xFF4952DF).withOpacity(0.3),
                        child: Text(
                          'MJ',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 18,
                        child: ClipOval(
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                            child: const Icon(Icons.hotel_class_outlined,
                                size: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    'Michaela Jacobs',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: const Text('Warrior Gourmand'),
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('Your stats:'),
              ),
              //Need to fix
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  height: 60,
                  child: Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              decoration: const BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.star_rounded,
                                          color: Colors.black54,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '1156',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 3),
                                    const Text('points')
                                  ]),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              decoration: const BoxDecoration(
                                color: Colors.black12,
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.emoji_events_rounded,
                                          color: Colors.black54,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '135',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 3),
                                    const Text('global')
                                  ]),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              decoration: const BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.emoji_events_rounded,
                                          color: Colors.black54,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '32',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 3),
                                    const Text('local')
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('Your badges:'),
              ),
              SizedBox(
                height: 60,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListView.separated(
                    itemCount: badges.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(width: 5),
                    itemBuilder: (BuildContext context, int index) {
                      return FlutterClipPolygon(
                        sides: 6,
                        child: ColoredBox(
                          color: badges.values.elementAt(index),
                          child: IconButton(
                            icon: Icon(badges.keys.elementAt(index)),
                            color: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const Divider(),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('Your latest orders:'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
                child: SizedBox(
                  height: 60,
                  child: ListView.separated(
                    itemCount: 15,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return index == 0
                          ? ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              child: Image.asset('assets/img/dark.png'),
                            )
                          : Image.asset('assets/img/dark.png');
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(width: 5),
                  ),
                ),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.shopping_basket_outlined),
                title: Text('Your Orders'),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.favorite_outline),
                title: Text('Your Favorites'),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.edit_outlined),
                title: Text('Your Reviews'),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.account_balance_wallet_outlined),
                title: Text('Payment Methods'),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.verified_outlined),
                title: Text('Vouchers & Promotions'),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('Help Center'),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.settings_outlined),
                title: Text('Settings'),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.exit_to_app_outlined),
                title: Text('Log Out'),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
