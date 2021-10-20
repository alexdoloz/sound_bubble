import 'package:flutter/material.dart';
import 'package:sound_bubble/widgets/components/track_item_button.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? order;
  final String? duration;
  final Image thumbnail;
  final List<TrackItemButtonType> actionTypes;
  final Function(TrackItemButtonType)? onActionButtonPressed;

  const TrackItem({ 
    Key? key,
    required this.title,
    this.subtitle,
    this.order,
    this.duration,
    required this.thumbnail,
    this.actionTypes = const [],
    this.onActionButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.roboto(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.white,
    );
    final subtitleStyle = GoogleFonts.roboto(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      color: Color(0xffcbcbcb),
    );
    return SizedBox(
      height: 54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          if (order != null)
            ...[Text(order!), const SizedBox(width: 10,)],
          SizedBox(
            width: 54,
            height: 54,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              clipBehavior: Clip.hardEdge,
              child: thumbnail,
            ),
          ),
          SizedBox(width: 13,),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: titleStyle, overflow: TextOverflow.ellipsis,),
                if (subtitle != null)
                  Text(subtitle!, style: subtitleStyle, overflow: TextOverflow.ellipsis,),
              ],
            ),
          ),
          const SizedBox(width: 8,),
          ...(actionTypes.expand((type) => [
            TrackItemButton(
              type: type, 
              onPressed: () {
                print(type);
              }
            ),
          ])),
        ],
      ),
    );
  }
}