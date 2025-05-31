# 🎲 Even or Odd: On-Chain Guessing Game (Clarity + Clarinet)

## 📜 Project Description  
This project is a decentralized, on-chain implementation of a simple **Even or Odd** number guessing game. It is built entirely using the **Clarity** smart contract language and tested with **Clarinet** on the **Stacks blockchain**.

The contract allows:
- **Player 1** to start the game by locking in a number.
- **Player 2** to guess whether that number is **even** (`true`) or **odd** (`false`).
- The smart contract validates the guess and declares the winner — all on-chain, without any centralized server or frontend interface.

---

## 🔭 Project Vision  

This project demonstrates how even the simplest games can be made **transparent**, **trustless**, and **secure** using Clarity smart contracts. It serves as a beginner-friendly example for on-chain interactions and decision-making logic.

---

## ⭐ Key Features

✅ **Game Initialization:**  
Player 1 can start a game by submitting a number (between any valid unsigned integers).  

🎯 **One Game at a Time:**  
Prevents overlapping games; a new game can’t start until the current one ends.  

👥 **Second Player Guessing:**  
Player 2 guesses the parity (`true` for even, `false` for odd) of the locked-in number.  

🧠 **Automatic Evaluation:**  
The contract checks the actual parity and declares if the guess is correct.  

🔐 **On-Chain State Management:**  
All game data is stored on-chain — no off-chain logic required.  

🚫 **Prevents Replays:**  
Once the game finishes, further guesses are blocked until reset.

---

## 📂 Smart Contract Functionality

| Function          | Description                                  |
|-------------------|----------------------------------------------|
| `start-game`      | Starts a new game with a secret number       |
| `guess`           | Player 2 guesses if number is even or odd    |
| `reset-game`      | Resets the game state (optional, admin use)  |
| `game-started`    | Boolean var: is game in progress?            |
| `game-finished`   | Boolean var: has the game ended?             |
| `player1-number`  | Stores Player 1’s number                     |
| `player1-address` | Stores who initiated the game                |

---

## 🛠 How It Works

1. **Player 1 starts the game:**
   ```clojure
   (start-game u7)
   ```

2. **Player 2 makes a guess (even/odd):**
   ```clojure
   (guess false) ;; Guessing it's odd
   ```

3. **Contract checks parity and declares result:**
   - If guess is correct → "Correct guess! Player 2 wins!"
   - Else → "Wrong guess! Player 1 wins!"

---

## 🧪 Testing With Clarinet

This project uses [Clarinet](https://github.com/hirosystems/clarinet) for local development and testing.

### Sample Tests

```clojure
;; Start game with number 8 (even)
(start-game u8)

;; Guess it's even
(guess true) ;; ✅ "Correct guess! Player 2 wins!"

;; Try guessing again
(guess false) ;; ❌ err u103 (Game already finished)
```

### How to Run Tests

```bash
clarinet test
```

> Make sure Clarinet is installed and configured before running the tests.

---

## 🚀 Future Scope

- 🧱 Add STX betting logic for higher stakes.
- 🔒 Use number commitment schemes (e.g., hash commitment) for fairness.
- 📈 Leaderboard: Track wins/losses per address.
- 🧪 Improve test coverage and add edge-case testing.
- 🧩 Expand game logic (e.g., Rock-Paper-Scissors, Dice Rolls).

---

## 📎 Tech Stack

- 💎 **Stacks Blockchain**
- 📘 **Clarity Smart Contracts**
- 🧪 **Clarinet** (for local development & testing)

---

## 🙌 Contributions

Open to suggestions, enhancements, or forks for similar Clarity mini-games!

