object Form7: TForm7
  Left = 776
  Top = 291
  BorderStyle = bsSizeToolWin
  Caption = 'Cr'#233'er un nouveau PV'
  ClientHeight = 339
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poDesigned
  TextHeight = 15
  object SpeedButton1: TSpeedButton
    Left = 213
    Top = 290
    Width = 209
    Height = 41
    Caption = 'Cr'#233'er'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 1
    Top = 289
    Width = 209
    Height = 41
    Caption = 'Annuler'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton2Click
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 137
    Height = 15
    Caption = 'Les formation disponible :'
  end
  object Label2: TLabel
    Left = 8
    Top = 219
    Width = 74
    Height = 15
    Caption = 'Date de debut'
  end
  object Label3: TLabel
    Left = 216
    Top = 219
    Width = 57
    Height = 15
    Caption = 'Date de fin'
  end
  object Label4: TLabel
    Left = 8
    Top = 161
    Width = 102
    Height = 15
    Caption = '*Code de la section'
  end
  object Label5: TLabel
    Left = 8
    Top = 186
    Width = 56
    Height = 15
    Caption = 'TAG 1231 /'
  end
  object Label6: TLabel
    Left = 1
    Top = 269
    Width = 425
    Height = 15
    Caption = 
      '________________________________________________________________' +
      '_____________________'
  end
  object Label7: TLabel
    Left = 248
    Top = 161
    Width = 66
    Height = 15
    Caption = 'Responsable'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 32
    Width = 417
    Height = 120
    DataSource = FormationDataSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object date_start: TDateTimePicker
    Left = 8
    Top = 240
    Width = 161
    Height = 23
    Date = 45296.000000000000000000
    Time = 0.787724756941315700
    TabOrder = 1
  end
  object date_end: TDateTimePicker
    Left = 216
    Top = 240
    Width = 161
    Height = 23
    Date = 45296.000000000000000000
    Time = 0.787724756941315700
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 67
    Top = 182
    Width = 74
    Height = 23
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 248
    Top = 182
    Width = 153
    Height = 23
    TabOrder = 4
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=<LOCAL>'
      'User_Name=school'
      'Password=0000'
      'DriverID=Ora')
    Connected = True
    Left = 504
  end
  object PvDataSource: TDataSource
    DataSet = PvQuery
    Left = 448
    Top = 343
  end
  object PvQuery: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from pv')
    Left = 484
    Top = 240
  end
  object FormationDataSource: TDataSource
    DataSet = FormationQuery
    Left = 472
    Top = 168
  end
  object FormationQuery: TFDQuery
    Active = True
    AfterOpen = FormationQueryAfterOpen
    ConstraintsEnabled = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from formation')
    Left = 464
    Top = 96
  end
end
