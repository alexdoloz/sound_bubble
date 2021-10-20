import 'package:flutter/material.dart';
import 'package:sound_bubble/utils/palette.dart';
import 'package:sound_bubble/widgets/components/track_item.dart';
import 'package:sound_bubble/widgets/components/track_item_button.dart';

// TODO: Убрать
var labelStyle = TextStyle(
  color: Colors.white,
  fontSize: 54.0,
);

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.homePageBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            TrackItem(
              title: "Cadillac",
              subtitle: "MORGENSHTERN & Элджей",
              thumbnail: Image.network('https://via.placeholder.com/54x54'),
              actionTypes: const [TrackItemButtonType.add, TrackItemButtonType.more],
            ),
            const SizedBox(height: 15),
            TrackItem(
              title: "Cadillac",
              subtitle: "MORGENSHTERN & Элджей",
              thumbnail: Image.network('https://via.placeholder.com/54x54'),
              actionTypes: const [TrackItemButtonType.add, TrackItemButtonType.more],
            ),
            const SizedBox(height: 15),
            TrackItem(
              title: "Cadillac",
              subtitle: "MORGENSHTERN & Элджей",
              thumbnail: Image.network('https://via.placeholder.com/54x54'),
              actionTypes: const [TrackItemButtonType.add, TrackItemButtonType.more],
            ),
            const SizedBox(height: 15),
            TrackItem(
              title: "Cadillac",
              subtitle: "MORGENSHTERN & Элджей",
              thumbnail: Image.network('https://via.placeholder.com/54x54'),
              actionTypes: const [TrackItemButtonType.add, TrackItemButtonType.more],
            ),
            const SizedBox(height: 15),
            TrackItem(
              title: "Cadillac",
              subtitle: "MORGENSHTERN & Элджей",
              thumbnail: Image.network('https://via.placeholder.com/54x54'),
              actionTypes: const [TrackItemButtonType.add, TrackItemButtonType.more],
            ),
            const SizedBox(height: 15),
            TrackItem(
              title: "Cadillac",
              subtitle: "MORGENSHTERN & Элджей",
              thumbnail: Image.network('https://via.placeholder.com/54x54'),
              actionTypes: const [TrackItemButtonType.add, TrackItemButtonType.more],
            ),
            const SizedBox(height: 15),
            TrackItem(
              title: "Cadillac",
              subtitle: "MORGENSHTERN & Элджей",
              thumbnail: Image.network('https://via.placeholder.com/54x54'),
              actionTypes: const [TrackItemButtonType.delete, TrackItemButtonType.more],
            ),
            const SizedBox(height: 15),
            TrackItem(
              title: "Cadillac",
              subtitle: "MORGENSHTERN & Элджей",
              thumbnail: Image.network('https://via.placeholder.com/54x54'),
              actionTypes: const [TrackItemButtonType.add, TrackItemButtonType.more],
            ),
          ],
        ),
      )
    );
  }
}