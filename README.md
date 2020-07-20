# Tic tac toe terminal game!!

> We wrote our own version of one of the most iconic (and played) games in history: tic-tac-toe.

As this project is quite big, it required separate milestones with code reviews for each branch.

## Demo Link

[Live Demo Link](https://repl.it/@EliasCastaneda/tic-tac-toe).

## Built With

- Ruby!
- VsCode

## Getting Started

To get a local copy up and running follow these simple example steps:

- Clone this repository into your local machine.
- Run the main file by typing this in your command line:
```bash
  $ cd tic-tac-toe
  $ cd bin
  $ ruby main
```
  
## How to play

This is a 2 player game.  
Firstly, the program asks for each player's name and their preferred symbol which can be any keyboard character (we recommend letters or numbers).

Afterwards, the game begins presenting the tic-tac-toe board:
```
[1 2 3] 

[4 5 6]

[7 8 9]
```
Now players need to take turns to put their symbol into the 9 legal positions, 1 at a time.
A player symbol cannot overwrite the opposing player's symbol.  Each move should be on different positions.

The goal of the game is to fill the positions with a player's symbol 3 times in a row.  
The rows can be vertical, horizontal, and diagonal.

If no player can fill a row after all positions are filled, the game is considered a draw. 

For instance:
```
[X 2 3] 

[4 X 6]

[7 8 X]
```
Draw game example:
```
[o x o] 

[x x o]

[x o x]
```
### Validators

- Rubocop
- Stickler

## Authors

👤 **Elias Castañeda**

- Github: [@e71az](https://github.com/e71az)
- Linkedin: [@e71az](https://www.linkedin.com/in/e71az/)
- Twitter: [@e71az](https://twitter.com/e71az)

👤 **Miguel Tapia Escalera (Meltrust)**

- Linkedin: [@meltrust](https://www.linkedin.com/in/meltrust/)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc

## 📝 License

This project is [MIT](lic.url) licensed.

