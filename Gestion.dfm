object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'Gestion'
  ClientHeight = 546
  ClientWidth = 799
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  PrintScale = poPrintToFit
  OnShow = FormShow
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 801
    Height = 593
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'PV'
      object DBGrid1: TDBGrid
        Left = 3
        Top = 123
        Width = 790
        Height = 438
        DataSource = PvDataSource
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 3
        Width = 790
        Height = 114
        Caption = 'Recherche'
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Formation'
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 4
        Top = 49
        Width = 349
        Height = 442
        DataSource = FormationDataSource
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnCellClick = DBGrid2CellClick
      end
      object DBGrid3: TDBGrid
        Left = 425
        Top = 49
        Width = 349
        Height = 441
        DataSource = matiereDataSource
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object DBNavigator1: TDBNavigator
        Left = 4
        Top = 9
        Width = 350
        Height = 36
        DataSource = FormationDataSource
        TabOrder = 2
      end
      object DBNavigator2: TDBNavigator
        Left = 423
        Top = 10
        Width = 360
        Height = 36
        DataSource = matiereDataSource
        TabOrder = 3
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 527
    Width = 799
    Height = 19
    Panels = <
      item
        Text = 'Status :'
        Width = 50
      end
      item
        Text = 'idl'
        Width = 50
      end>
    ExplicitLeft = 464
    ExplicitTop = 8
    ExplicitWidth = 0
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=<LOCAL>'
      'User_Name=school'
      'Password=0000'
      'DriverID=Ora')
    Connected = True
    Left = 376
    Top = 456
  end
  object matiereDataSource: TDataSource
    DataSet = MatiereQuery
    Left = 384
    Top = 168
  end
  object FormationQuery: TFDQuery
    Active = True
    AfterOpen = FormationQueryAfterOpen
    ConstraintsEnabled = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from formation')
    Left = 376
    Top = 272
  end
  object MatiereQuery: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from matiere')
    Left = 212
    Top = 400
  end
  object FormationDataSource: TDataSource
    DataSet = FormationQuery
    Left = 368
    Top = 336
  end
  object PvQuery: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from pv')
    Left = 364
    Top = 400
  end
  object PvDataSource: TDataSource
    DataSet = PvQuery
    Left = 104
    Top = 423
  end
end
