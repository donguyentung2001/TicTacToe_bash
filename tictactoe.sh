#!/bin/bash 
#!/bin/bash
function gameOver() {
   arr=("$@")
   for i in 0 3 6
      do
          if [ "${arr[i]}" = 'O' -a "${arr[i+1]}" = 'O' -a "${arr[i+2]}" = 'O' ] 
          then
            winner=1
          elif [ "${arr[i]}" = 'X' -a "${arr[i+1]}" = 'X' -a "${arr[i+2]}" = 'X' ] 
          then
            winner=2
          fi
      done
    for i in 0 1 2
      do
          if [ "${arr[0]}" = 'O' -a "${arr[i+3]}" = 'O' -a "${arr[i+6]}" = 'O' ] 
          then
            winner=1
          elif [ "${arr[0]}" = 'X' -a "${arr[i+3]}" = 'X' -a "${arr[i+6]}" = 'X' ] 
          then
            winner=2
          fi
      done
    if [ "${arr[0]}" = 'O' -a "${arr[4]}" = 'O' -a "${arr[8]}" = 'O' ]
    then
        winner=1
    elif [ "${arr[0]}" = 'X' -a "${arr[4]}" = 'X' -a "${arr[8]}" = 'X' ] 
    then
        winner=2
    fi 
    if [ "${arr[2]}" = 'O' -a "${arr[4]}" = 'O' -a "${arr[6]}" = 'O' ] 
    then
        winner=1
    elif [ "${arr[2]}" = 'X' -a "${arr[4]}" = 'X' -a "${arr[6]}" = 'X' ] 
    then
        winner=2
    fi  
    if ((winner==0))
    then 
    if [ "${arr[0]}" != ' ' -a "${arr[1]}" != ' ' -a "${arr[2]}" != ' ' -a "${arr[3]}" != ' ' -a "${arr[4]}" != ' ' -a "${arr[5]}" != ' ' -a "${arr[6]}" != ' ' -a "${arr[7]}" != ' ' -a "${arr[8]}" != ' ' ]
    then 
        winner=3
    fi
    fi
}

function drawBoard() { 
    arr=("$@")
    echo "-------" 
    echo "|${arr[0]}|${arr[1]}|${arr[2]}|"
    echo "-------" 
    echo "|${arr[3]}|${arr[4]}|${arr[5]}|"
    echo "-------" 
    echo "|${arr[6]}|${arr[7]}|${arr[8]}|"
    echo "-------" 
}
declare -a board=()
for (( i=0; i < 9; i++ ))
do 
board+=(" ")
done 


winner=0
turn=1

echo "Welcome to a Tic-Tac-Toe game on the command line."
drawBoard "${board[@]}"
while ((winner==0))
do 
    if ((turn==1)) 
    then 
        valid=0
        while ((valid==0))
        do
            echo "First player's turn, please enter the X coordinate of your next move (between 0 and 2):"
            read x
            echo "Now enter the Y coordinate of your next move (between 0 and 2):"
            read y
            idx=$(($x*3+$y))
            echo ${board[idx]}
            if [ "${board[idx]}" = " " ]
            then
                board[$idx]="O"
                valid=1 
            else 
                echo "Invalid move. Try again"
            fi 
        done
        turn=2
    elif ((turn==2)) 
    then 
        valid=0
        while ((valid==0))
        do
            echo "Second player's turn, please enter the X coordinate of your next move (between 0 and 2):"
            read x
            echo "Now enter the Y coordinate of your next move (between 0 and 2):"
            read y
            idx=$(($x*3+$y))
            if [ "${board[idx]}" = " " ]
            then
                board[$idx]="X"
                valid=1 
            else 
                echo "Invalid move. Try again"
            fi 
        done
        turn=1
    fi 
    gameOver "${board[@]}"
    drawBoard "${board[@]}"
done 

if ((winner==1))
then 
    echo "Game over. First player wins!" 
elif ((winner==2)) 
then 
    echo "Game over. Second player wins!"
elif ((winner==3))
then 
    echo "The game ends in a draw!"
fi

