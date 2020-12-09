#!/bin/bash
rand=$(($RANDOM % 33))
case $rand in
    0)
        echo "ALT+B – Move one character before the cursor."
        ;;
    1)
        echo "ALT+C – Suspends the running command/procesSame as CTRL+C"
        ;;
    2)
        echo "ALT+F – Move at the end of the next word"
        ;;
    3)
        echo "ALT+T – Swaps the last two words."
        ;;
    4)
        echo "ALT+U – Capitalize all characters in a word after the cursor."
        ;;
    5)
        echo "ALT+L – Uncaptalize all characters in a word after the cursor."
        ;;
    6)
        echo "ALT+R – Deletes everything"
        ;;
    7)
        echo "ALT+. – Use the last word of the previous command."
        ;;
    8)
        echo "CTRL+A – Quickly move to the beginning of line."
        ;;
    9)
        echo "CTRL+B – To move backward one character."
        ;;
    10)
        echo "CTRL+C – Stop the currently running command."
        ;;
    11)
        echo "CTRL+D – Delete one character backward."
        ;;
    12)
        echo "CTRL+E – Move to the end of line."
        ;;
    13)
        echo "CTRL+F – Move forward one character."
        ;;
    14)
        echo "CTRL+G – Leave the history searching mode without running the command."
        ;;
    15)
        echo "ALT+C – Suspends the running command/procesSame as CTRL+C"
        ;;
    16)
        echo "CTRL+J – Same as ENTER/RETURN key."
        ;;
    17)
        echo "CTRL+K – Delete all characters after the cursor."
        ;;
    18)
        echo "CTRL+L – Clears the screen and redisplay the line."
        ;;
    19)
        echo "CTRL+M – Same as CTRL+J or RETURN."
        ;;
    20)
        echo "CTRL+N – Display next line in command history."
        ;;
    21)
        echo "CTRL+O – Run the command that you found using reverse search i.e CTRL+R."
        ;;
    22)
        echo "CTRL+P – Displays the previous line in command history."
        ;;
    23)
        echo "CTRL+R – Searches the history backward (Reverse search)."
        ;;
    24)
        echo "ALT+B – Move one character before the cursor."
        ;;
    25)
        echo "ALT+C – Suspends the running command/procesSame as CTRL+C"
        ;;
    26)
        echo "CTRL+S – Searches the history forward."
        ;;
    27)
        echo "CTRL+T – Swaps the last two characters."
        ;;
    28)
        echo "CTRL+U – Delete all characters before the cursor."
        ;;
    29)
        echo "CTRL+V – Makes the next character typed verbatim."
        ;;
    30)
        echo "CTRL+X – Lists the possible filename completions of the current word."
        ;;
    31)
        echo "CTRL+XX – Move between start of command line and current cursor position."
        ;;
    31)
        echo "CTRL+Y –  Retrieves last item that you deleted or cut."
        ;;
    32)
        echo "CTRL+[ – Equivalent to ESC key."
        ;;
    33)
        echo "!! – Repeats the last command."
        ;;
    34)
        echo "ESC+t – Swaps the last two words."
        ;;
esac
