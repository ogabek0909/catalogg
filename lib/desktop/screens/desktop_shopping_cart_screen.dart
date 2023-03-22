import 'package:catalogg/desktop/widgets/desktop_footer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DesktopShoppingCartScreen extends StatelessWidget {
  DesktopShoppingCartScreen({super.key});
  int numberOfProduct = 0;
  int numberOf = 1;
  List dummyData = [
    {
      'id': 1,
      'type': 'Shoes',
      'company': '"SAMARQAND AVTOMOBIL ZAVODI" MCHJ qo\'shma korxonasi',
      'img_url': 'https://telegra.ph/file/7d1c35973a2bc0a26f934.png',
    },
    {
      'id': 2,
      'type': 'Shoes',
      'company': '"SAMARQAND AVTOMOBIL ZAVODI" MCHJ qo\'shma korxonasi',
      'img_url': 'https://telegra.ph/file/7d1c35973a2bc0a26f934.png',
    },
    {
      'id': 3,
      'type': 'Shoes',
      'company': '"SAMARQAND AVTOMOBIL ZAVODI" MCHJ qo\'shma korxonasi',
      'img_url': 'https://telegra.ph/file/7d1c35973a2bc0a26f934.png',
    },
    {
      'id': 4,
      'type': 'Shoes',
      'company': '"SAMARQAND AVTOMOBIL ZAVODI" MCHJ qo\'shma korxonasi',
      'img_url': 'https://telegra.ph/file/7d1c35973a2bc0a26f934.png',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 99, right: 99, top: 39),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Shopping card',
                  style: TextStyle(
                    fontSize: 37,
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  numberOf > 1 ? '$numberOf items' : '$numberOf item',
                  style: const TextStyle(
                    fontSize: 37,
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Divider(),
            ListView.builder(
              itemCount: dummyData.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 230,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Color(0xFFDEF3FF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(dummyData[index]['img_url']),
                      ),
                      SizedBox(
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dummyData[index]['type'],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              dummyData[index]['company'],
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Olib tashlash',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          '-',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 4, right: 4),
                        padding: EdgeInsets.only(left: 4, right: 4),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1)),
                        child: Text('$numberOf'),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
            DesktopFooterWidget(),
          ],
        ),
      ),
    );
  }
}
