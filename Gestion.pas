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
  Vcl.Mask;

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
    RadioButton2: TRadioButton;
    Button1: TButton;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormationQueryAfterOpen(DataSet: TDataSet);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}


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

  DBGrid2.Columns[0].Visible := false;
  DBGrid3.Columns[0].Visible := false;
  DBGrid3.Columns[1].Visible := false;
end;

procedure TForm6.FormationQueryAfterOpen(DataSet: TDataSet);
begin
  FixDBGridColumnsWidth(DBGrid2);

end;

procedure TForm6.FormShow(Sender: TObject);
begin
  DBGrid2.Columns[0].Visible := false;
  DBGrid3.Columns[0].Visible := false;
  DBGrid3.Columns[1].Visible := false;
  DBGrid1.Columns[1].Visible := false;
end;

end.
