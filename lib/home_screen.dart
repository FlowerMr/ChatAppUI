//import 'package:flutter/cupertino.dart';
import 'package:chat/chat_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> people = [
    'Reza',
    'Mojdeh',
    'Mary',
    'luci',
    'Leon',
    'Reza2',
    'Mojdeh2',
    'Mary2',
    'luci2',
    'Leon2',
    'Reza3',
    'Mojdeh3',
    'Mary3',
    'luci3',
    'Leon3',
    'Reza4',
    'Mojdeh4',
    'Mary4',
    'luci4',
    'Leon4' 'Reza5',
    'Mojdeh5',
    'Mary5',
    'luci5',
    'Leon5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hallo Schatzi",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
            ),
            Text(
              "Hallo Schatzi",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: .0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit_square,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Center(
              child: ListView.builder(
                itemCount: people.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/${i + 1}.png'),
                              scale: 10,
                            ),
                            shape: BoxShape.circle,
                            color: Colors.grey.shade200,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(people[i]),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const Divider(),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: people.length,
              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                ChatDetailScreen(index + 1, people[index]),
                          ));
                    },
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.asset("assets/${index + 1}.png"),
                      ),
                    ),
                    title: Text(
                      people[index],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      "Ich mache es",
                      style: TextStyle(
                          // fontWeight: FontWeight.bold
                          ),
                    ),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "00:21",
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              CupertinoIcons.pin_fill,
                              size: 15,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 15,
                              height: 15,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                              child: const Text(
                                "1",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 9),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ],
      )),
    );
  }
}
