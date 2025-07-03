#!/bin/bash

# Build Script for Pik-ael ISS Tracker Power BI Connector
# This script guides the user through building the .mez file using the Power Query SDK.
# It assumes that Power BI Desktop, VS Code, and the Power Query SDK extension are installed and configured.

echo "Pik-ael ISS Tracker Power BI Connector Build Helper"
echo "----------------------------------------------------"

# --- Configuration ---
# Define the project name (should match your .proj file and .pq file names)
PROJECT_NAME="ISSTracker"
# Define the path to the project file (update if your structure is different)
PROJECT_FILE="${PROJECT_NAME}.proj"
# Define the output directory for the .mez file (Power Query SDK default)
OUTPUT_DIR="bin/AnyCPU/Debug" # Or "bin/AnyCPU/Release" for release builds
# Define the Power BI Custom Connectors directory
# This usually is "[My Documents]\Power BI Desktop\Custom Connectors"
# IMPORTANT: Update this path if it's different on your system!
# Using a placeholder that needs to be manually set by the user or a more advanced script.
PBI_CUSTOM_CONNECTORS_DIR_WINDOWS_STYLE="[USER_DOCUMENTS]/Power BI Desktop/Custom Connectors"
# For WSL or Linux environments, you might need to map this path, e.g.:
# PBI_CUSTOM_CONNECTORS_DIR_UNIX_STYLE="/mnt/c/Users/YourUser/Documents/Power BI Desktop/Custom Connectors"


echo ""
echo "PHASE 3.1: Build the .mez file (Compile Project)"
echo "-------------------------------------------------"
echo "The following command needs to be run using the Power Query SDK tools."
echo "Typically, you would open your connector project folder in VS Code,"
echo "right-click on the '${PROJECT_FILE}' (or any .pq file) and select 'Build Connector Project',"
echo "or run the equivalent command from the Power Query SDK Task Runner in VS Code."
echo ""
echo "Alternatively, if the Power Query SDK provides a command-line interface (CLI) for building,"
echo "you might use a command similar to (this is a conceptual example):"
echo "# msbuild ${PROJECT_FILE} /t:Build"
echo "# or a specific Power Query SDK CLI command if available."
echo ""
echo "ACTION: Please use the Power Query SDK in VS Code to build the '${PROJECT_NAME}' project."
echo "        Ensure you have created actual PNG icons in 'resources/icons/' to replace the placeholders."
echo "        The SDK should create a '${PROJECT_NAME}.mez' file in the '${OUTPUT_DIR}' directory."
echo ""
echo "Press any key to continue after you have built the .mez file..."
read -n 1 -s -r

# Check if .mez file was created (basic check)
MEZ_FILE="${OUTPUT_DIR}/${PROJECT_NAME}.mez"
if [ -f "$MEZ_FILE" ]; then
    echo ""
    echo ".mez file found: $MEZ_FILE"
else
    echo ""
    echo "WARNING: .mez file NOT found at $MEZ_FILE. Make sure the build was successful."
    echo "         You might need to adjust OUTPUT_DIR in this script if your SDK outputs elsewhere."
fi

echo ""
echo "PHASE 3.2: Deploy the .mez file to Power BI Desktop"
echo "----------------------------------------------------"
echo "The .mez file needs to be copied to your Power BI Desktop Custom Connectors folder."
echo "The typical path is: ${PBI_CUSTOM_CONNECTORS_DIR_WINDOWS_STYLE}"
echo ""
echo "IMPORTANT: You might need to create the 'Custom Connectors' folder if it doesn't exist."
echo "           Also, ensure Power BI Desktop security settings are set to allow"
echo "           'unsupported' or 'uncertified' custom connectors."
echo ""
echo "Conceptual command (you'll likely do this manually or adapt for your OS):"
echo "# cp \"${MEZ_FILE}\" \"YOUR_ACTUAL_PBI_CUSTOM_CONNECTORS_DIR/${PROJECT_NAME}.mez\""
echo ""
echo "ACTION: Please copy '${MEZ_FILE}' to your Power BI Desktop Custom Connectors folder."
echo "        (e.g., ${PBI_CUSTOM_CONNECTORS_DIR_WINDOWS_STYLE}/${PROJECT_NAME}.mez)"
echo ""
echo "Press any key to continue after copying the file..."
read -n 1 -s -r

echo ""
echo "Build and Deploy guidance complete."
echo "-----------------------------------"
echo "Next steps (as per roadmap.json PHASE 4):"
echo "1. Restart Power BI Desktop."
echo "2. Try to get data using the 'ISS Position Tracker' connector."
echo "3. Verify it works as expected."
echo ""
echo "Good luck!"
