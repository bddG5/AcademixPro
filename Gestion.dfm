object Form6: TForm6
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Gestion'
  ClientHeight = 580
  ClientWidth = 805
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
    ActivePage = TabSheet2
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'PV'
      object SpeedButton1: TSpeedButton
        Left = 677
        Top = 17
        Width = 113
        Height = 30
        Caption = 'Cr'#233'er'
        Transparent = False
        OnClick = SpeedButton1Click
      end
      object SpeedButton3: TSpeedButton
        Left = 677
        Top = 53
        Width = 113
        Height = 30
        Caption = 'Fermer'
        Transparent = False
        OnClick = SpeedButton3Click
      end
      object SpeedButton2: TSpeedButton
        Left = 677
        Top = 89
        Width = 113
        Height = 33
        Caption = 'Supprimer'
        Transparent = False
        OnClick = SpeedButton2Click
      end
      object SpeedButton4: TSpeedButton
        Left = 561
        Top = 17
        Width = 113
        Height = 30
        Caption = 'Document'
        Transparent = False
      end
      object SpeedButton5: TSpeedButton
        Left = 561
        Top = 53
        Width = 113
        Height = 30
        Caption = 'Rafraichir'
        Transparent = False
        OnClick = SpeedButton5Click
      end
      object DBGrid1: TDBGrid
        Left = 3
        Top = 144
        Width = 790
        Height = 417
        DataSource = PvDataSource
        PopupMenu = PopupMenu1
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 3
        Width = 553
        Height = 126
        Caption = 'Recherche'
        TabOrder = 1
        object Label1: TLabel
          Left = 340
          Top = 25
          Width = 32
          Height = 15
          Caption = 'Status'
        end
        object Label2: TLabel
          Left = 153
          Top = 25
          Width = 55
          Height = 15
          Caption = 'Formation'
        end
        object idpv: TLabeledEdit
          Left = 11
          Top = 43
          Width = 121
          Height = 23
          EditLabel.Width = 60
          EditLabel.Height = 15
          EditLabel.Caption = 'Numero pv'
          NumbersOnly = True
          TabOrder = 0
          Text = ''
        end
        object codeSection: TLabeledEdit
          Left = 11
          Top = 90
          Width = 121
          Height = 23
          EditLabel.Width = 70
          EditLabel.Height = 15
          EditLabel.Caption = 'Code Section'
          NumbersOnly = True
          TabOrder = 1
          Text = ''
        end
        object RadioButton1: TRadioButton
          Left = 340
          Top = 49
          Width = 65
          Height = 17
          Caption = 'Ouvert'
          TabOrder = 2
        end
        object pv_fermer: TRadioButton
          Left = 340
          Top = 71
          Width = 65
          Height = 20
          Caption = 'Fermer'
          TabOrder = 3
        end
        object Button1: TButton
          Left = 423
          Top = 90
          Width = 114
          Height = 25
          Caption = 'Chercher'
          TabOrder = 4
          OnClick = Button1Click
        end
      end
      object pv_formation: TComboBox
        Left = 153
        Top = 49
        Width = 168
        Height = 23
        TabOrder = 2
        OnChange = pv_formationChange
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Formation'
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 4
        Top = 49
        Width = 786
        Height = 192
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
        Left = 0
        Top = 285
        Width = 790
        Height = 210
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
        Width = 780
        Height = 36
        DataSource = FormationDataSource
        TabOrder = 2
      end
      object DBNavigator2: TDBNavigator
        Left = 2
        Top = 245
        Width = 780
        Height = 36
        DataSource = matiereDataSource
        TabOrder = 3
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 561
    Width = 805
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
    ExplicitTop = 560
    ExplicitWidth = 801
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
  object FDQuery1: TFDQuery
    Active = True
    AfterOpen = FormationQueryAfterOpen
    ConstraintsEnabled = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from formation')
    Left = 688
    Top = 232
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 680
    Top = 296
  end
  object PopupMenu1: TPopupMenu
    Left = 544
    Top = 65530
    object Ajouterunstagaire1: TMenuItem
      Caption = 'Stagaires'
      OnClick = Ajouterunstagaire1Click
    end
    object Modifier1: TMenuItem
      Caption = 'Modifier'
    end
    object Voirdocument1: TMenuItem
      Caption = 'Voir document'
    end
  end
end
