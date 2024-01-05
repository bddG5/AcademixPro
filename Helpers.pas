unit Helpers;

interface
        uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons;

function GetSelectedID(const ADBGrid: TDBGrid; const ADataSet: TDataSet; const AFieldName: string): Integer;
procedure FixDBGridColumnsWidth(const DBGrid: TDBGrid);
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
end.

