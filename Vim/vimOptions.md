# Vim options

## 1. Saving and Exiting

These commands are used in Command Mode (press Esc then :).

:w — Save the current file.

:wq or ZZ — Save changes and exit.

:q — Quit (only works if there are no unsaved changes).

:q! — Quit and discard all changes.

:saveas [filename] — Save the file under a new name.

## 2. Operating Modes

i — Enter Insert Mode at the cursor position.

a — Enter Insert Mode right after the cursor.

A — Start inserting text at the end of the current line.

Esc — Return to Normal Mode.

v — Enter Visual Mode to select characters.

V — Enter Visual Line Mode to select entire lines.

## 3. Navigation (Normal Mode)

While arrow keys work, Vim pros use these for speed:

h / j / k / l — Left, Down, Up, and Right.

w — Jump forward to the start of the next word.

b — Jump backward to the start of the previous word.

0 (zero) — Move to the beginning of the line.

$ — Move to the end of the line.

G — Go to the last line of the file.

gg — Go to the first line of the file.

## 4. Editing, Copying, and Deleting

x — Delete the character under the cursor.

dd — Delete (cut) the entire line.

yy — Copy (yank) the entire line.

p — Paste the copied/cut text below the current line.

u — Undo the last action.

Ctrl + r — Redo the last undone action.

## 5. Search and Replace

/word — Search for "word" from top to bottom.

?word — Search for "word" from bottom to top.

n — Jump to the next occurrence of the search.

:%s/old/new/g — Replace all occurrences of "old" with "new" in the whole file.