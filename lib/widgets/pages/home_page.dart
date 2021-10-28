import 'package:flutter/material.dart';
import 'package:sound_bubble/widgets/components/track_item.dart';
import 'package:sound_bubble/widgets/components/track_item_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = List.generate(10, (index) => index).expand((index) => 
      [
        TrackItem(
          title: "Cadillac",
          subtitle: "MORGENSHTERN & Элджей",
          thumbnail: Image.network('https://picsum.photos/54'),
          actionTypes: const [TrackItemButtonType.add, TrackItemButtonType.more],
          order: "${index+1}",
        ),
        const SizedBox(height: 15),
      ]
    );
    
    return ListView(
      children: items.toList(),
    );
  }
}