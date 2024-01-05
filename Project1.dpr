program Project1;

uses
  Vcl.Forms,
  main in 'main.pas' {Form1},
  Etudiant in 'Etudiant.pas' {Form2},
  Vcl.Themes,
  Vcl.Styles,
  Diplome in 'Diplome.pas' {Form3},
  Archive in 'Archive.pas' {Form4},
  Auth in 'Auth.pas' {Form5},
  Gestion in 'Gestion.pas' {Form6},
  Helpers in 'Helpers.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
