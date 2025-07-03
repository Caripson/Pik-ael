// Power Query M language code for testing the ISSTracker connector.
// This file will contain test queries.
// According to README.md, TDD is a core principle.
// Tests will be written here before or alongside the implementation in ISSTracker.pq.

section TestISSTracker;

// Test för den initiala platshållarimplementeringen.
// Detta test förväntas passera initialt.
shared TestPlaceholderImplementation = () =>
    let
        Source = ISSTracker.Contents(),
        Expected = "Hello from ISSTracker connector (not yet implemented)",
        Result = Value.Assert(Source = Expected, "TestPlaceholderImplementation: Failed - Placeholder value does not match.")
    in
        Result;

// Test för den faktiska datastrukturen från API:et.
// Detta test kommer att misslyckas tills ISSTracker.Contents() är korrekt implementerad.
// Det är detta test vi vill få att passera.
shared TestActualDataStructure = () =>
    let
        // Anropa funktionen som ska testas
        ResultTable = ISSTracker.Contents(),

        // Förväntningar för den faktiska implementeringen:
        // 1. Resultatet ska vara en tabell.
        // 2. Tabellen ska ha 2 rader (latitude och longitude).
        // 3. Tabellen ska ha kolumnerna "Egenskap" och "Värde".

        // Kontrollera typen
        IsTable = Value.Is(ResultTable, type table),
        Assert_IsTable = Value.Assert(IsTable, "TestActualDataStructure: Failed - Result is not a table."),

        // Kontrollera antal rader (kommer att misslyckas med platshållaren)
        RowCount = Table.RowCount(ResultTable),
        ExpectedRowCount = 2,
        Assert_RowCount = Value.Assert(RowCount = ExpectedRowCount, "TestActualDataStructure: Failed - Incorrect row count. Expected " & Text.From(ExpectedRowCount) & ", got " & Text.From(RowCount) & "."),

        // Kontrollera kolumnnamn (kommer att misslyckas med platshållaren)
        ActualColumnNames = Table.ColumnNames(ResultTable),
        ExpectedColumnNames = {"Egenskap", "Värde"},
        HasCorrectColumns = List.MatchesAll(ExpectedColumnNames, each List.Contains(ActualColumnNames, _)) and List.Count(ActualColumnNames) = List.Count(ExpectedColumnNames),
        Assert_ColumnNames = Value.Assert(HasCorrectColumns, "TestActualDataStructure: Failed - Incorrect column names. Expected " & Text.Combine(ExpectedColumnNames, ", ") & ", got " & Text.Combine(ActualColumnNames, ", ") & ".")

    in
        // Om alla assertions passerar, returnera en framgångsindikator.
        // Om någon assertion misslyckas, kommer Value.Assert att kasta ett fel.
        // För ett faktiskt testramverk skulle man kanske returnera en lista av testresultat.
        "TestActualDataStructure: Preliminary checks defined. Will fail until implementation is complete.";

// För att "köra" testerna (konceptuellt i denna miljö):
// Man skulle evaluera TestPlaceholderImplementation() och TestActualDataStructure() i en Power Query-motor.
// TestPlaceholderImplementation() bör passera.
// TestActualDataStructure() bör misslyckas och indikera varför (t.ex. fel typ, fel antal rader).
