InkShieldTickerTape
===================

InkShield Ticker Tape Printer - Nicholas C Lewis 2013

Based on http://github.com/adafruit/Adafruit-Tweet-Receipt
Gutenbird demo sketch: monitors one or more Twitter accounts
for changes, displaying updates on attached thermal printer.
Written by Adafruit Industries.  MIT license.

REQUIRES ARDUINO IDE 1.0 OR LATER -- Back-porting is not likely to
occur, as the code is deeply dependent on the Stream class, etc.

Required hardware includes an Ethernet-connected Arduino board such
as the Arduino Ethernet or other Arduino-compatible board with an
Arduino Ethernet Shield, a unipolar stepper connected as shown at 
http://arduino.cc/en/Reference/StepperUnipolarCircuit, an LED,
plus an InkShield and all related power supplies and cabling.

You may need to adjust pins based on how you connect your motor, LED, etc...

***REQUIRES InkShield libraries from https://github.com/NicholasCLewis/InkShield

Resources:
http://www.adafruit.com/products/418 Arduino Ethernet
http://www.adafruit.com/products/284 FTDI Friend
http://www.adafruit.com/products/201 Arduino Uno
http://www.adafruit.com/products/201 Ethernet Shield
http://nicholasclewis.com/projects/inkshield InkShield
*/