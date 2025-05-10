# Pixel Jumper

**Pixel Jumper** is a 2D platformer game built in **Godot Engine** where the player navigates levels by jumping between platforms, avoiding enemies, and collecting items to earn points.

## 🎮 Features

- Smooth **2D character movement** with double jump functionality.
- **Enemy AI** that patrols using RayCast2D for wall and cliff detection.
- Differentiated **enemy collision responses**:
  - Jump on their head to defeat them.
  - Touch from side/bottom to take damage.
- **Collectibles** that increase score.
- **Health system** that decreases upon enemy collision.
- **Sound system** using a global `AudioManager`:
  - Jump, coin, hurt, and stomp sound effects.
  - Level-specific background music.
- Game Manager tracks score and lives persistently across levels.

## 🛠 Built With

- [Godot Engine 4.1](https://godotengine.org/)
- GDScript


## ✅ How to Play

- **Arrow Keys / A-D** — Move left or right  
- **Spacebar** — Jump (double jump supported)  
- **Avoid enemies** or stomp on them  
- **Collect fruits** to gain points  
- **Don’t lose all 3 hearts!**

## 🧠 Lessons Learned

This project taught the fundamentals of:
- Scene instancing and node systems in Godot
- Physics-based movement and collision handling
- RayCasting for AI detection
- Organizing reusable scripts and signals
- Adding sound and polish to improve player experience

## 🗂️ How to Run

1. Clone or download this repo.
2. Open Godot Engine → **Import Project** → Select the `project.godot` file.
3. Run from the main scene (e.g. `level1.tscn`).

## 🙋 Author

Created by **Johnathan Ortiz-Flores** for CSE 4410 – Final Project  
[GitHub](https://github.com/johnathanwastaken)

## 🗂️ Assests
- https://pixelfrog-assets.itch.io/pixel-adventure-1
- https://pixelfrog-assets.itch.io/pixel-adventure-2
