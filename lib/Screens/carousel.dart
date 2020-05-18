import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyCarousel extends StatefulWidget {
  final String title;
  final List<dynamic> images;

  const MyCarousel({Key key, this.title, this.images}) : super(key: key);

  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(widget.title),
          leading: IconButton(
            onPressed: () => {
              Navigator.pop(context),
            }, 
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: CarouselSlider(
            items: widget.images.map((e) => Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Image.network(
                  e, 
                  fit: BoxFit.fill,
                ),
              ),
            )).toList(),
            options: CarouselOptions(
              autoPlay: true,
              height: MediaQuery.of(context).size.height*0.95,
            )
          ),
        ),
      )
    );
  }
}