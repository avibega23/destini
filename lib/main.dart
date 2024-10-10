import 'package:destini/story_brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Destini());

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  
                  child: Text(
                    textAlign: TextAlign.center,
                    storyBrain.getStory(),
                    style: const TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: 80,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(1);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                      storyBrain.getChoice1(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: SizedBox(
                    height: 80,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          storyBrain.nextStory(2);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                        storyBrain.getChoice2(),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
