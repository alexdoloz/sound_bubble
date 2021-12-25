import 'package:flutter/material.dart';
import 'package:sound_bubble/models/track_queue.dart';
import 'package:sound_bubble/utils/widgets+intersperse.dart';

class TrackQueueCarousel extends StatelessWidget {
  final List<TrackQueue> trackQueues;
  const TrackQueueCarousel({ 
    Key? key,
    this.trackQueues = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = trackQueues.map((tq) => TrackQueueItem(trackQueue: tq)).toList(); 
    return SizedBox(
      height: 170,
      child: ListView(

        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [NewPlaylistItem(onTap: () { print("New playlist"); }), const SizedBox(width: 8,)] + items.interspersedWith(const SizedBox(width: 8,)),
      ),
    );
  }
}

class TrackQueueItem extends StatelessWidget {
  final TrackQueue trackQueue;
  const TrackQueueItem({ 
    Key? key,
    required this.trackQueue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
            ),
            child: Image.network(trackQueue.coverURL!, width: 130, height: 130),
          ),
          Text(trackQueue.title),
          Text('${trackQueue.creationDate?.year}'), // TODO: Handle null
        ],
      ),
    );
  }
}

class NewPlaylistItem extends StatelessWidget {
  final VoidCallback onTap;
  const NewPlaylistItem({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        constraints: const BoxConstraints.tightFor(width: 130, height: 130),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff212121),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xff000000),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            SizedBox(height: 8,),
            Text("Add playlist", style: Theme.of(context).textTheme.headline5),
          ],
        ),
      ),
    );
  }
}