# UE23CS251A: Digital Design and Computer Organization Laboratory

This repository contains Verilog code and detailed problem statements for the 8 weeks of laboratory exercises conducted during the third semester as part of the **Digital Design and Computer Organization (DDCO)** course.

## Repository Overview

The repository is structured into weekly folders, each dedicated to the laboratory exercises for a specific week.

### Folder Contents

- **`README.md`**: Contains the problem statements and instructions for the week.
- **Verilog Files (`.v`)**: Includes the Verilog source code for the exercises.

## About the Course

The course, _UE22CS251A: Digital Design and Computer Organization Laboratory_, focuses on hands-on learning of fundamental digital design concepts using Verilog and their practical applications in computer organization.

## Installation Instructions for macOS

To work on the exercises in this repository, you will need **Icarus Verilog** (`iverilog`) for simulation and **GTKWave** for waveform visualization. Follow these steps to set them up on macOS:

### Step 1: Install Homebrew

Homebrew is a popular package manager for macOS. If not installed, run the following command in your terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Step 2: Verify Homebrew Installation

Ensure Homebrew is installed and set up correctly:

```bash
brew doctor
```

### Step 3: Install Icarus Verilog

Use Homebrew to install Icarus Verilog:

```bash
brew install icarus-verilog
```

Verify the installation by checking the version:

```bash
iverilog -v
```

### Step 4: Install GTKWave

Install GTKWave for waveform visualization:

```bash
brew install --HEAD randomplum/gtkwave/gtkwave
```

### Step 5: Locate GTKWave Binary

Navigate to the GTKWave installation directory:

```bash
/opt/homebrew/Cellar/gtkwave/
```

Press Tab to auto-complete the full path, which should look like:

```bash
/opt/homebrew/Cellar/gtkwave/HEAD-<unique_identifier>/bin
```

After entering the path, press Enter to complete the installation.

### Step 6: Verify GTKWave Installation

Check if GTKWave is installed correctly:

```bash
gtkwave --version
```

## Contributions

We welcome contributions to improve this repository! Here's how you can contribute:

1. **Bug Reports**: If you find any issues in the code or documentation, feel free to open an issue in the repository.
2. **Enhancements**: Submit pull requests to add new features, improve existing code, or update documentation.
3. **Suggestions**: Share your ideas by creating a discussion thread.

### Guidelines for Contributors

- Ensure your code follows the Verilog best practices.
- Provide detailed commit messages and explanations for your changes.
- Test your code thoroughly before submitting a pull request.

Thank you for your contributions!
