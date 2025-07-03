#!/bin/bash
# This script is used to set up the development environment for the Pik-ael Power BI Tools project.

echo "Setting up Pik-ael Power BI Tools development environment..."

# Ensure Python 3 and pip are installed
# This is a basic check; a more robust solution might involve specific version checks
# or using a tool like pyenv.
if ! command -v python3 &> /dev/null
then
    echo "Python 3 could not be found. Please install Python 3."
    # exit 1 # Uncomment to make script exit if Python is not found
fi

if ! command -v pip3 &> /dev/null
then
    echo "pip3 could not be found. Please ensure pip for Python 3 is installed."
    # exit 1 # Uncomment to make script exit if pip is not found
fi

# Install Python dependencies from requirements.txt
echo "Installing Python dependencies from requirements.txt..."
pip3 install -r requirements.txt

# Check if MkDocs is installed (as it's specified in requirements.txt)
if command -v mkdocs &> /dev/null
then
    echo "MkDocs installed successfully."
else
    echo "MkDocs installation might have failed or it's not in PATH."
fi

# Placeholder for other setup steps, e.g.:
# - Installing Power Query SDK (if automatable and not handled by VS Code extension)
# - Setting up Git hooks
# - Configuring other development tools

echo "Environment setup script completed."
echo "Remember to manually ensure Power BI Desktop and the Power Query SDK VS Code extension are installed as per roadmap.json."
