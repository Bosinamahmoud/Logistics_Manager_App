#  Logistics Manager App  

##  Overview  
A Flutter-based logistics management app that allows a manager to view, track, and manage delivery trips.
The app connects trips with drivers and vehicles, provides status updates, and stores data locally using **SQLite**.  

---

## Setup Instructions  

1. **Clone the repository:**  
   ```bash
   git clone https://github.com/Bosinamahmoud/Logistics_Manager_App.git
2. **Install dependencies::**
   ```bash
   flutter pub get
3. **Run the app on an emulator or device:**
   ```bash
   flutter run

4. **Requirements:**
   - Flutter SDK (latest stable version)
   - Dart SDK
   - Emulator or physical device (tested on Android)


## Assumptions Made
- The app currently works **offline only** (local storage with SQLite).  
- Each trip has **one driver** and **one vehicle** assigned.  
- Status flow is **linear**: Pending → In Progress → Completed.  
- Mock data was used initially; now **SQLite persists trips**.  
- No authentication/authorization yet (**manager is assumed as default user**).  

---

##  Features Implemented

### Home Screen
- Displays a **list of trips**.  
- Each trip card shows: **ID, driver, vehicle, locations, and status**.  

### Trip Details Screen
- View detailed info about a trip.  
- Update trip status directly.  

### Add Trip
- Create and save new trips in **SQLite**.  

### Status Updates
- Status changes are stored persistently in **SQLite**.  
- **Color-coded badges** for status (Pending, In Progress, Completed).  

### Responsive UI
- Implemented using **flutter_screenutil** for different screen sizes.  
     
