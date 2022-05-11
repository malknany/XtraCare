// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class slide extends StatefulWidget {
  final String img;
  final String namedoc;
  final String txt1;
  const slide(
      {Key? key, required this.img, required this.namedoc, required this.txt1})
      : super(key: key);

  @override
  State<slide> createState() => _slideState();
}

class _slideState extends State<slide> {
  bool islike = false;
  int likeCount = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black26,
            width: 2.5,
          ),
          image: DecorationImage(
            alignment: Alignment.topRight,
            image: AssetImage(widget.img),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 240,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.namedoc,
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.txt1,
                  ),
                  Container(
                    //padding: EdgeInsets.only(right: 0, top: 10),
                    child: LikeButton(
                      size: 40,
                      isLiked: islike,
                      likeCount: likeCount,
                      bubblesColor: BubblesColor(
                          dotPrimaryColor: Colors.green,
                          dotSecondaryColor: Colors.amber),
                      circleColor: CircleColor(
                          start: Color.fromARGB(205, 84, 201, 84),
                          end: Color.fromARGB(205, 84, 201, 84)),
                      likeBuilder: (islike) {
                        final color = islike
                            ? Color.fromARGB(205, 84, 201, 84)
                            : Colors.grey;
                        return Icon(
                          Icons.favorite,
                          color: color,
                          size: 40,
                        );
                      },
                      countBuilder: (count, islike, text) {
                        final color = islike ? Colors.black : Colors.grey;
                        return Text(
                          text,
                          style: TextStyle(
                            color: color,
                            fontSize: 23,
                          ),
                        );
                      },
                      onTap: (islike) async {
                        this.islike = !islike;
                        likeCount += this.islike ? 1 : -1;
                        return !islike;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
