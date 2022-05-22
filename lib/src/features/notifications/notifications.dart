import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return Scaffold(
        appBar: AppBar(
          title: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: CupertinoSlidingSegmentedControl(
              children: const {
                0: Icon(Icons.notifications),
                1: Icon(Icons.mail),
              },
              groupValue: _selectedIndex,
              onValueChanged: (int? value) =>
                  setState(() => _selectedIndex = value!),
            ),
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                child: Text(
                  _selectedIndex == 0 ? 'Notifications' : 'Messages',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
              _selectedIndex == 0
                  ? ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      controller: scrollController,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            child:
                                const Icon(Icons.sports_motorsports_outlined),
                          ),
                          title: Row(
                            children: [
                              Text(
                                'Jane Doe',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface),
                              ),
                              const Spacer(),
                              Text(
                                '1 hour ago',
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                          subtitle: const Text(
                              'The driver is close and will be with you any minute noe'),
                          isThreeLine: true,
                          onTap: () {},
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      controller: scrollController,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: const CircleAvatar(
                            backgroundImage: AssetImage('assets/img/logo.png'),
                          ),
                          title: Row(
                            children: [
                              Text(
                                'Jane Doe',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface),
                              ),
                              Text(
                                ' (support)',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const Spacer(),
                              Text(
                                '1 week ago',
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                          subtitle: const Text('This is a message'),
                          isThreeLine: true,
                          onTap: () {},
                        );
                      },
                    ),
            ],
          ),
        ));
  }
}
