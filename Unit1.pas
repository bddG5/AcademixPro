unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Tabs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage,Unit2,
  Vcl.WinXPickers;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DatePicker1: TDatePicker;
    procedure SpeedButton1Click(Sender: TObject);
  private
    From1:TForm2;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure animateSideMenu(Panel :TPanel; value :Integer);
begin
  Panel.Width:=value;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
Form2.show();
end;

end.
