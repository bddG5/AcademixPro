unit Etudiant;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.WindowsStore,
  Vcl.WinXCtrls, Data.DB, FireDAC.Comp.DataSet, System.Sensors,
  System.Sensors.Components, Vcl.ComCtrls, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Buttons,
  FireDAC.Stan.Pool, FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef,
  FireDAC.VCLUI.Wait, Helpers, Vcl.ExtDlgs;

type
  TForm2 = class(TForm)
    EtudiantQueryDataSource: TDataSource;
    FDConnection1: TFDConnection;
    EtudiantQuery: TFDQuery;
    CustomQuery: TFDQuery;
    OpenPictureDialog1: TOpenPictureDialog;
    ResultatMatiereQuery: TFDQuery;
    ResultatMatiereDataSource: TDataSource;
    Label4: TLabel;
    MatiereDataSource: TDataSource;
    MatiereQuery: TFDQuery;
    ResultatSemstreQuery: TFDQuery;
    ResultatSemstreDataSource: TDataSource;
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    DBGrid1: TDBGrid;
    GroupBox5: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    SpeedButton10: TSpeedButton;
    Edit1: TEdit;
    DateTimePicker1: TDateTimePicker;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit3: TEdit;
    LabeledEdit2: TLabeledEdit;
    ScrollBox2: TScrollBox;
    Label12: TLabel;
    Label17: TLabel;
    Label23: TLabel;
    Label26: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    save_btn: TSpeedButton;
    Label36: TLabel;
    annuler_btn: TSpeedButton;
    DBImage1: TDBImage;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    GroupBox6: TGroupBox;
    num_ins_labl: TLabel;
    DBEdit9: TDBEdit;
    db_sex: TDBEdit;
    DBEdit13: TDBEdit;
    DateTimePicker5: TDateTimePicker;
    DBImage2: TDBImage;
    DBImage3: TDBImage;
    DateTimePicker3: TDateTimePicker;
    DBEdit14: TDBEdit;
    DBEdit_num_inscri: TDBEdit;
    DB_stag_id: TDBEdit;
    db_ddn: TDBEdit;
    db_dateInscri: TDBEdit;
    db_idpv: TDBLabeledEdit;
    db_codesec: TDBLabeledEdit;
    TabSheet4: TTabSheet;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    GroupBox7: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Button8: TButton;
    Button9: TButton;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    formation_matiere: TComboBox;
    Button10: TButton;
    Button11: TButton;
    GroupBox8: TGroupBox;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Label42: TLabel;
    coef: TDBEdit;
    ComboBox1: TComboBox;
    procedure SpeedButton2Click(Sender: TObject);
    procedure annuler_btnClick(Sender: TObject);
    procedure save_btnClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateTimePicker4Change(Sender: TObject);
    procedure DateTimePicker3Change(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBImage5Click(Sender: TObject);
    procedure DBImage4Click(Sender: TObject);
    procedure DBImage6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure formation_matiereChange(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure EtudiantQueryDataSourceDataChange(Sender: TObject; Field: TField);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetInfo(const codeSec, idPv, idFormation: string);
  end;

var
  Form2: TForm2;

var
  pv_id, codeSection, selected_id, formation_id, selected_matiere_id: string;

var
  canEdit: Boolean;

implementation

procedure TForm2.SetInfo(const codeSec, idPv, idFormation: string);
begin
  pv_id := idPv;
  codeSection := codeSec;
  formation_id := idFormation;
end;
{$R *.dfm}

procedure TForm2.annuler_btnClick(Sender: TObject);
begin
  EtudiantQueryDataSource.DataSet.Cancel;
  num_ins_labl.Caption := '';
  DBEdit_num_inscri.Text := '';
  db_codesec.Text := '';
  db_idpv.Text := '';
  EtudiantQuery.Active := false;
  save_btn.Visible := false;
  annuler_btn.Visible := false;
  EtudiantQuery.Active := true;
  canEdit := true
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  ResultatMatiereQuery.Active := false;
  ResultatMatiereQuery.SQL.Clear;
  ResultatMatiereQuery.SQL.Add
    (Format('select * from resultat_matiere WHERE id_stagiaire=%s',
    [selected_id]));
  ResultatMatiereQuery.Active := true;

end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
  EtudiantQueryDataSource.DataSet.FieldByName('sex').AsString := ComboBox1.Text;
end;

procedure TForm2.DateTimePicker3Change(Sender: TObject);
begin
  EtudiantQueryDataSource.DataSet.FieldByName('date_inscription').AsString :=
    DateToStr(DateTimePicker3.Date);

end;

procedure TForm2.DateTimePicker4Change(Sender: TObject);
begin
  EtudiantQueryDataSource.DataSet.FieldByName('ddn').AsString :=
    DateToStr(DateTimePicker5.Date);

end;

procedure TForm2.DBImage4Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    // Assuming your dataset is connected to a TTable or TQuery
    DBImage1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    DBImage1.Refresh;
  end;
end;

procedure TForm2.DBImage5Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    DBImage2.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    DBImage2.Refresh;
  end;
end;

procedure TForm2.DBImage6Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    DBImage3.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    DBImage3.Refresh;
  end;
end;

procedure TForm2.EtudiantQueryDataSourceDataChange(Sender: TObject;
  Field: TField);
var
  db_ddn, db_insd: string;
begin
  selected_id := DBGrid1.DataSource.DataSet.FieldByName('id_stagiaire')
    .AsString;
  db_ddn := EtudiantQueryDataSource.DataSet.FieldByName('ddn').AsString;
  db_insd := EtudiantQueryDataSource.DataSet.FieldByName
    ('date_inscription').AsString;
  if (length(db_ddn) > 0) and (length(db_insd) > 0) then
  begin
    DateTimePicker5.Date := StrToDate(db_ddn);

    DateTimePicker3.Date := StrToDate(db_insd);
  end;

  ComboBox1.Text := EtudiantQueryDataSource.DataSet.FieldByName('sex').AsString;

  num_ins_labl.Caption := EtudiantQueryDataSource.DataSet.FieldByName
    ('num_inscription').AsString;
end;

procedure TForm2.formation_matiereChange(Sender: TObject);
begin
  if formation_matiere.Text <> '' then
  begin
    MatiereQuery.Close;
    MatiereQuery.SQL.Clear;
    MatiereQuery.SQL.Add(Format('SELECT * FROM matiere WHERE nomMatiere = %s',
      [QuotedStr(formation_matiere.Text)]));
    MatiereQuery.Open;

    if not MatiereQuery.IsEmpty then
    begin
      // Check if there are records before accessing the field values
      selected_matiere_id := MatiereQuery.FieldByName('id_matiere').AsString;
    end
    else
    begin
      // Handle the case where no records are found
      selected_matiere_id := ''; // or any default value
    end;
    ShowMessage(selected_matiere_id);
    MatiereQuery.Close;
    MatiereQuery.SQL.Clear;
    MatiereQuery.SQL.Add(Format('SELECT * FROM matiere WHERE id_formation=%s',
      [QuotedStr(formation_id)]));
    MatiereQuery.Open;
  end;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  EtudiantQuery.Active := false;
  EtudiantQuery.SQL.Clear;
  EtudiantQuery.SQL.Add('select * from stagiaire where codeSection=' +
    QuotedStr(codeSection));
  EtudiantQuery.Active := true;
  canEdit := true;
  ComboBox1.Style := csOwnerDrawFixed;
  MatiereQuery.Active := false;
  MatiereQuery.SQL.Clear;
  MatiereQuery.SQL.Add(Format('SELECT * FROM matiere WHERE id_formation=%s',
    [QuotedStr(formation_id)]));

  MatiereQuery.Active := true;
  MatiereDataSource.DataSet.Open;
  try
    MatiereDataSource.DataSet.First;

    while not MatiereDataSource.DataSet.Eof do
    begin

      formation_matiere.Items.Add(MatiereDataSource.DataSet.FieldByName
        ('nomMatiere').AsString);

      MatiereDataSource.DataSet.Next;
    end;
    formation_matiere.ItemIndex := 0;
  finally

  end;

end;

procedure TForm2.save_btnClick(Sender: TObject);
begin
  EtudiantQueryDataSource.DataSet.Post;
  canEdit := true
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin

  if canEdit = true then
  begin
    canEdit := false;
    EtudiantQueryDataSource.DataSet.Insert;
    save_btn.Visible := true;
    annuler_btn.Visible := true;
    num_ins_labl.Caption := GenerateNumInscription();

    EtudiantQueryDataSource.DataSet.FieldByName('num_inscription').AsString :=
      num_ins_labl.Caption;
    EtudiantQueryDataSource.DataSet.FieldByName('codeSection').AsString :=
      codeSection;
    EtudiantQueryDataSource.DataSet.FieldByName('id_pv').AsString := pv_id;

    CustomQuery.SQL.Clear();
    CustomQuery.SQL.Add(Format('SELECT COALESCE(MAX(%s), 0) + 1 FROM %s',
      ['id_stagiaire', 'stagiaire']));
    CustomQuery.Open();

    if not CustomQuery.IsEmpty then
      DB_stag_id.Text := CustomQuery.Fields[0].AsString
    else
      DB_stag_id.Text := '1';
  end
  else
  begin
    ShowMessage('Veuiller enrgister vos modification avant de procéder');
  end;

end;

procedure TForm2.SpeedButton4Click(Sender: TObject);
var
  response: Integer;

begin

  response := MessageDlg
    (Format('Vous êtes sur le point de supprimer le stagaire n°%s',
    [selected_id]), mtConfirmation, [mbYes, mbNo], 0);

  case response of
    mrYes:
      begin
        EtudiantQuery.Active := false;
        EtudiantQuery.SQL.Clear();
        EtudiantQuery.SQL.Add
          (Format('DELETE FROM stagiaire WHERE id_stagiaire= %s',
          [QuotedStr(selected_id)]));
        EtudiantQuery.ExecSQL();
        EtudiantQuery.SQL.Clear();
        EtudiantQuery.Active := false;
        EtudiantQuery.SQL.Clear();
        EtudiantQuery.SQL.Add('select * from stagiaire');
        EtudiantQuery.Active := true;
      end;
  end;

end;

procedure TForm2.SpeedButton5Click(Sender: TObject);
begin
  EtudiantQueryDataSource.DataSet.Cancel;

  save_btn.Visible := false;
  annuler_btn.Visible := false;
  EtudiantQuery.Active := false;
  EtudiantQuery.SQL.Clear;
  EtudiantQuery.SQL.Add('select * from stagiaire where codeSection=' +
    QuotedStr(codeSection));
  EtudiantQuery.Active := true;
end;

procedure TForm2.SpeedButton7Click(Sender: TObject);
begin
  EtudiantQueryDataSource.AutoEdit := true;
  save_btn.Visible := true;
  annuler_btn.Visible := true;
  EtudiantQueryDataSource.DataSet.Edit;
end;

end.
