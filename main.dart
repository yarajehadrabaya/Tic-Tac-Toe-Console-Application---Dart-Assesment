import 'dart:io';
import 'dart:math';//FOR RANDOM FUNCTION in Bonus Task
List<String> square=['1','2','3','4','5','6','7','8','9'];
List<String> matchToWin= ['012','048','036','147','246','258','345','678'];

int square_count=0;
bool x_player=true;
bool winner=false;

/* /*Bonus Task is here O_o"Implement a simple AI opponent to play against the human player.", but i dont use it
if we need to make AI mode in this game we can make this change :*/

import 'dart:io';
import 'dart:math';//FOR RANDOM FUNCTION in Bonus Task
List<String> square=['1','2','3','4','5','6','7','8','9'];
List<String> matchToWin= ['012','048','036','147','246','258','345','678'];

int square_count=0;
bool x_player=true;
bool winner=false;
void main(){
//This stage asks the user to specify his marker and other mark for AI, and this step is related to the Bonus Task.
  print('Choose your marker (X or O): ');
  //1-take the marker from user taking into account the possible cases of his entering lowercase or uppercase letters.
  String user_marker = stdin.readLineSync()!.toUpperCase();
  if (user_marker == 'X') {
    x_player = true;
  } else if (user_marker == 'O') {
    x_player = false;
  }
  Game_Board();
  get_symbol();
}


int ai_opponent() {
  List<int> available_moves = [];
  for (int i = 0; i < square.length; i++) {
    if (square[i] != 'X' && square[i] != 'O') {
      available_moves.add(i);
    }
  }
  //generates random moves for the AI player during the game.
  return available_moves.isEmpty ? -1 : available_moves[Random().nextInt(available_moves.length)];
}


void get_symbol() {
//The get_symbol function has been modified to switch between the human player turn and the AI  turn accordingly.
  if (square_count == 9) {
    print('Draw O_o ... ');
    restartGame();
  } else if (x_player) {
    print("Your move (1-9): ");
    int num = int.parse(stdin.readLineSync()!);
    while (!validate_move(num)) {
      print("Choose a different number (1-9): ");
      num = int.parse(stdin.readLineSync()!);
    }
    square[num - 1] = 'X';
    x_player = false;
    square_count++;
  } else {
    int move = aiMove();
    if (move != -1) {
      square[move] = 'O';
      x_player = true;
      square_count++;
    }
  }
  Game_Board();
  check_winner('X');
  check_winner('O');
  if (winner == false) get_symbol();
  bool is_matching(String matching, String check) {
    // Existing is_matching function remains the same...
  }

  void check_winner(player) {
    // Existing check_winner function remains the same...
  }

  bool validate_move(int num) {
    // Existing validate_move function remains the same...
  }

  void restartGame() {
    // Existing restartGame function remains the same...
  }

}*/

/*-----------------------------------------Standard task without bonus-------------------------------------------------*/


void main(){
  Game_Board();
  get_symbol();
}


bool is_matching(String matching , String check){
/*1-To make each item in the matchToWin list separate from the other '012'=> '0' '1' '2' then change data type for each one to int using map then make it as list again and save them in "num list".*/
List<int> num = matching.split('').map((item){return int.parse(item);} ).toList();

//2-To check if a player was able to meet the winning conditions.
bool match = false;
for(final item in num ){
  if (square[item] == check ){
     match = true;
  }
  else {
    match = false;
    break;
  }
}
return match;
}



void check_winner(player){// check if some one winner.
  for(final item in matchToWin){
    bool matching_validity = is_matching(item,player);
    if(matching_validity == true){
      print('Congratulations to player $player, you won... ');
      winner = true ;
      restartGame(); // Ask for restart after some one won
      break;
    }//CLOSE IF
    
  }//CLOSE FOR
  
}//CLOSE THE FUNCTION




bool validate_move(int num) {
  // Check if the input is within the range of 1-9
  if (num < 1 || num > 9) {
    print('Invalid input,Enter a number between 1 and 9.');
    return false;
  }

  // Check if the selected square is empty
  if (square[num - 1] == 'X' || square[num - 1] == 'O') {
    print('The selected square is already taken. Choose an empty square.');
    return false;
  }

  return true;
}




void restartGame() {// Ask for restart game agin
  print('Do you want to play again? (please enter : yes/no)');
  /*1-Receiving the decision from the user and taking into account the possible cases of his entering lowercase or uppercase letters.*/
  String playAgainInput = stdin.readLineSync()!.toLowerCase(); 
  if (playAgainInput == 'yes') { //restart game agin
    square = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
    square_count = 0;
    x_player = true;
    winner = false;
    Game_Board();
    get_symbol();
  } else {//thx message  for users.
    print('Thanks for playing!Goodbye!');
  }
}







void get_symbol() {
  
  // Get the number of the square from the user
  print("Choose a number for ${x_player == true ? 'X-player:' : 'O-player:'}");
  int num = int.parse(stdin.readLineSync()!);

  // Validate the user input if is empty & within the range
  while (!validate_move(num)) {
    print("Choose a different number for ${x_player == true ? 'X-player:' : 'O-player:'}");
    num = int.parse(stdin.readLineSync()!);
  }

  square[num - 1] = x_player ? 'X' : 'O';
  x_player = !x_player;
  square_count++;

  if (square_count == 9) {
    print('Draw O_o ... ');
    restartGame(); // Ask for restart after a draw
  } 
  else {
    Game_Board();
  }
  check_winner('X');
  check_winner('O');

  if (winner == false) get_symbol();
}



void Game_Board(){
  //To draw a grid for the XO game.
  print('  |   |   ');
  print('${square[0]} | ${square[1]} | ${square[2]} ');
  print('__|___|___');
  print('  |   |  ');
  print('${square[3]} | ${square[4]} | ${square[5]} ');
  print('__|___|___');
  print('  |   |   ');
  print('${square[6]} | ${square[7]} | ${square[8]} ');

}