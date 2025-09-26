/* ____________________________
   This software is licensed under the MIT License:
   https://github.com/cifertech/nrfbox
   ________________________________________ */
   
#ifndef setting_H
#define setting_H

// #include <BLEDevice.h>
#include <U8g2lib.h>
#include <Adafruit_NeoPixel.h>
#include <EEPROM.h>
#include <RF24.h>
#include <vector>
#include <string>
#include <SD.h>
#include <Update.h>
#include <SPI.h>

// Board Specific Settings

// Only define USE_NIMBLE for boards that require it
#if defined(ARDUINO_ESP32C6_DEV) || defined(ARDUINO_ESP32C5_DEV)
  #define USE_NIMBLE
#endif

void neopixelSetup();
void neopixelLoop();

void setNeoPixelColour(const std::string& colour);
void flash(int numberOfFlashes, const std::vector<std::string>& colors, const std::string& finalColour);

//extern bool neoPixelActive;

extern bool neoPixelActive;
extern uint8_t oledBrightness;

extern RF24 RadioA;
extern RF24 RadioB;
extern RF24 RadioC;

void configureNrf(RF24 &radio);

void setRadiosNeutralState();

void setupRadioA();
void setupRadioB();
void setupRadioC();

void initAllRadios();

void Str(uint8_t x, uint8_t y, const uint8_t* asciiArray, size_t len);
void CenteredStr(uint8_t screenWidth, uint8_t y, const uint8_t* asciiArray, size_t len, const uint8_t* font);
void utils();
void conf();

namespace Setting {
  void settingSetup();
  void settingLoop();
}

#endif
