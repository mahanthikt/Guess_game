;; Odd or Even Guessing Game in Clarity

;; Store Player 1's chosen number (uint)
(define-data-var player1-number uint u0)

;; Store Player 1's address (principal)
(define-data-var player1-address principal 'SP000000000000000000002Q6VF78)

;; Store if the game has started
(define-data-var game-started bool false)

;; Store if the game is finished
(define-data-var game-finished bool false)

;; Player 1 starts the game by choosing a number between 1 and 10
(define-public (start-game (number uint))
  (if (or (< number u1) (> number u10))
      (err u100) ;; invalid number
      (if (var-get game-started)
          (err u101) ;; game already started
          (begin
            (var-set player1-number number)
            (var-set player1-address tx-sender)
            (var-set game-started true)
            (ok "Game started, waiting for Player 2")
          )
      )
  )
)

;; Player 2 guesses whether Player 1's number is even (true) or odd (false)
(define-public (guess (is-even bool))
  (if (not (var-get game-started))
      (err u102) ;; game not started
      (if (var-get game-finished)
          (err u103) ;; game already finished
          (if (is-eq tx-sender (var-get player1-address))
              (err u104) ;; Player 1 cannot guess
              (let ((number (var-get player1-number)))
                (var-set game-finished true)
                (let ((actual-even (is-eq (mod number u2) u0)))
                  (if (is-eq actual-even is-even)
                      (ok "Correct guess! Player 2 wins!")
                      (ok "Wrong guess! Player 1 wins!")
                  )
                )
              )
          )
      )
  )
)


;; Player 1 can reset the game for a new round
(define-public (reset)
  (if (not (is-eq tx-sender (var-get player1-address)))
      (err u105) ;; Only Player 1 can reset
      (begin
        (var-set player1-number u0)
        (var-set player1-address 'SP000000000000000000002Q6VF78)
        (var-set game-started false)
        (var-set game-finished false)
        (ok "Game reset successfully")
      )
  )
)
