import 'package:bonfire_adventures/common/constants/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DestinationCard extends StatefulWidget {
  const DestinationCard({Key key}) : super(key: key);

  @override
  _DestinationCardState createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> {
  @override
  Widget build(BuildContext context) {
    return Parent(
      style: kDestinationCardStyle,
      child: Column(children: [
        //Image from database
        Parent(
            child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15.h)),
              child: SizedBox(
                width: 250.h,
                height: 350.h,
                child: CachedNetworkImage(
                  fadeOutDuration: const Duration(milliseconds: 500),
                  fadeInDuration: const Duration(milliseconds: 500),
                  imageUrl:
                      'https://cdn.shortpixel.ai/client/q_glossy,ret_img/http://www.bonfireadventures.com/new/wp-content/uploads/2019/01/bonfire-maldives-400x260.jpg',
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0.h,
              child: Parent(
                style: ParentStyle()
                  ..height(150.h)
                  ..width(250.h)
                  ..borderRadius(bottomLeft: 15.h, bottomRight: 15.h)
                  ..linearGradient(
                    colors: [Colors.black87, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    stops: [0.35, 0.9],
                    end: Alignment.topCenter,
                  ),
              ),
            ),

            //Destination Name
            Positioned(
                bottom: 10.h,
                left: 20.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 240.h),
                      child: Txt(
                        'Nairobi National Park Daily Excursion gjoirjr irjotoir iortjoirt roitoirt',
                        style: TxtStyle()
                          ..textColor(Colors.white)
                          ..maxLines(2)
                          ..textOverflow(TextOverflow.ellipsis),
                      ),
                    ),
                    Txt('Ksh 1500', style: TxtStyle()..textColor(Colors.white)),
                  ],
                )),
          ],
        )),
      ]),
    );
  }
}
