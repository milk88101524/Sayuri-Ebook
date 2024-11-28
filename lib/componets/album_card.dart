import 'package:flu_ebook/data/album_model.dart';
import 'package:flu_ebook/pages/album_detail_page.dart';
import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  final AlbumModel albumModel;
  final Color bg;
  const AlbumCard({super.key, required this.albumModel, required this.bg});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bg,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AlbumDetailPage(
              albumModel: albumModel,
              color: bg,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  albumModel.img,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  albumModel.albumName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Text(albumModel.artist),
            ],
          ),
        ),
      ),
    );
  }
}
