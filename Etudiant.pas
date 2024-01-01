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
  Vcl.DBGrids, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    PageControl1: TPageControl;
    Etudiant: TTabSheet;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADODataSet1: TADODataSet;
    List: TTabSheet;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    Save: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Button5: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

end.
