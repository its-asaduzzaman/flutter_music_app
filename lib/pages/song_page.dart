import 'package:flutter/material.dart';
import 'package:flutter_music_app/components/neu_box.dart';
import 'package:flutter_music_app/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) => Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //app bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //back button
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                    ),

                    //title
                    const Text("P L A Y L I S T"),

                    //menu button
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.menu),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                //album artwork
                NeuBox(
                  child: Column(
                    children: [
                      //image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset("assets/images/album_artwork_1.png"),
                      ),

                      //song and artist name and icon
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //song and artist name
                            Column(
                              children: [
                                Text(
                                  "jaada",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text("asim zahir"),
                              ],
                            ),
                            //heart icon
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                //song duration progress

                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //start time
                          Text("0:00"),

                          //shuffle icon
                          Icon(Icons.shuffle),

                          //repeat icon
                          Icon(Icons.repeat),

                          //end time
                          Text("0:00"),
                        ],
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 0),
                      ),
                      child: Slider(
                        min: 0,
                        max: 100,
                        value: 50,
                        activeColor: Colors.redAccent,
                        onChanged: (value) {},
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    //skip previous
                    Expanded(
                      child: GestureDetector(
                        child: NeuBox(
                          child: Icon(Icons.skip_previous),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    //play pause
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        child: NeuBox(
                          child: Icon(Icons.play_arrow),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    //skip forward
                    Expanded(
                      child: GestureDetector(
                        child: NeuBox(
                          child: Icon(Icons.skip_next),
                        ),
                      ),
                    ),
                  ],
                ),
                //playback controller
              ],
            ),
          ),
        ),
      ),
    );
  }
}
