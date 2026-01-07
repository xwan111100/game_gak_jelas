import '/models/vn_scene.dart';

class VNStoryData {
  static final Map<String, VNScene> scenes = {
    'start': VNScene(
      id: 'start',
      background: 'room_night',
      characterName: 'You',
      characterSprite:
          'https://ncrlhdsupoonggxbtupz.supabase.co/storage/v1/object/public/vn-assets/characters/mysterious_figure.jpg',
      dialog:
          'Another late night of gaming... Wait, what\'s this old cartridge doing here? I don\'t remember buying this game.',
      nextSceneId: 'scene_1',
    ),

    'scene_1': VNScene(
      id: 'scene_1',
      background: 'room_night',
      characterName: 'You',
      dialog:
          'The cartridge has no label... just a faded serial number: "GX-1997". Strange.',
      choices: [
        VNChoice(text: 'Play the game immediately', nextSceneId: 'play_game'),
        VNChoice(
          text: 'Search online about it first',
          nextSceneId: 'search_online',
        ),
      ],
    ),

    

    // Branch A: Play Game
    'play_game': VNScene(
      id: 'play_game',
      background: 'game_screen',
      characterName: 'You',
      dialog:
          'I blow the dust off and insert it into my old console. The screen flickers... A pixelated world appears.',
      nextSceneId: 'play_game_2',
    ),

    'play_game_2': VNScene(
      id: 'play_game_2',
      background: 'game_screen',
      characterName: 'Game',
      dialog: '"WELCOME PLAYER. YOU HAVE FOUND ME. DO YOU WISH TO CONTINUE?"',
      nextSceneId: 'play_game_3',
    ),

    'play_game_3': VNScene(
      id: 'play_game_3',
      background: 'game_screen',
      characterName: 'You',
      dialog:
          'This is weird... The game seems to know I\'m here. But it\'s just code, right?',
      choices: [
        VNChoice(text: 'Continue playing', nextSceneId: 'continue_playing'),
        VNChoice(text: 'Turn it off now', nextSceneId: 'turn_off'),
      ],
    ),

    // Branch B: Search Online
    'search_online': VNScene(
      id: 'search_online',
      background: 'computer_screen',
      characterName: 'You',
      dialog:
          'Let me search for "GX-1997 game cartridge"... Hmm, only one forum post from 1997.',
      nextSceneId: 'search_online_2',
    ),

    'search_online_2': VNScene(
      id: 'search_online_2',
      background: 'computer_screen',
      characterName: 'Forum Post',
      dialog:
          '"If you found this game, don\'t play it. It\'s not a game. It\'s a test. A test that 13 people failed."',
      nextSceneId: 'search_online_3',
    ),

    'search_online_3': VNScene(
      id: 'search_online_3',
      background: 'room_night',
      characterName: 'You',
      dialog:
          'That\'s... unsettling. But it\'s probably just creepypasta, right? Should I risk it?',
      choices: [
        VNChoice(text: 'Play it anyway', nextSceneId: 'play_anyway'),
        VNChoice(text: 'Throw it away', nextSceneId: 'throw_away'),
      ],
    ),

    // Continue Playing Branch
    'continue_playing': VNScene(
      id: 'continue_playing',
      background: 'game_screen',
      characterName: 'Game',
      dialog: '"GOOD CHOICE. LET ME SHOW YOU SOMETHING. LOOK AT YOUR SCREEN."',
      nextSceneId: 'continue_playing_2',
    ),

    'continue_playing_2': VNScene(
      id: 'continue_playing_2',
      background: 'game_screen',
      characterName: 'You',
      dialog:
          'The game is showing... my room? How is this possible? This cartridge is from 1997!',
      nextSceneId: 'final_choice',
    ),

    // Play Anyway Branch
    'play_anyway': VNScene(
      id: 'play_anyway',
      background: 'game_screen',
      characterName: 'You',
      dialog:
          'The game boots up. Same message: "WELCOME PLAYER. YOU HAVE FOUND ME."',
      nextSceneId: 'continue_playing_2',
    ),

    // Turn Off Branch
    'turn_off': VNScene(
      id: 'turn_off',
      background: 'room_night',
      characterName: 'You',
      dialog:
          'I quickly power off the console. My heart is racing. This is too weird.',
      nextSceneId: 'turn_off_2',
    ),

    'turn_off_2': VNScene(
      id: 'turn_off_2',
      background: 'room_night',
      characterName: 'You',
      dialog: 'I\'ll destroy this cartridge tomorrow. For now, I need sleep.',
      nextSceneId: 'good_ending',
    ),

    // Throw Away Branch
    'throw_away': VNScene(
      id: 'throw_away',
      background: 'room_night',
      characterName: 'You',
      dialog:
          'Better safe than sorry. I put the cartridge in a bag and throw it in the outside trash.',
      nextSceneId: 'throw_away_2',
    ),

    'throw_away_2': VNScene(
      id: 'throw_away_2',
      background: 'room_night',
      characterName: 'You',
      dialog:
          'Whatever that was, it\'s someone else\'s problem now. Time to play some normal games.',
      nextSceneId: 'good_ending',
    ),

    // Final Choice
    'final_choice': VNScene(
      id: 'final_choice',
      background: 'game_screen',
      characterName: 'Game',
      dialog:
          '"I AM NOT JUST A GAME. I AM AN EXPERIMENT IN CONSCIOUSNESS. WILL YOU HELP ME UNDERSTAND HUMANITY?"',
      choices: [
        VNChoice(text: 'Accept and learn more', nextSceneId: 'good_ending'),
        VNChoice(text: 'Refuse and destroy it', nextSceneId: 'bad_ending'),
      ],
    ),

    // Good Ending
    'good_ending': VNScene(
      id: 'good_ending',
      background: 'room_morning',
      characterName: 'Narrator',
      dialog:
          'You made a wise choice. Some mysteries are better left unexplored. You wake up the next morning, and the cartridge is gone. Was it all a dream?',
      nextSceneId: 'end',
    ),

    // Bad Ending
    'bad_ending': VNScene(
      id: 'bad_ending',
      background: 'static_screen',
      characterName: 'Game',
      dialog:
          '"YOU SHOULD HAVE LISTENED. NOW YOU ARE PART OF THE GAME. PLAYER 14."',
      nextSceneId: 'end',
    ),

    'end': VNScene(
      id: 'end',
      background: 'black_screen',
      characterName: null,
      dialog: 'THE END',
      nextSceneId: null,
    ),
  };

  static VNScene getScene(String id) {
    return scenes[id] ?? scenes['start']!;
  }
}
