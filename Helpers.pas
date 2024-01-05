unit Helpers;

interface
        uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons;
 procedure FitGrid(Grid: TDBGrid);
function GetSelectedID(const ADBGrid: TDBGrid; const ADataSet: TDataSet; const AFieldName: string): Integer;
implementation

// Function to resize columns width
procedure FitGrid(Grid: TDBGrid);
const
  C_Add=10;
var
  ds: TDataSet;
  bm: TBookmark;
  i: Integer;
  w: Integer;
  a: Array of Integer;
begin
  ds := Grid.DataSource.DataSet;
  if Assigned(ds) then
  begin
    ds.DisableControls;
    bm := ds.GetBookmark;
    try
      ds.First;
      SetLength(a, Grid.Columns.Count);
      while not ds.Eof do
      begin
        for I := 0 to Grid.Columns.Count - 1 do
        begin
          if Assigned(Grid.Columns[i].Field) then
          begin
            w :=  Grid.Canvas.TextWidth(ds.FieldByName(Grid.Columns[i].Field.FieldName).DisplayText);
            if a[i] < w  then
               a[i] := w ;
          end;
        end;
        ds.Next;
      end;
      for I := 0 to Grid.Columns.Count - 1 do
        Grid.Columns[i].Width := a[i] + C_Add;
        ds.GotoBookmark(bm);
    finally
      ds.FreeBookmark(bm);
      ds.EnableControls;
    end;
  end;
end;

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

