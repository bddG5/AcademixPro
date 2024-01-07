unit Etudiant;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.WindowsStore,
  Vcl.WinXCtrls, Data.DB, FireDAC.Comp.DataSet, System.Sensors,
  System.Sensors.Components, Vcl.ComCtrls, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Buttons,
  FireDAC.Stan.Pool, FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef,
  FireDAC.VCLUI.Wait,Helpers;

type
  TForm2 = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    EtudiantQueryDataSource: TDataSource;
    FDConnection1: TFDConnection;
    EtudiantQuery: TFDQuery;
    GroupBox1: TGroupBox;
    Nom: TLabel;
    search_n: TEdit;
    Label11: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label13: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label14: TLabel;
    SpeedButton1: TSpeedButton;
    ScrollBox1: TScrollBox;
    DBImage4: TDBImage;
    DBEdit4: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit7: TDBEdit;
    Label18: TLabel;
    Edit2: TEdit;
    GroupBox2: TGroupBox;
    da: TDBEdit;
    DBEdit10: TDBEdit;
    Label20: TLabel;
    DBEdit11: TDBEdit;
    Label19: TLabel;
    Label21: TLabel;
    DateTimePicker4: TDateTimePicker;
    num_ins_labl: TLabel;
    LabeledEdit1: TLabeledEdit;
    DBImage5: TDBImage;
    Label22: TLabel;
    Label23: TLabel;
    DBImage6: TDBImage;
    Label24: TLabel;
    Label25: TLabel;
    DateTimePicker3: TDateTimePicker;
    DBEdit8: TDBEdit;
    Label27: TLabel;
    Label28: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    save_btn: TSpeedButton;
    Label1: TLabel;
    annuler_btn: TSpeedButton;
    DBEdit_num_inscri: TDBEdit;
    DB_stag_id: TDBEdit;
    CustomQuery: TFDQuery;
    DBEdit1: TDBEdit;
    DBEdit_ddn: TDBEdit;
    db_idpv: TDBLabeledEdit;
    db_codesec: TDBLabeledEdit;
    procedure SpeedButton2Click(Sender: TObject);
    procedure annuler_btnClick(Sender: TObject);
    procedure save_btnClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateTimePicker4Change(Sender: TObject);
    procedure DateTimePicker3Change(Sender: TObject);
  private
    { Private declarations }
  public
     procedure SetInfo(const codeSec,idPv:string);
  end;

var
  Form2: TForm2;
  var pv_id,codeSection,edit_mode :string;
implementation
  procedure TForm2.SetInfo(const codeSec,idPv:string);
  begin
      pv_id:=  idPv;
      codeSection:=codeSec;
  end;
{$R *.dfm}

procedure TForm2.annuler_btnClick(Sender: TObject);
begin
EtudiantQueryDataSource.DataSet.Cancel;
 num_ins_labl.Caption:='';
  DBEdit_num_inscri.Text:='';
  db_codesec.Text:='';
  db_idpv.Text:='';
  EtudiantQuery.Active:=false;
  save_btn.Visible:=false;
  annuler_btn.Visible:=false;
  EtudiantQuery.Active:=true;
end;

procedure TForm2.DateTimePicker3Change(Sender: TObject);
begin
DBEdit1.Text:=DateToStr(DateTimePicker3.Date);
end;

procedure TForm2.DateTimePicker4Change(Sender: TObject);
begin
  DBEdit_ddn.Text:=DateToStr(DateTimePicker4.Date);
end;

procedure TForm2.FormShow(Sender: TObject);
begin
 EtudiantQuery.Active:=false;
  EtudiantQuery.SQL.Clear;
  EtudiantQuery.SQL.Add('select * from stagiaire where codeSection='+QuotedStr(codeSection));
  EtudiantQuery.Active:=true;
end;

procedure TForm2.save_btnClick(Sender: TObject);
begin
  EtudiantQueryDataSource.DataSet.Post;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
  EtudiantQueryDataSource.DataSet.Insert;
  save_btn.Visible:=true;
  annuler_btn.Visible:=true;
  num_ins_labl.Caption:=GenerateNumInscription();
  DBEdit_num_inscri.Text:= num_ins_labl.Caption;
  db_codesec.Text:=codeSection;
  db_idpv.Text:=pv_id;

  CustomQuery.SQL.Clear();
  CustomQuery.SQL.Add(Format('SELECT COALESCE(MAX(%s), 0) + 1 FROM %s', ['id_stagiaire', 'stagiaire']));
  CustomQuery.Open();
  if not CustomQuery.IsEmpty then
    DB_stag_id.Text := CustomQuery.Fields[0].AsString
  else
    DB_stag_id.Text := '1';


end;

procedure TForm2.SpeedButton5Click(Sender: TObject);
begin
  EtudiantQueryDataSource.DataSet.Cancel;

  save_btn.Visible:=false;
  annuler_btn.Visible:=false;
   EtudiantQuery.Active:=false;
  EtudiantQuery.SQL.Clear;
  EtudiantQuery.SQL.Add('select * from stagiaire where codeSection='+ QuotedStr(codeSection));
  EtudiantQuery.Active:=true;
end;

end.
