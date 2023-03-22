import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DesktopSliderAfishaWidget extends StatefulWidget {
  const DesktopSliderAfishaWidget({super.key});

  @override
  State<DesktopSliderAfishaWidget> createState() =>
      _DesktopSliderAfishaWidgetState();
}

class _DesktopSliderAfishaWidgetState extends State<DesktopSliderAfishaWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 530,
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),      
      child: Row(
        children: const [
          Expanded(
            flex: 5,
            child: SliderWidget(),
          ),
          SizedBox(width: 40),
          Flexible(
            flex: 3,
            child: AfishaWidget(),
          ),
        ],
      ),
    );
  }
}

class AfishaWidget extends StatelessWidget {
  const AfishaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: NetworkImage('https://buxstat.uz/images/news/ip.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 33,
            width: 108,
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              // border: Border.all()
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(0, 124, 216, .6).withOpacity(.8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(
                  Icons.announcement_outlined,
                  color: Colors.white,
                  size: 18,
                ),
                // SizedBox(width: 5),
                Text(
                  'E\'lon',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Color.fromARGB(0, 0, 0, 0),
                ],
              ),
            ),
            child: const Text(
              "To'qimachilik va yengil sanoat",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final List<String> _sliderImages = [
    'https://storage.blackterminal.com/source/img/emitents/background_img_logo/1/smF1JVU4zN9WQxmIJTvAQ3ofr3mBUmMJ.jpg',
    'https://storage.blackterminal.com/source/img/emitents/background_img_logo/1/smF1JVU4zN9WQxmIJTvAQ3ofr3mBUmMJ.jpg',
    'https://storage.blackterminal.com/source/img/emitents/background_img_logo/1/smF1JVU4zN9WQxmIJTvAQ3ofr3mBUmMJ.jpg',
  ];
  final CarouselController carouselController = CarouselController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: _sliderImages.length,
                  itemBuilder: (context, index, realIndex) => Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(_sliderImages[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 30, left: 30),
                                height: 33,
                                width: 150,
                                decoration: BoxDecoration(
                                  // border: Border.all()
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromRGBO(0, 124, 216, .6)
                                      .withOpacity(.8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    // SizedBox(width: 5),
                                    Text(
                                      '01.02.2023',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 30, horizontal: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                    end: Alignment.topCenter,
                                    begin: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black,
                                      Color.fromARGB(0, 0, 0, 0),
                                    ],
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        "To'qimachilik va yengil sanoat",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 5,
                                          backgroundColor: _currentIndex == 0
                                              ? Colors.red
                                              : Colors.white,
                                        ),
                                        const SizedBox(width: 5),
                                        CircleAvatar(
                                          radius: 5,
                                          backgroundColor: _currentIndex == 1
                                              ? Colors.red
                                              : Colors.white,
                                        ),
                                        const SizedBox(width: 5),
                                        CircleAvatar(
                                          radius: 5,
                                          backgroundColor: _currentIndex == 2
                                              ? Colors.red
                                              : Colors.white,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  options: CarouselOptions(
                    autoPlayInterval: const Duration(seconds: 5),
                    viewportFraction: 1,
                    aspectRatio: .5,
                    autoPlay: true,
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
              decoration:const BoxDecoration(
                color: Colors.black26,
                // borderRadius: BorderRadius.circular(8),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  // Use the controller to change the current page
                  carouselController.previousPage();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  weight: 18,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black26,
                // borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: () {
                  // Use the controller to change the current page
                  carouselController.nextPage();
                },
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  weight: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
