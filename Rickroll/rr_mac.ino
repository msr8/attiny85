#include "DigiKeyboard.h"
void setup() {
  // empty
}

void loop() 
{
  // Initialise digispark
  DigiKeyboard.sendKeyStroke(0);

  // Hits cmd+space to open spotlight
  DigiKeyboard.sendKeyStroke( KEY_SPACE,MOD_GUI_LEFT );
  DigiKeyboard.delay(600);

  // Enters the rickroll link and presses enter
  DigiKeyboard.print("https://www.youtube.com/watch?v=dQw4w9WgXcQ");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);

  for (;;) {/* Stops the loop */}
}
