#!/usr/bin/env bash
# File: guessinggame.sh

# Return the number of files in the current directory
function count_files {
  ls -1 | wc -l
}

# Ask the user for a guess until it is a whole number
function read_guess {
  local answer
  read -p "Your guess: " answer
  while ! [[ $answer =~ ^[0-9]+$ ]]
  do
    read -p "Please enter a whole number: " answer
  done
  echo $answer
}

actual=$(count_files)

echo "Welcome to the Guessing Game!"
echo "How many files are in the current directory?"

guess=$(read_guess)

while [[ $guess -ne $actual ]]
do
  if [[ $guess -lt $actual ]]
  then
    echo "Your guess is too low. Try again."
  else
    echo "Your guess is too high. Try again."
  fi
  guess=$(read_guess)
done

echo "Congratulations! You guessed right: there are $actual files."
