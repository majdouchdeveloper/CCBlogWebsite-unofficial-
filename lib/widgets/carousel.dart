import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mywebapp/screens/details.dart';

class CarouselWidget extends StatefulWidget {
  final List<Map<String, dynamic>> events;
  CarouselWidget(this.events);
  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  double currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Column(
            children: [
              Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: CarouselSlider(
                  options: CarouselOptions(
                    // aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index.toDouble();
                      });
                    },
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 1000),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                  ),
                  items: widget.events.map((event) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 390,
                                width: MediaQuery.of(context).size.width / 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 330,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 100.0),
                                            child: Text(
                                              event['title'],
                                              softWrap: true,
                                              style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                      color: Colors.white),
                                                  fontSize: 64,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 100.0),
                                            child: RichText(
                                              text:
                                                  TextSpan(children: <TextSpan>[
                                                TextSpan(
                                                  text: event['date']
                                                      .substring(0, 2),
                                                  style:
                                                      GoogleFonts.sourceSansPro(
                                                          color: Colors.white,
                                                          fontSize: 45,),
                                                ),
                                                TextSpan(
                                                  text: event['date'].substring(
                                                      2, event['date'].length),
                                                  style:
                                                      GoogleFonts.sourceSansPro(
                                                          color:
                                                              Color(0xff602080),
                                                          fontSize: 45),
                                                ),
                                              ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 129.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            height: 47,
                                            child: FlatButton(
                                              color: Color.fromRGBO(
                                                  96, 32, 128, 1),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Text(
                                                'Register',
                                                style: GoogleFonts.almarai(
                                                    textStyle: TextStyle(
                                                        color: Colors.white),
                                                    fontSize: 25),
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                          SizedBox(
                                            width: 40,
                                          ),
                                          SizedBox(
                                            width: 150,
                                            height: 47,
                                            child: FlatButton(
                                              color: Color.fromRGBO(
                                                  96, 32, 128, 1),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Text(
                                                'Details',
                                                style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                        color: Colors.white),
                                                    fontSize: 24),
                                              ),
                                              onPressed: () {
                                                // Navigator.of(context).pushNamed(
                                                //   DetailPageScreen.routeName,
                                                //   arguments: DetailsOfEvent(widget.events[currentIndex.toInt()]),
                                                // );
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailPageScreen(
                                                    widget.events[
                                                        currentIndex.toInt()],
                                                  ),
                                                ));
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 390,
                                margin: EdgeInsets.only(
                                  bottom: 70,
                                  left: 30,
                                ),
                                child: Image.asset(
                                  event['imageUrl'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: DotsIndicator(
                  mainAxisSize: MainAxisSize.max,
                  dotsCount: widget.events.length,
                  position: currentIndex,
                  decorator: DotsDecorator(
                      color: Color.fromRGBO(121, 121, 121, 1), // Inactive color
                      activeColor: Color.fromRGBO(96, 32, 128, 1),
                      activeSize: Size.square(23),
                      size: Size.square(17),
                      spacing: EdgeInsets.symmetric(horizontal: 10)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
