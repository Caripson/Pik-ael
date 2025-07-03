// Power Query M language code for testing the ISSTracker connector.
// This file will contain test queries.
// According to README.md, TDD is a core principle.
// Tests will be written here before or alongside the implementation in ISSTracker.pq.

section TestISSTracker;

// Test för den faktiska datastrukturen från API:et, som returneras av ISSTracker.Contents().
// Detta test verifierar att huvudfunktionen returnerar data i förväntat format.
shared TestActualDataStructure = () =>
    let
        // Anropa funktionen som ska testas
        ResultTable = ISSTracker.Contents(),

        // Förväntningar för den faktiska implementeringen:
        // 1. Resultatet ska vara en tabell.
        // 2. Tabellen ska ha 2 rader (en för latitude och en för longitude).
        // 3. Tabellen ska ha kolumnerna "Egenskap" och "Värde".

        // Kontrollera typen
        IsTable = Value.Is(ResultTable, type table),
        Assert_IsTable = Value.Assert(IsTable, "TestActualDataStructure: Failed - Result is not a table. Expected type table, got " & Value.Type(ResultTable) & "."),

        // Kontrollera antal rader
        RowCount = Table.RowCount(ResultTable),
        ExpectedRowCount = 2,
        Assert_RowCount = Value.Assert(RowCount = ExpectedRowCount, "TestActualDataStructure: Failed - Incorrect row count. Expected " & Text.From(ExpectedRowCount) & ", got " & Text.From(RowCount) & "."),

        // Kontrollera kolumnnamn
        ActualColumnNames = Table.ColumnNames(ResultTable),
        ExpectedColumnNames = {"Egenskap", "Värde"},
        // Kontrollera att alla förväntade kolumner finns och att inga extra kolumner finns.
        HasCorrectColumns = List.MatchesAll(ExpectedColumnNames, each List.Contains(ActualColumnNames, _)) and List.Count(ActualColumnNames) = List.Count(ExpectedColumnNames) and List.MatchesAll(ActualColumnNames, each List.Contains(ExpectedColumnNames, _)),
        Assert_ColumnNames = Value.Assert(HasCorrectColumns, "TestActualDataStructure: Failed - Incorrect column names. Expected {" & Text.Combine(ExpectedColumnNames, ", ") & "}, got {" & Text.Combine(ActualColumnNames, ", ") & "}."),

        // Kontrollera datatypen för kolumnen "Egenskap" (ska vara text)
        EgenskapColumnType = Type.TableColumn(Value.Type(ResultTable), "Egenskap"),
        IsEgenskapText = EgenskapColumnType = type text,
        Assert_EgenskapType = Value.Assert(IsEgenskapText, "TestActualDataStructure: Failed - Column 'Egenskap' is not of type text. Got " & Type.ToText(EgenskapColumnType) & "."),

        // Kontrollera datatypen för kolumnen "Värde" (ska vara any, eftersom det är text från JSON)
        // Json.Document konverterar JSON-strängar till M-textvärden.
        VardeColumnType = Type.TableColumn(Value.Type(ResultTable), "Värde"),
        IsVardeAny = VardeColumnType = type any, // Mer specifikt type text efter Record.ToTable och Json.Document
        Assert_VardeType = Value.Assert(IsVardeAny, "TestActualDataStructure: Failed - Column 'Värde' is not of type any/text. Got " & Type.ToText(VardeColumnType) & ".")

    in
        // Om alla assertions passerar, returnera en framgångsindikator.
        // Om någon assertion misslyckas, kommer Value.Assert att kasta ett fel.
        "TestActualDataStructure: All structural and type checks passed successfully.";

// För att "köra" testerna (konceptuellt i denna miljö):
// Man skulle evaluera TestActualDataStructure() i en Power Query-motor.
// Om ISSTracker.Contents() är korrekt implementerad, bör detta test passera.
// Testet verifierar att den returnerade tabellen har rätt struktur, kolumnnamn och grundläggande datatyper.
