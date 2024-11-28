import 'package:flu_ebook/componets/album_card.dart';
import 'package:flu_ebook/data/album_data.dart';
import 'package:flu_ebook/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MePage extends StatelessWidget {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: GridView.builder(
          itemCount: AlbumData().meNoList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, int index) {
            return AlbumCard(
              albumModel: AlbumData().meNoList[index],
              bg: Provider.of<ThemeProvider>(context)
                  .themeData
                  .colorScheme
                  .secondaryContainer,
            );
          },
        ),
      ),
    );
  }
}
