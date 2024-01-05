unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Tabs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Etudiant, Vcl.WinXPickers, Gestion;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DatePicker1: TDatePicker;
    Image2: TImage;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);

  private
    From1: TForm2;

  public
    procedure SetUserInfo(const AUsername, ARole: string);
  end;

var
  Form1: TForm1;
  FUsername, FRole: string;

implementation

{$R *.dfm}

// Implementation of the SetUserInfo procedure
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Halt
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  if FRole = 'scolarite' then
  begin

    SpeedButton3.Visible := false;
    SpeedButton4.Visible := false;
  end
  else if FRole = 'diplome' then
  begin
    SpeedButton2.Enabled := false;
  end
  else
  begin
    ShowMessage('he');
  end;

end;

procedure TForm1.SetUserInfo(const AUsername, ARole: string);
begin
  FUsername := AUsername;
  FRole := ARole;
end;

// Rest of your implementation...
procedure animateSideMenu(Panel: TPanel; value: Integer);
begin
  Panel.Width := value;

end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  gestionForm: TForm6;
begin
  gestionForm := TForm6.Create(nil);
  gestionForm.show();
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var
  studentFrm: TForm2;
begin
  studentFrm := TForm2.Create(nil);
  studentFrm.show();
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  Halt
end;

end.
