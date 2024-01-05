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
  FireDAC.VCLUI.Wait;

type
  TForm2 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBImage1: TDBImage;
    DBImage2: TDBImage;
    DBNavigator1: TDBNavigator;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DBImage3: TDBImage;
    DateTimePicker1: TDateTimePicker;
    GroupBox1: TGroupBox;
    Nom: TLabel;
    search_n: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label12: TLabel;
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
    Label17: TLabel;
    DateTimePicker3: TDateTimePicker;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Label18: TLabel;
    DBEdit8: TDBEdit;
    Edit2: TEdit;
    procedure DBEdit8Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.DBEdit8Change(Sender: TObject);
begin
ShowMessage(DBEdit8.Text)
end;

end.
