import 'package:flu_ebook/pages/me_page.dart';
import 'package:flu_ebook/pages/mikazuki_no_koukai_page.dart';
import 'package:flu_ebook/pages/sayuri_page.dart';
import 'package:flu_ebook/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color? selectedColor;
  Color? selectedBg;
  int? i;

  @override
  void initState() {
    super.initState();
    final theme = Provider.of<ThemeProvider>(context, listen: false).themeData;
    selectedColor = theme.colorScheme.primary;
    selectedBg = theme.colorScheme.primaryContainer;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final theme = Provider.of<ThemeProvider>(context).themeData;

    setState(() {
      if (i == 0) {
        selectedColor = theme.colorScheme.primary;
        selectedBg = theme.colorScheme.primaryContainer;
      } else if (i == 1) {
        selectedColor = theme.colorScheme.secondary;
        selectedBg = theme.colorScheme.secondaryContainer;
      } else if (i == 2) {
        selectedColor = theme.colorScheme.tertiary;
        selectedBg = theme.colorScheme.tertiaryContainer;
      }
    });
  }

  void changeColor(int i) {
    final theme = Provider.of<ThemeProvider>(context, listen: false).themeData;
    this.i = i;

    setState(() {
      if (i == 0) {
        selectedColor = theme.colorScheme.primary;
        selectedBg = theme.colorScheme.primaryContainer;
      } else if (i == 1) {
        selectedColor = theme.colorScheme.secondary;
        selectedBg = theme.colorScheme.secondaryContainer;
      } else if (i == 2) {
        selectedColor = theme.colorScheme.tertiary;
        selectedBg = theme.colorScheme.tertiaryContainer;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceDim,
        appBar: AppBar(
          title: const Text("さようなら さユり"),
          actions: [
            IconButton(
              onPressed: () => showSettingDialog(context),
              icon: const Icon(Icons.settings),
            ),
            IconButton(
              onPressed: () => showInfoDialog(context),
              icon: const Icon(Icons.info),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: selectedBg,
              ),
              child: TabBar(
                splashBorderRadius: BorderRadius.circular(10),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: selectedColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                labelColor: Provider.of<ThemeProvider>(context)
                    .themeData
                    .colorScheme
                    .surfaceContainer,
                unselectedLabelColor: Provider.of<ThemeProvider>(context)
                    .themeData
                    .colorScheme
                    .onSurface,
                tabs: const [
                  Tab(
                    text: "ミカヅキの航海",
                  ),
                  Tab(
                    text: "め",
                  ),
                  Tab(
                    text: "酸欠少女",
                  ),
                ],
                onTap: (value) => changeColor(value),
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            MikazukiNoKoukaiPage(),
            MePage(),
            SayuriPage(),
          ],
        ),
      ),
    );
  }
}

void showInfoDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("さユりのソース"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("關於酸欠少女さユり"),
            TextButton(
              onPressed: () => _launchInfoUrl(),
              child: const Text(
                "https://zh.wikipedia.org/zh-tw/Sayuri",
              ),
            ),
            const Text("ミカヅキの航海的專輯資訊與歌詞來源"),
            TextButton(
              onPressed: () => _launchAlbum1Url(),
              child: const Text(
                "https://www.kkbox.com/tw/tc/album/GsVAqT7jG1L3F8DQoq",
              ),
            ),
            const Text("め的專輯資訊與歌詞來源"),
            TextButton(
              onPressed: () => _launchAlbum2Url(),
              child: const Text(
                "https://www.kkbox.com/tw/tc/album/-nP0BRFINWEdah-qsC",
              ),
            ),
            const Text("酸欠少女的專輯資訊與歌詞來源"),
            TextButton(
              onPressed: () => _launchAlbum3Url(),
              child: const Text(
                "https://www.kkbox.com/tw/tc/album/PapOELIhDe7LVrVq2B",
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}

void showSettingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("調整模式"),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("深色模式"),
            Switch(
              value: Provider.of<ThemeProvider>(context).isDarkMode,
              onChanged: (i) =>
                  Provider.of<ThemeProvider>(context, listen: false)
                      .changeMode(),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}

final Uri _infoUrl = Uri.parse("https://zh.wikipedia.org/zh-tw/Sayuri");
final Uri _album1Url =
    Uri.parse("https://www.kkbox.com/tw/tc/album/GsVAqT7jG1L3F8DQoq");
final Uri _album2Url =
    Uri.parse("https://www.kkbox.com/tw/tc/album/-nP0BRFINWEdah-qsC");
final Uri _album3Url =
    Uri.parse("https://www.kkbox.com/tw/tc/album/PapOELIhDe7LVrVq2B");

Future<void> _launchInfoUrl() async {
  if (!await launchUrl(_infoUrl)) {
    throw Exception('Could not launch $_infoUrl');
  }
}

Future<void> _launchAlbum1Url() async {
  if (!await launchUrl(_album1Url)) {
    throw Exception('Could not launch $_album1Url');
  }
}

Future<void> _launchAlbum2Url() async {
  if (!await launchUrl(_album2Url)) {
    throw Exception('Could not launch $_album2Url');
  }
}

Future<void> _launchAlbum3Url() async {
  if (!await launchUrl(_album3Url)) {
    throw Exception('Could not launch $_album3Url');
  }
}
