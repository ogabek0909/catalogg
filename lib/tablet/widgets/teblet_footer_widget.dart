import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabletFooterWidget extends StatefulWidget {
  const TabletFooterWidget({super.key});

  @override
  State<TabletFooterWidget> createState() => _DesktopFooterWidgetState();
}

class _DesktopFooterWidgetState extends State<TabletFooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 255, 242),
        border: Border(
          bottom: BorderSide(color: Colors.blue),
          left: BorderSide(color: Colors.blue),
          top: BorderSide(color: Colors.blue),
          right: BorderSide(color: Colors.blue),
        ),
      ),
      alignment: Alignment.center,
      // height: 280,
      width: double.infinity,
      // color: Colors.grey,
      child: FittedBox(
        fit: BoxFit.fill,
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Ma\'lumotlar',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Buyurtma berish usuli',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Asosiy sahifa',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Ishlab chiqaruvchilar ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Mahsulotlar',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Yangiliklar',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Catalog haqida (malumot beruvchi',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'static pagega o\'tiladi',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 100),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Biz bilan aloqa ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Icon(
                              Icons.call,
                              color: Colors.green,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  '+998781406464',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ))
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.email_outlined,
                              color: Colors.purple,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'info@samauto.uz',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ))
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.blue,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Samarqand viloyati,Samarqand sh.,\nS.Buxoriy ko\'chasi, 5-uy',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ijtimoiy Tarmoqlarimiz',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.instagram,
                            color: Color.fromARGB(255, 241, 35, 80)),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.facebook, color: Colors.blue),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.telegram, color: Colors.blue),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.whatsapp,
                            color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
