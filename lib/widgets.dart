import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class abovetabbar extends StatelessWidget {
  const abovetabbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              const ListTile(
                title: Text(
                  'The biryani Life',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Biryani,Grills,Indian ',
                  textAlign: TextAlign.start,
                ),
                isThreeLine: false,
                trailing: TextButton(
                    onPressed: null,
                    child: Text(
                      "info",
                      style: TextStyle(color: Colors.orange),
                    )),
              ),
              Row(
                children: const [
                  Icon(Icons.emoji_emotions_outlined),
                  SizedBox(
                    width: 2,
                  ),
                  Text('Good '),
                  Text('(45 Ratings)'),
                  Spacer(),
                  TextButton(
                      onPressed: null,
                      child: Text(
                        'Reviews',
                        style: TextStyle(color: Colors.orange),
                      ))
                ],
              ),
              const Divider(
                color: Colors.grey,
              ),
              Row(
                children: [
                  Column(children: const [Icon(Icons.emoji_emotions_outlined)]),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: 'In 28 mins ',
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '(Delievery fee: AED 8.00 )',
                                      style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: 'Delieverd with by live tracking by ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'talabat',
                                      style: TextStyle(color: Colors.orange)),
                                ],
                              ),
                            ),
                          ],
                        )
                      ]),
                  const Spacer(),
                  Column(children: const [Icon(Icons.info_outline)]),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    cardDiscount(),
                    cardDiscount(),
                  ],
                ),
              )
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
          height: 10,
        ),
      ],
    );
  }
}

class cardDiscount extends StatelessWidget {
  const cardDiscount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 230,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                children: const [
                  FaIcon(
                    FontAwesomeIcons.tag,
                    color: Colors.pink,
                    size: 15,
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        '30% of your order',
                        style: TextStyle(color: Colors.pink),
                      )
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        'Min spend AED 27',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
