<div align="center">

# 🚀 flet_windows_lamzing

**A native Windows desktop application built with [Flet](https://flet.dev/), packaged with Inno Setup, and shipped automatically via GitHub Actions CI/CD.**

[![Build Status](https://github.com/Mechanshil/flet_windows_lamzing/actions/workflows/build-windows.yml/badge.svg)](https://github.com/Mechanshil/flet_windows_lamzing/actions/workflows/build-windows.yml)
[![Python](https://img.shields.io/badge/Python-3.12-blue?logo=python&logoColor=white)](https://www.python.org/)
[![Flet](https://img.shields.io/badge/Flet-0.85.2-purple?logo=flutter&logoColor=white)](https://flet.dev/)
[![Platform](https://img.shields.io/badge/Platform-Windows-0078D4?logo=windows&logoColor=white)](https://www.microsoft.com/windows)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

</div>

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Tech Stack](#-tech-stack)
- [How It Works](#-how-it-works)
- [CI/CD Pipeline](#-cicd-pipeline)
- [Installation (End User)](#-installation-end-user)
- [Development Setup](#-development-setup)
- [Project Structure](#-project-structure)

---

## 🔍 Overview

`flet_windows_lamzing` demonstrates a complete, production-style pipeline for:

- Compiling a Python [Flet](https://flet.dev/) app into a **standalone native Windows executable**
- Packaging it with **Inno Setup** into a professional `.exe` installer (with Start Menu, Desktop shortcuts, and uninstaller)
- Automating the entire build & release process with **GitHub Actions** — triggered by a simple `git tag`

---

## 🛠 Tech Stack

| Tool | Purpose |
|---|---|
| **Python 3.12** | Application language & Flet CLI tooling |
| **Flet 0.85.2** | UI framework (Flutter-powered Python desktop apps) |
| **Flutter / MSVC** | Underlying native Windows compilation engine |
| **Inno Setup 6** | Packages raw build output into a standard `.exe` installer |
| **GitHub Actions** | Automated CI/CD on `windows-latest` runner |

---

## ⚙️ How It Works

### Developer Side (CI/CD)

```
Your Source Code (main.py)
         │
         ▼
GitHub Actions — flet build windows
         │
         ▼
Raw build output:
  build\flutter\build\windows\x64\runner\Release\
    ├── flet_windows_lamzing.exe
    ├── flutter_windows.dll
    ├── data\
    └── ... other runtime files ...
         │
         ▼
Inno Setup reads installer.iss
         │
         ▼
Single distributable installer:
  flet_windows_lamzing-setup-v1.0.0.exe  ← uploaded as GitHub artifact
```

### End User Side

```
GitHub Actions → Artifacts → windows-installer.zip
         │
         ▼
Extract → flet_windows_lamzing-setup-v1.0.0.exe
         │
         ▼
Double-click → Setup Wizard runs
         │
         ▼
Files copied to C:\Program Files\Flet Windows Lamzing\
         │
         ▼
Start Menu & Desktop shortcuts created ✅
```

---

## 🤖 CI/CD Pipeline

The workflow in [`.github/workflows/build-windows.yml`](.github/workflows/build-windows.yml) triggers automatically when you push a version tag.

### Trigger a new build

```bash
git add .
git commit -m "feat: your changes"
git push origin main

git tag v1.0.1
git push origin v1.0.1   # ← this triggers the build
```

### Pipeline steps

```
1. Checkout code
2. Set up Python 3.12  (with PYTHONUTF8=1 for Windows encoding compatibility)
3. pip install -r requirements.txt
4. flet build windows --project flet_windows_lamzing --yes
5. iscc installer.iss  (Inno Setup compile)
6. Upload flet_windows_lamzing-setup-vX.X.X.exe as artifact
```

> **Note:** `windows-latest` GitHub runners come pre-installed with Visual Studio 2022 (C++ workloads) and Inno Setup 6 — no extra setup needed.

---

## 💻 Installation (End User)

1. Go to [Actions](https://github.com/Mechanshil/flet_windows_lamzing/actions) → latest run → **Artifacts** → download **`windows-installer`**
2. Extract the `.zip` → run `flet_windows_lamzing-setup-v1.0.0.exe`
3. Follow the setup wizard

> **Windows Defender warning?** Click **More info → Run anyway**. This appears because the installer is not code-signed (normal for open-source/personal projects).

To uninstall: **Settings → Apps → Flet Windows Lamzing → Uninstall**

---

## 🧑‍💻 Development Setup

```bash
# Clone the repo
git clone https://github.com/Mechanshil/flet_windows_lamzing.git
cd flet_windows_lamzing

# Create a virtual environment
python -m venv .venv
.venv\Scripts\activate      # Windows
# source .venv/bin/activate # Linux/macOS

# Install dependencies
pip install -r requirements.txt

# Run the app in development mode
flet run main.py
```

---

## 📁 Project Structure

```
flet_windows_lamzing/
├── .github/
│   └── workflows/
│       └── build-windows.yml   # GitHub Actions CI/CD pipeline
├── main.py                     # Flet application entry point
├── installer.iss               # Inno Setup packaging script
├── requirements.txt            # Python dependencies
├── .gitignore
└── README.md
```

---

<div align="center">

Made with ❤️ by [Mechanshil](https://github.com/Mechanshil) · Powered by [Flet](https://flet.dev/)

</div>
