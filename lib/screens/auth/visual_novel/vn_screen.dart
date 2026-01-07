import 'package:flutter/material.dart';
import '/models/vn_scene.dart';
import 'vn_story_data.dart';

class VNScreen extends StatefulWidget {
  const VNScreen({super.key});

  @override
  State<VNScreen> createState() => _VNScreenState();
}

class _VNScreenState extends State<VNScreen> {
  String _currentSceneId = 'start';
  bool _showDialog = true;

  VNScene get currentScene => VNStoryData.getScene(_currentSceneId);

  void _nextScene({String? sceneId}) {
    setState(() {
      if (sceneId != null) {
        _currentSceneId = sceneId;
      } else if (currentScene.nextSceneId != null) {
        _currentSceneId = currentScene.nextSceneId!;
      }
      _showDialog = true;
    });

    // Check if game ended
    if (currentScene.id == 'end') {
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          Navigator.of(context).pop();
        }
      });
    }
  }

  String _getBackgroundImage(String background) {
    // TEMPORARY: Background Supabase
    switch (background) {
      case 'room_night':
        return 'https://ncrlhdsupoonggxbtupz.supabase.co/storage/v1/object/public/vn-assets/backgrounds/room_night.png';
      case 'room_morning':
        return 'https://ncrlhdsupoonggxbtupz.supabase.co/storage/v1/object/public/vn-assets/backgrounds/room_morning.png';
      case 'game_screen':
        return 'https://ncrlhdsupoonggxbtupz.supabase.co/storage/v1/object/public/vn-assets/backgrounds/game_screen.png';
      case 'computer_screen':
        return 'https://ncrlhdsupoonggxbtupz.supabase.co/storage/v1/object/public/vn-assets/backgrounds/computer_screen.png';
      case 'static_screen':
        return 'https://ncrlhdsupoonggxbtupz.supabase.co/storage/v1/object/public/vn-assets/backgrounds/static_screen.png';
      case 'black_screen':
        return 'https://ncrlhdsupoonggxbtupz.supabase.co/storage/v1/object/public/vn-assets/backgrounds/black_screen.png';
      default:
        return 'https://ncrlhdsupoonggxbtupz.supabase.co/storage/v1/object/public/vn-assets/backgrounds/room_night.png';
    }
  }

  Widget _buildBackground() {
    final imageUrl = _getBackgroundImage(currentScene.background);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.4),
            BlendMode.darken,
          ),
        ),
      ),
    );
  }

  Widget _buildDialogBox() {
    if (!_showDialog) return const SizedBox.shrink();

    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.85),
          border: Border(
            top: BorderSide(
              color: Colors.deepPurple.withValues(alpha: 0.5),
              width: 2,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Character Sprite
            if (currentScene.characterSprite != null)
              Positioned(
                bottom: 0,
                right: 50,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: 1.0,
                  child: Image.network(
                    currentScene.characterSprite!,
                    height: MediaQuery.of(context).size.height * 0.7,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stack) {
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ),

            if (currentScene.characterName != null) ...[
              Text(
                currentScene.characterName!,
                style: const TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
            ],
            Text(
              currentScene.dialog,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            if (!currentScene.hasChoices)
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () => _nextScene(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Next'),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 18),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildChoices() {
    if (!currentScene.hasChoices) return const SizedBox.shrink();

    return Positioned(
      left: 20,
      right: 20,
      bottom: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: currentScene.choices!.map((choice) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ElevatedButton(
              onPressed: () => _nextScene(sceneId: choice.nextSceneId),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.deepPurple.withValues(alpha: 0.9),
                minimumSize: const Size(double.infinity, 60),
              ),
              child: Text(
                choice.text,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          if (!currentScene.hasChoices && currentScene.nextSceneId != null) {
            _nextScene();
          }
        },
        child: Stack(
          children: [
            // Background
            _buildBackground(),

            // Center content
            if (currentScene.id == 'end')
              const Center(
                child: Text(
                  'THE END',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            // Dialog box or Choices
            if (currentScene.hasChoices) _buildChoices() else _buildDialogBox(),

            // Back button
            Positioned(
              top: 40,
              left: 16,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Exit Story?'),
                      content: const Text('Progress will not be saved.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text('Exit'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
