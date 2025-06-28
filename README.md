# 🧾 Wallet Hunter - Family Registration & Management App

This Flutter app is built as part of an interview assignment to demonstrate core mobile development skills including
form handling, state management, conditional logic, local storage, and UI rendering.

---

## 🔧 Tech Stack

- **Framework**: Flutter **v3.22.1**
- **State Management**: Flutter Bloc
- **Local Storage**: SharedPreferences
- **Routing**: Named Routes
- **Formatting**: Custom `TextInputFormatter` used for formatting Date of Birth (DD/MM/YYYY)

---

## ✅ Features Implemented

### 👨‍👩‍👧‍👦 1. Head Registration

- Collects personal, contact, and address details.
- Saves data locally for login validation.
- **DOB field includes custom formatter** for input as `DD/MM/YYYY`.

### 🔐 2. OTP Verification

- OTP is statically set to **`1234`** for validation in this demo.

### 👥 3. Family Member Management

- Add / Edit / Delete Family Members.
- Members are stored locally using SharedPreferences.
- Clean and intuitive UI with Slidable actions and gradient-styled cards.

### 🔒 4. Permission-Based Deletion

- **Only the Head of the family** (validated via registered phone number) can delete a family member.

### 🌳 5. Family Tree

- Dynamically visualizes family relationships based on relation (spouse, children, grandchildren).
- Includes **image export** functionality to save/share the family tree.

### 🛕 6. Temple Auto-Association

- Dropdown to select **Samaj**.
- Based on selected Samaj, a **static list of temples** (name, location, developer) is displayed.
- Includes search functionality for filtering temples.

