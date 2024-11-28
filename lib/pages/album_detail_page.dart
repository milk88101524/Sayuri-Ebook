import 'package:flu_ebook/data/album_model.dart';
import 'package:flutter/material.dart';

class AlbumDetailPage extends StatelessWidget {
  final AlbumModel albumModel;
  final Color color;
  const AlbumDetailPage({
    super.key,
    required this.albumModel,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      right: 10,
                      left: 10,
                    ),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20),
                                  Text(albumModel.artist),
                                  Text(albumModel.issueDate),
                                ],
                              ),
                            ),
                            Image.asset(
                              albumModel.img,
                              height: 200,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card.filled(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        albumModel.albumName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "歌詞",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(albumModel.lyrics),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ));
  }
}
