unit Gestion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Helpers, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Mask, pv_new, Vcl.Menus, Etudiant;

type
  TForm6 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    GroupBox1: TGroupBox;
    FDConnection1: TFDConnection;
    matiereDataSource: TDataSource;
    FormationQuery: TFDQuery;
    MatiereQuery: TFDQuery;
    FormationDataSource: TDataSource;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    PvQuery: TFDQuery;
    PvDataSource: TDataSource;
    StatusBar1: TStatusBar;
    idpv: TLabeledEdit;
    codeSection: TLabeledEdit;
    RadioButton1: TRadioButton;
    Label1: TLabel;
    pv_fermer: TRadioButton;
    Button1: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    Label2: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    PopupMenu1: TPopupMenu;
    Ajouterunstagaire1: TMenuItem;
    Modifier1: TMenuItem;
    Voirdocument1: TMenuItem;
    pv_formation: TComboBox;
    procedure FormationQueryAfterOpen(DataSet: TDataSet);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Ajouterunstagaire1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pv_formationChange(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

var // true = ouvert // false = fermer
  id, section, formtaion, status, selected_idPv: string;

implementation

{$R *.dfm}

procedure TForm6.Ajouterunstagaire1Click(Sender: TObject);
var
  frmEtude: TForm2;
var
  status_pv, pv_id, codeSection, idFormation: string;
begin
  status_pv := PvDataSource.DataSet.FieldByName('statut').AsString;
  pv_id := PvDataSource.DataSet.FieldByName('id_pv').AsString;
  codeSection := PvDataSource.DataSet.FieldByName('codeSection').AsString;
  idFormation := PvDataSource.DataSet.FieldByName('id_formation').AsString;
  if status_pv = 'open' then
  begin
    frmEtude := TForm2.Create(nil);
    frmEtude.Caption := 'Etudiant du pv N°' + pv_id + ' | section : ' +
      codeSection;
    frmEtude.SetInfo(codeSection, pv_id, idFormation);
    frmEtude.PageControl1.ActivePageIndex := 0;
    frmEtude.ShowModal()
  end
  else
  begin
    ShowMessage('non')
  end;

end;

procedure TForm6.Button1Click(Sender: TObject);

begin
  // get filter information
  id := idpv.Text;
  section := codeSection.Text;
  if pv_fermer.Checked = True then
  begin
    status := 'closed';
  end
  else
  begin
    status := 'open';
  end;

  PvQuery.Active := false;
  PvQuery.SQL.Clear();

  PvQuery.SQL.Add('SELECT * FROM pv WHERE 1 = 1');

  if id <> '' then
    PvQuery.SQL.Add('AND id_pv = ' + QuotedStr(id));

  if formtaion <> '' then
    PvQuery.SQL.Add('AND id_formation = ' + QuotedStr(formtaion));

  if section <> '' then
    PvQuery.SQL.Add('AND codeSection = ' + QuotedStr(section));

  PvQuery.SQL.Add('AND statut = ' + QuotedStr(status));

  // Execute the query
  PvQuery.Active := True;
end;

procedure TForm6.DBGrid1CellClick(Column: TColumn);
begin
  selected_idPv := DBGrid1.DataSource.DataSet.FieldByName('id_pv').AsString;
end;

procedure TForm6.DBGrid2CellClick(Column: TColumn);
var
  selectedId: string;
begin
  MatiereQuery.Active := false;
  selectedId := IntToStr(GetSelectedID(DBGrid2, FormationDataSource.DataSet,
    'id_formation'));
  MatiereQuery.SQL.Clear();
  MatiereQuery.SQL.Add('select * from matiere where id_formation=' +
    selectedId);
  MatiereQuery.Active := True;
  FixDBGridColumnsWidth(DBGrid3);
end;

procedure TForm6.FormationQueryAfterOpen(DataSet: TDataSet);
begin
  FixDBGridColumnsWidth(DBGrid2);

end;

procedure TForm6.FormShow(Sender: TObject);
begin

  FormationDataSource.DataSet.Open;
  try
    FormationDataSource.DataSet.First;

    while not FormationDataSource.DataSet.Eof do
    begin

      pv_formation.Items.Add(FormationDataSource.DataSet.FieldByName
        ('designation').AsString);

      FormationDataSource.DataSet.Next;
    end;
  finally

  end;
  pv_formation.ItemIndex := 0;
end;

procedure TForm6.pv_formationChange(Sender: TObject);
begin
  if pv_formation.Text <> '' then
  begin
    FormationQuery.Close;
    FormationQuery.SQL.Clear;
    FormationQuery.SQL.Add
      (Format('SELECT * FROM formation WHERE designation = %s',
      [QuotedStr(pv_formation.Text)]));
    FormationQuery.Open;

    if not FormationQuery.IsEmpty then
    begin
      // Check if there are records before accessing the field values
      formtaion := FormationQuery.FieldByName('id_formation').AsString;
    end
    else
    begin
      // Handle the case where no records are found
      formtaion := ''; // or any default value
    end;

    FormationQuery.Close;
    FormationQuery.SQL.Clear;
    FormationQuery.SQL.Add('SELECT * FROM formation');
    FormationQuery.Open;
  end;
end;

procedure TForm6.SpeedButton1Click(Sender: TObject);
var
  formationCount, matCount: Integer;
  newPv_frm: TForm7;
begin
  formationCount := FormationDataSource.DataSet.RecordCount;
  matCount := matiereDataSource.DataSet.RecordCount;
  if (formationCount < 1) or (matCount < 1) then
  begin
    ShowMessage('impossible de crée un pv sans formation ')
  end
  else
  begin
    newPv_frm := TForm7.Create(nil);
    newPv_frm.show();
  end;

end;

procedure TForm6.SpeedButton2Click(Sender: TObject);
var
  response: Integer;

begin

  response := MessageDlg
    (Format('Vous êtes sur le point de supprimer le pv n°%s', [selected_idPv]),
    mtConfirmation, [mbYes, mbNo], 0);

  case response of
    mrYes:
      begin
        PvQuery.Active := false;
        PvQuery.SQL.Clear();
        PvQuery.SQL.Add(Format('DELETE FROM pv WHERE id_pv= %s',
          [QuotedStr(selected_idPv)]));
        PvQuery.ExecSQL();
        PvQuery.SQL.Clear();
        PvQuery.Active := false;
        PvQuery.SQL.Clear();
        PvQuery.SQL.Add('select * from pv');
        PvQuery.Active := True;
      end;
  end;

end;

procedure TForm6.SpeedButton3Click(Sender: TObject);
var
  response: Integer;
  isClosed: string;
begin
  isClosed := DBGrid1.DataSource.DataSet.FieldByName('statut').AsString;
  if isClosed = 'open' then
  begin
    response := MessageDlg(Format('Vous êtes sur le point de fermer le pv n°%s',
      [selected_idPv]), mtConfirmation, [mbYes, mbNo], 0);

    case response of
      mrYes:
        begin
          PvQuery.Active := false;
          PvQuery.SQL.Clear();
          PvQuery.SQL.Text :=
            Format('UPDATE pv SET statut = %s WHERE id_pv = %s',
            [QuotedStr('closed'), QuotedStr(selected_idPv)]);
          PvQuery.ExecSQL();
          PvQuery.SQL.Clear();
          PvQuery.Active := false;
          PvQuery.SQL.Clear();
          PvQuery.SQL.Add('select * from pv');
          PvQuery.Active := True;
        end;
    end;
  end
  else
  begin
    ShowMessage('le pv selectioner est deja fermer')
  end;

end;

procedure TForm6.SpeedButton5Click(Sender: TObject);
begin
  PvQuery.Active := false;
  PvQuery.SQL.Clear();
  PvQuery.SQL.Add('select * from pv');
  PvQuery.Active := True;
end;

end.
