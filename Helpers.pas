unit Helpers;

interface
        uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, FireDAC.Comp.Client;

function GetSelectedID(const ADBGrid: TDBGrid; const ADataSet: TDataSet; const AFieldName: string): Integer;
procedure FixDBGridColumnsWidth(const DBGrid: TDBGrid);
function IncrementId(const dbQuery: TFDQuery; const tableName, fieldName: string): string;
function GenerateNumInscription: string;
implementation

// Function to resize columns width
procedure FixDBGridColumnsWidth(const DBGrid: TDBGrid);
var
  i : integer;
  TotWidth : integer;
  VarWidth : integer;
  ResizableColumnCount : integer;
  AColumn : TColumn;
begin
  //total width of all columns before resize
  TotWidth := 0;
  //how to divide any extra space in the grid
  VarWidth := 0;
  //how many columns need to be auto-resized
  ResizableColumnCount := 0;

  for i := 0 to -1 + DBGrid.Columns.Count do
  begin
    TotWidth := TotWidth + DBGrid.Columns[i].Width;
    if DBGrid.Columns[i].Field.Tag <> 0 then
      Inc(ResizableColumnCount);
  end;

  //add 1px for the column separator line
  if dgColLines in DBGrid.Options then
    TotWidth := TotWidth + DBGrid.Columns.Count;

  //add indicator column width
  if dgIndicator in DBGrid.Options then
    TotWidth := TotWidth + IndicatorWidth;

  //width vale "left"
  VarWidth :=  DBGrid.ClientWidth - TotWidth;

  //Equally distribute VarWidth
  //to all auto-resizable columns
  if ResizableColumnCount > 0 then
    VarWidth := varWidth div ResizableColumnCount;

  for i := 0 to -1 + DBGrid.Columns.Count do
  begin
    AColumn := DBGrid.Columns[i];
    if AColumn.Field.Tag <> 0 then
    begin
      AColumn.Width := AColumn.Width + VarWidth;
      if AColumn.Width < AColumn.Field.Tag then
        AColumn.Width := AColumn.Field.Tag;
    end;
  end;
end; (*FixDBGridColumnsWidth*)

function GetSelectedID(const ADBGrid: TDBGrid; const ADataSet: TDataSet; const AFieldName: string): Integer;
begin
  Result := -0; // Default value if no ID is selected

  // Check if any row is selected
  if (ADBGrid.SelectedRows.Count > 0) or (not ADataSet.IsEmpty) then
  begin
    // If multiple rows are selected, get the first selected row ID
    if ADBGrid.SelectedRows.Count > 0 then
    begin
      ADataSet.GotoBookmark(ADBGrid.SelectedRows[0]);
    end;

    // Get the ID from the selected row
    Result := ADataSet.FieldByName(AFieldName).AsInteger;
  end;
end;

function IncrementId(const dbQuery: TFDQuery; const tableName, fieldName: string): string;
var
  maxId: Integer;
begin
  Result := '1'; // Default value if no records are found

  dbQuery.SQL.Clear();
  dbQuery.SQL.Add(Format('SELECT COALESCE(MAX(%s), 0) + 1 FROM %s', [fieldName, tableName]));
  dbQuery.Open();

  if not dbQuery.IsEmpty then
    maxId := dbQuery.Fields[0].AsInteger
  else
    maxId := 1;

  Result := IntToStr(maxId);
end;
 function GenerateNumInscription: string;
var
  year, month, day: Word;
  randomNum: Integer;
begin
  // Get the current date components
  DecodeDate(Now, year, month, day);

  // Generate a random number (assuming you want it within a certain range)
  randomNum := Random(1000); // Adjust the range as needed

  // Create the formatted string
  Result := Format('%04d/%d/%d/CS', [year, randomNum, day]);
end;
end.

