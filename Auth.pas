unit Auth;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, main;

type
  TForm5 = class(TForm)
    Image2: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Form5: TForm5;
  username: string;
  password: string;
  role: string;

implementation

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TForm5.Button2Click(Sender: TObject);
var
  dbUserName, dbPassword, dbRole: string;
  mainForm: TForm1;
begin
  if (Length(username) = 0) or (Length(password) = 0) then
  begin
    ShowMessage('Not all fields are filled');
  end
  else
  begin
    if not Assigned(DataSource1.DataSet) or not(DataSource1.DataSet is TFDQuery)
    then
    begin
      ShowMessage('DataSet is not assigned or is not a TFDQuery.');
      Exit;
    end;

    FDQuery1 := TFDQuery(DataSource1.DataSet);

    // Open the dataset if it's not already open
    if not FDQuery1.Active then
      FDQuery1.Open;

    // Access data from the dataset
    FDQuery1.First; // Move to the first record

    while True do
    begin
      dbUserName := FDQuery1.FieldByName('nom_utilisateur').AsString;
      dbPassword := FDQuery1.FieldByName('mdp').AsString;
      dbRole := FDQuery1.FieldByName('role').AsString;

      if (dbUserName = username) and (dbPassword = password) then
      begin
        role := dbRole;
        mainForm := TForm1.Create(nil);
        mainForm.SetUserInfo(username, role);
        mainForm.Show();
        hide();
        break;
      end;
      if FDQuery1.Eof then
      begin
        ShowMessage('wrong password or username');
        Break;
      end;
      FDQuery1.Next;
    end;

  end;
end;

procedure TForm5.Edit1Change(Sender: TObject);
begin
  username := Edit1.Text;
end;

procedure TForm5.Edit2Change(Sender: TObject);
begin
  password := Edit2.Text;
end;

end.
