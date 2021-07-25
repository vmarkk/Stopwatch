# ⏱ Stopwatch
App to track athletes lap speed


## 🛠HOW TO INSTALL


### Important: Only in case you don't have Cocoapods installed on your device:
- Open Terminal on your MacOs
- Type "**sudo gem pod install**"
- Press enter button and wait for the process to finish
- Go to step 1



### 1. Clone the repo


- On MacOS open Terminal 
- Run "**cd desktop**" in order to clone the project on desktop 
- Type "**git clone https://github.com/vmarkk/Stopwatch.git**" 
- Run by pressing enter button and wait for the process to finish



### 2. Install pods   
- Open Terminal again if you have previously closed it
- Move to the project folder by typing "**cd/Desktop/Stopwatch**"
- Press enter button
- Type "pod install"
- Press enter and wait for the pod install process to end 
- Close terminal


### 3. Run the project
- On your desktop open "**Stopwatch**" named folder
- Open "**Stopwatch.xcworkspace**" file
- On Xcode go to top panel then go to "**Product -> Clean build folder**" as follows:
<img width="364" alt="Schermata 2021-07-25 alle 14 35 47" src="https://user-images.githubusercontent.com/47919543/126899183-e682e598-6cb3-48da-8e28-8297f9dfb06c.png">

- Wait for the build folder clean to finish
- On left panel look for the "**Stopwatch**" file (the only one with the blue icon) as follows:
<img width="267" alt="Schermata 2021-07-25 alle 14 38 11" src="https://user-images.githubusercontent.com/47919543/126899238-b0119092-6647-4996-87ab-edb6e5c89e58.png">

- Go to "**Targets -> Stopwatch -> Signing & Capabilities**", choose your team in case it's not already selected by tapping on the drop down menu, as follows:
<img width="1101" alt="Schermata 2021-07-25 alle 14 37 33" src="https://user-images.githubusercontent.com/47919543/126899607-04dd0949-907e-4f79-a7c9-b100ccecfc54.png">


- Clean build folder again

- Tap on device dropdown menu and select a device to run on the project, iPhone 12 Pro preferably, or connect your physical device and run on it:
<img width="252" alt="Schermata 2021-07-25 alle 14 47 53" src="https://user-images.githubusercontent.com/47919543/126899521-9e54a57d-fb4d-49f8-b554-2ae7dcb82c4d.png">

# 📱 THE APP
### FRAMEWORKS INVOLVED:
- UIKit: all the UI parts
- Realm: local database to save each player's last session

### ARCHITECTURAL PATTERN:
- MVC

### USED DESIGN PATTERNS:
- Notification observer design pattern
- Key value observer design pattern
- Delegate design pattern

## 📘 QUICK GUIDE

- Select a player from the list with whom you would start a training session:
<img width="350" alt="Schermata 2021-07-25 alle 15 28 40" src="https://user-images.githubusercontent.com/47919543/126900965-f5d57ec5-c383-42e0-a45c-ea5cdfe9540f.png">


- Choose a distance in meters for the current session:
<img width="350" alt="Schermata 2021-07-25 alle 15 29 12" src="https://user-images.githubusercontent.com/47919543/126901030-92d39141-034f-4462-b648-8c0a9bfbf0c9.png">

- Start the session and track all the player's laps, check live stats, cancel or terminate and save it to your local device:
<img width="350" alt="Schermata 2021-07-25 alle 15 30 13" src="https://user-images.githubusercontent.com/47919543/126901055-aad809aa-ecfb-430f-8959-b39ec375a613.png">

- List all the players' last session in order to compare them:
<img width="350" alt="Schermata 2021-07-25 alle 15 30 54" src="https://user-images.githubusercontent.com/47919543/126901107-ca47cad6-6783-40e7-84d6-147f13bd4075.png">

- Select a sort option based on your needs (explosiveness or endurance):
<img width="350" alt="Schermata 2021-07-25 alle 15 31 53" src="https://user-images.githubusercontent.com/47919543/126901163-3e59cb9c-f465-4405-842e-f182bfd7af58.png">

- Delete a session you don't need anymore by long pressing on correspondent cell:
<img width="350" alt="Schermata 2021-07-25 alle 15 31 15" src="https://user-images.githubusercontent.com/47919543/126901267-cb4547fe-454a-4ecf-a7bb-45138045fdd7.png">


## 🤔 QUESTIONS? 

Hit me on:
ocram195@hotmail.com



