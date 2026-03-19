# Linux Terminal Shortcuts

## 1. Search and History

These shortcuts help you find and reuse previous commands without typing them again.

Ctrl + r: Reverse search through your command history. Just start typing a part of the command you used before.

Ctrl + g: Exit the history search mode and return to an empty command line.

Ctrl + p: Show the previous command (same as the Up arrow).

Ctrl + n: Show the next command (same as the Down arrow).

!!: Execute the last command again.

!string: Execute the most recent command that starts with "string".

## 2. Line Editing
Stop using Backspace for everything! These shortcuts allow you to cut and "paste" text on the fly.

Ctrl + u: Delete everything from the cursor position to the start of the line.

Ctrl + k: Delete everything from the cursor position to the end of the line.

Ctrl + w: Delete the word immediately before the cursor.

Ctrl + y: "Paste" (yank) the last text you deleted using the commands above.

Ctrl + _: Undo your last edit on the command line.

## 3. Cursor Navigation
Move quickly through long commands without using the arrow keys.

Ctrl + a: Move the cursor to the beginning of the line.

Ctrl + e: Move the cursor to the end of the line.

Alt + f: Move the cursor one word forward.

Alt + b: Move the cursor one word backward.

Ctrl + l: Clear the screen (similar to the clear command).

## 4. Process Control
Manage running programs and the terminal session.

Ctrl + c: Interrupt/Kill the current running command.

Ctrl + z: Suspend/Pause the current command and send it to the background.

Ctrl + d: Close the current terminal or log out (sends an EOF signal).

Tab: Autocomplete file names, directories, or commands.

## 5. Copy and Paste (Terminal Specific)

Remember: Standard Ctrl + c and Ctrl + v are reserved for process signals in Linux.

Ctrl + Shift + c: Copy selected text.

Ctrl + Shift + v: Paste text from the clipboard.