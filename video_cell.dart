import 'package:flutter/material.dart';

class VideoCell extends StatelessWidget {
  final video_to_disp;

  VideoCell(this.video_to_disp);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Image.network(video_to_disp['imageUrl']),
            Container(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                video_to_disp['name'],
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                Icon(
                  Icons.thumb_down,
                ),
                Icon(
                  Icons.thumb_up,
                ),
                Icon(Icons.download),
                Icon(Icons.save_as)
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
