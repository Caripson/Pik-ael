# Power Query M language code for the ISS Tracker connector.
# This file defines the data source kind, authentication, and data retrieval logic.

# Version information
[Version = "1.0.0"] // Updated version as per roadmap.json example content
section ISSTracker;

# Data Source Kind Definition
# Defines how the connector is identified and published in Power BI.
[DataSource.Kind="ISSTracker", Publish="ISSTracker.Publish"]
shared ISSTracker.Contents = () =>
    let
        // Fetch data from the Open Notify API for current ISS position
        Source = Json.Document(Web.Contents("http://api.open-notify.org/iss-now.json")),

        // Access the 'iss_position' record from the JSON response
        position = Source[iss_position],

        // Convert the 'iss_position' record (e.g., [latitude = "12.34", longitude = "56.78"])
        // into a table with two columns: "Name" (containing "latitude", "longitude")
        // and "Value" (containing their respective values).
        #"Converted to Table" = Record.ToTable(position),

        // Rename the columns for better readability in Power BI
        // "Name" becomes "Egenskap" (Property)
        // "Value" becomes "Värde" (Value)
        #"Renamed Columns" = Table.RenameColumns(#"Converted to Table",{{\"Name\", \"Egenskap\"}, {\"Value\", \"Värde\"}})
    in
        #"Renamed Columns";

# UI Publishing Details
# Defines how the connector is presented in the Power BI "Get Data" dialog.
ISSTracker.Publish = [
    Authentication = [ Anonymous = [] ], // Public API, no authentication required
    ButtonText = { "ISSTracker.Contents", "ISS Position Tracker" }, // Text for the button and dialog
    SourceImage = ISSTracker.Icons, // Reference to icons
    SourceTypeImage = ISSTracker.Icons // Reference to icons
];

# Icons for the connector
# These are references to icon files that need to be included in the .mez package.
# Actual .png files (e.g., ISSTracker16.png) need to be created and placed in the 'resources/icons/' directory.
ISSTracker.Icons = [
    Icon16 = { Extension.Contents("resources/icons/ISSTracker16.png"), Extension.Contents("resources/icons/ISSTracker20.png"), Extension.Contents("resources/icons/ISSTracker24.png"), Extension.Contents("resources/icons/ISSTracker32.png") },
    Icon32 = { Extension.Contents("resources/icons/ISSTracker32.png"), Extension.Contents("resources/icons/ISSTracker40.png"), Extension.Contents("resources/icons/ISSTracker48.png"), Extension.Contents("resources/icons/ISSTracker64.png") }
];
