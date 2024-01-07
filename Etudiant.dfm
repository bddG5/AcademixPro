object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Etudiant'
  ClientHeight = 603
  ClientWidth = 1111
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  TextHeight = 15
  object Label23: TLabel
    Left = 724
    Top = 308
    Width = 71
    Height = 15
    Caption = 'FORMULAIRE'
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1111
    Height = 601
    ActivePage = TabSheet2
    TabOrder = 0
    object TabSheet2: TTabSheet
      Caption = 'List'
      ImageIndex = 1
      object SpeedButton2: TSpeedButton
        Left = 630
        Top = 7
        Width = 113
        Height = 30
        Caption = 'Ajouter'
        Transparent = False
        OnClick = SpeedButton2Click
      end
      object SpeedButton3: TSpeedButton
        Left = 630
        Top = 43
        Width = 113
        Height = 30
        Caption = 'Modifier'
        Transparent = False
      end
      object SpeedButton4: TSpeedButton
        Left = 630
        Top = 79
        Width = 113
        Height = 33
        Caption = 'Supprimer'
        Transparent = False
      end
      object SpeedButton5: TSpeedButton
        Left = 511
        Top = 7
        Width = 113
        Height = 30
        Caption = 'Rafraichir'
        Transparent = False
        OnClick = SpeedButton5Click
      end
      object DBGrid1: TDBGrid
        Left = 4
        Top = 125
        Width = 747
        Height = 441
        DataSource = EtudiantQueryDataSource
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 2
        Width = 501
        Height = 114
        Caption = 'Recherche'
        TabOrder = 1
        object Nom: TLabel
          Left = 16
          Top = 18
          Width = 27
          Height = 15
          Caption = 'Nom'
        end
        object Label11: TLabel
          Left = 16
          Top = 66
          Width = 42
          Height = 15
          Caption = 'Prenom'
        end
        object Label13: TLabel
          Left = 177
          Top = 18
          Width = 94
          Height = 15
          Caption = 'Date de naissance'
        end
        object Label14: TLabel
          Left = 177
          Top = 66
          Width = 18
          Height = 15
          Caption = 'Sex'
        end
        object SpeedButton1: TSpeedButton
          Left = 337
          Top = 73
          Width = 136
          Height = 30
          Caption = 'Chercher'
        end
        object search_n: TEdit
          Left = 16
          Top = 37
          Width = 146
          Height = 23
          TabOrder = 0
        end
        object DateTimePicker2: TDateTimePicker
          Left = 177
          Top = 37
          Width = 137
          Height = 23
          Date = 45294.000000000000000000
          Time = 0.792888969910563900
          TabOrder = 1
        end
        object RadioButton1: TRadioButton
          Left = 186
          Top = 87
          Width = 56
          Height = 17
          Caption = 'Male'
          TabOrder = 2
        end
        object RadioButton2: TRadioButton
          Left = 248
          Top = 87
          Width = 66
          Height = 17
          Caption = 'Femelle'
          TabOrder = 3
        end
        object Edit2: TEdit
          Left = 16
          Top = 81
          Width = 146
          Height = 23
          TabOrder = 4
        end
        object LabeledEdit1: TLabeledEdit
          Left = 337
          Top = 37
          Width = 136
          Height = 23
          EditLabel.Width = 90
          EditLabel.Height = 15
          EditLabel.Caption = 'N'#176'Carte National'
          TabOrder = 5
          Text = ''
        end
      end
      object ScrollBox1: TScrollBox
        Left = 757
        Top = 3
        Width = 349
        Height = 562
        BevelInner = bvLowered
        TabOrder = 2
        object Label15: TLabel
          Left = 143
          Top = 63
          Width = 27
          Height = 15
          Caption = 'Nom'
          FocusControl = DBEdit4
        end
        object Label16: TLabel
          Left = 143
          Top = 115
          Width = 42
          Height = 15
          Caption = 'Prenom'
          FocusControl = DBEdit7
        end
        object Label18: TLabel
          Left = 143
          Top = 165
          Width = 18
          Height = 15
          Caption = 'Sex'
        end
        object Label20: TLabel
          Left = 8
          Top = 210
          Width = 41
          Height = 15
          Caption = 'Adresse'
          FocusControl = DBEdit10
        end
        object Label19: TLabel
          Left = 7
          Top = 271
          Width = 90
          Height = 15
          Caption = 'N'#176'Carte National'
          FocusControl = DBEdit11
        end
        object Label21: TLabel
          Left = 148
          Top = 271
          Width = 94
          Height = 15
          Caption = 'Date de naissance'
        end
        object Label22: TLabel
          Left = 46
          Top = 439
          Width = 57
          Height = 15
          Caption = 'Formulaire'
        end
        object Label24: TLabel
          Left = 43
          Top = 751
          Width = 96
          Height = 15
          Caption = 'Acte de Naissance'
        end
        object Label25: TLabel
          Left = 3
          Top = 946
          Width = 87
          Height = 15
          Caption = '                             '
        end
        object Label27: TLabel
          Left = 6
          Top = 326
          Width = 93
          Height = 15
          Caption = 'Date d'#39'inscription'
        end
        object Label28: TLabel
          Left = 156
          Top = 327
          Width = 32
          Height = 15
          Caption = 'Status'
          FocusControl = DBEdit11
        end
        object save_btn: TSpeedButton
          Left = 167
          Top = 1065
          Width = 131
          Height = 33
          Caption = 'Enregister'
          Visible = False
          OnClick = save_btnClick
        end
        object Label1: TLabel
          Left = 3
          Top = 1111
          Width = 96
          Height = 15
          Caption = 'Acte de Naissance'
        end
        object annuler_btn: TSpeedButton
          Left = 30
          Top = 1065
          Width = 131
          Height = 33
          Caption = 'Annuler'
          Visible = False
          OnClick = annuler_btnClick
        end
        object DBImage4: TDBImage
          Left = 8
          Top = 75
          Width = 126
          Height = 125
          DataField = 'PHOTO'
          DataSource = EtudiantQueryDataSource
          Stretch = True
          TabOrder = 0
        end
        object DBEdit4: TDBEdit
          Left = 140
          Top = 84
          Width = 173
          Height = 23
          DataField = 'NOM'
          DataSource = EtudiantQueryDataSource
          TabOrder = 1
        end
        object DBEdit7: TDBEdit
          Left = 143
          Top = 136
          Width = 170
          Height = 23
          DataField = 'PRENOM'
          DataSource = EtudiantQueryDataSource
          TabOrder = 2
        end
        object GroupBox2: TGroupBox
          Left = 3
          Top = 3
          Width = 320
          Height = 49
          Caption = 'Num d'#39'inscription'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object num_ins_labl: TLabel
            Left = 126
            Top = 20
            Width = 25
            Height = 17
            Caption = 'num'
            FocusControl = DBEdit10
          end
        end
        object da: TDBEdit
          Left = 6
          Top = 233
          Width = 307
          Height = 23
          DataField = 'ADRESSE'
          DataSource = EtudiantQueryDataSource
          TabOrder = 4
        end
        object DBEdit10: TDBEdit
          Left = 140
          Top = 183
          Width = 173
          Height = 23
          DataField = 'SEX'
          DataSource = EtudiantQueryDataSource
          TabOrder = 5
        end
        object DBEdit11: TDBEdit
          Left = 6
          Top = 294
          Width = 139
          Height = 23
          DataField = 'CNI'
          DataSource = EtudiantQueryDataSource
          TabOrder = 6
        end
        object DateTimePicker4: TDateTimePicker
          Left = 152
          Top = 292
          Width = 161
          Height = 23
          Date = 45297.000000000000000000
          Time = 0.119058483796834500
          TabOrder = 7
          OnChange = DateTimePicker4Change
        end
        object DBImage5: TDBImage
          Left = 46
          Top = 460
          Width = 257
          Height = 271
          DataField = 'ACTE_DE_NAISSANCE'
          DataSource = EtudiantQueryDataSource
          Stretch = True
          TabOrder = 8
        end
        object DBImage6: TDBImage
          Left = 43
          Top = 775
          Width = 257
          Height = 271
          DataField = 'ACTE_DE_NAISSANCE'
          DataSource = EtudiantQueryDataSource
          Stretch = True
          TabOrder = 9
        end
        object DateTimePicker3: TDateTimePicker
          Left = 6
          Top = 348
          Width = 144
          Height = 23
          Date = 45297.000000000000000000
          Time = 0.119058483796834500
          TabOrder = 10
          OnChange = DateTimePicker3Change
        end
        object DBEdit8: TDBEdit
          Left = 156
          Top = 348
          Width = 160
          Height = 23
          DataField = 'CNI'
          DataSource = EtudiantQueryDataSource
          TabOrder = 11
        end
        object DBEdit_num_inscri: TDBEdit
          Left = 160
          Top = 20
          Width = 89
          Height = 23
          DataField = 'NUM_INSCRIPTION'
          DataSource = EtudiantQueryDataSource
          TabOrder = 12
          Visible = False
        end
        object DB_stag_id: TDBEdit
          Left = 16
          Top = 20
          Width = 89
          Height = 23
          DataField = 'ID_STAGIAIRE'
          DataSource = EtudiantQueryDataSource
          TabOrder = 13
          Visible = False
        end
        object DBEdit1: TDBEdit
          Left = 3
          Top = 49
          Width = 110
          Height = 23
          DataField = 'DDN'
          DataSource = EtudiantQueryDataSource
          TabOrder = 14
          Visible = False
        end
        object DBEdit_ddn: TDBEdit
          Left = 119
          Top = 46
          Width = 110
          Height = 23
          DataField = 'DATE_INSCRIPTION'
          DataSource = EtudiantQueryDataSource
          TabOrder = 15
          Visible = False
        end
        object db_idpv: TDBLabeledEdit
          Left = 161
          Top = 400
          Width = 152
          Height = 23
          DataField = 'ID_PV'
          DataSource = EtudiantQueryDataSource
          TabOrder = 16
          EditLabel.Width = 43
          EditLabel.Height = 15
          EditLabel.Caption = 'Id du pv'
          EditLabel.Layout = tlCenter
        end
        object db_codesec: TDBLabeledEdit
          Left = 3
          Top = 400
          Width = 152
          Height = 23
          DataField = 'CODESECTION'
          DataSource = EtudiantQueryDataSource
          TabOrder = 17
          EditLabel.Width = 85
          EditLabel.Height = 15
          EditLabel.Caption = 'Code de section'
          EditLabel.Layout = tlCenter
        end
      end
    end
  end
  object EtudiantQueryDataSource: TDataSource
    DataSet = EtudiantQuery
    Left = 16
    Top = 504
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=<LOCAL>'
      'User_Name=school'
      'Password=0000'
      'DriverID=Ora')
    Connected = True
    Left = 60
    Top = 514
  end
  object EtudiantQuery: TFDQuery
    Active = True
    AggregatesActive = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from stagiaire')
    Left = 160
    Top = 440
  end
  object CustomQuery: TFDQuery
    Connection = FDConnection1
    Left = 228
    Top = 522
  end
end
