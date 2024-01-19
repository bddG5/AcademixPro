unit pv_new;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.Oracle,
  FireDAC.Phys.OracleDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ComCtrls, Helpers;

type
  TForm7 = class(TForm)
    FDConnection1: TFDConnection;
    PvDataSource: TDataSource;
    PvQuery: TFDQuery;
    FormationDataSource: TDataSource;
    FormationQuery: TFDQuery;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    date_start: TDateTimePicker;
    date_end: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Edit2: TEdit;
    Label7: TLabel;
    procedure FormationQueryAfterOpen(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  codeFormation: string;

implementation

{$R *.dfm}

procedure TForm7.DBGrid1CellClick(Column: TColumn);
begin
  codeFormation := DBGrid1.DataSource.DataSet.FieldByName
    ('codeFormation').AsString;
  Label5.Caption := codeFormation + ' / '
end;

procedure TForm7.FormationQueryAfterOpen(DataSet: TDataSet);
begin
  DBGrid1.Columns[0].Visible := false;
end;

procedure TForm7.SpeedButton1Click(Sender: TObject);
var
  pv_id, start_date, end_date, formation_id, section_code,
    particpants_id: string;
  canCreate: Boolean;

begin

  ///
  /// INSERT INTO pv (id_pv, id_formation, codeSection, date_debut, date_fin, statut, particpants)
  // VALUES
  // (1, 1, 'SectionA', TO_DATE('2024-01-05', 'DD-MM-YYYY'), TO_DATE('2024-02-05', 'YYYY-MM-DD'), 'open', 100),
  ///
  ///
  ///

  canCreate := true;
  formation_id := IntToStr(GetSelectedID(DBGrid1, FormationDataSource.DataSet,
    'id_formation'));
  start_date := DateToStr(date_start.Date);
  end_date := DateToStr(date_end.Date);

  pv_id := IntToStr(PvDataSource.DataSet.RecordCount + 1);

  if date_start.Date >= date_end.Date then
  begin
    canCreate := false;
    ShowMessage('Invalid date range. Please check your dates.');
  end;

  if Length(Edit1.Text) < 1 then
  begin
    canCreate := false;
    ShowMessage('Please enter the section code.');
  end;

  section_code := codeFormation + '/' + Edit1.Text;
  if Length(section_code) > 12 then
  begin
    canCreate := false;
    ShowMessage('le code de la section ne peux avoir plus de 12 caractère')
  end;
  if canCreate then
  begin
    PvQuery.Active := false;
    PvQuery.SQL.Clear();

    // creation d'une nouvelle section & particpantPv
    PvQuery.SQL.Add
      (Format('INSERT INTO section (codeSection, formation, responsable, totalStagiaire, dontFille, dontHandicapes, dontEtrangers, totalReussi, totalAjourne, totalExclue) '
      + 'VALUES (%s, %s, %s, 0, 0, 0, 0, 0, 0, 0)', [QuotedStr(section_code),
      formation_id, QuotedStr(Edit2.Text)]));
    PvQuery.ExecSQL;
    PvQuery.SQL.Clear();

    PvQuery.SQL.Add(Format('SELECT COALESCE(MAX(%s), 0) + 1 FROM %s',
      ['id', 'particpantPv']));
    PvQuery.Open();

    particpants_id := PvQuery.Fields[0].AsString;

    PvQuery.SQL.Clear();
    PvQuery.SQL.Add
      (Format('INSERT INTO particpantPv (id, nom, prenom, fonction, grade) VALUES (%s, ''   '', ''   '', ''   '', ''   '')',
      [particpants_id]));
    PvQuery.ExecSQL;
    PvQuery.SQL.Clear();
    PvQuery.SQL.Add
      (Format('INSERT INTO pv (id_pv, id_formation, codeSection, date_debut, date_fin, statut, particpants) '
      + 'VALUES (%s, %s, %s, TO_DATE(%s, ''DD/MM/YYYY''), TO_DATE(%s, ''DD/MM/YYYY''), ''open'', 0)',
      [pv_id, formation_id, QuotedStr(section_code), QuotedStr(start_date),
      QuotedStr(end_date)]));
    PvQuery.ExecSQL;
    PvQuery.Active := true;
    ShowMessage('Record inserted successfully.');
  end;
end;

procedure TForm7.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

end.
