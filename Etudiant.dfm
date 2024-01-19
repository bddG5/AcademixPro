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
  object Label4: TLabel
    Left = 668
    Top = 235
    Width = 71
    Height = 15
    Caption = 'Note examen'
  end
  object Label42: TLabel
    Left = 930
    Top = 243
    Width = 90
    Height = 15
    Caption = 'Note du controle'
  end
  object PageControl1: TPageControl
    Left = 0
    Top = -6
    Width = 1111
    Height = 601
    ActivePage = TabSheet3
    TabOrder = 0
    object TabSheet3: TTabSheet
      Caption = 'List'
      ImageIndex = 1
      object SpeedButton6: TSpeedButton
        Left = 630
        Top = 7
        Width = 113
        Height = 30
        Caption = 'Ajouter'
        Transparent = False
        OnClick = SpeedButton2Click
      end
      object SpeedButton7: TSpeedButton
        Left = 630
        Top = 43
        Width = 113
        Height = 30
        Caption = 'Modifier'
        Transparent = False
        OnClick = SpeedButton7Click
      end
      object SpeedButton8: TSpeedButton
        Left = 630
        Top = 79
        Width = 113
        Height = 33
        Caption = 'Supprimer'
        Transparent = False
        OnClick = SpeedButton4Click
      end
      object SpeedButton9: TSpeedButton
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
      object GroupBox5: TGroupBox
        Left = 3
        Top = 2
        Width = 501
        Height = 114
        Caption = 'Recherche'
        TabOrder = 1
        object Label7: TLabel
          Left = 16
          Top = 18
          Width = 27
          Height = 15
          Caption = 'Nom'
        end
        object Label8: TLabel
          Left = 16
          Top = 66
          Width = 42
          Height = 15
          Caption = 'Prenom'
        end
        object Label9: TLabel
          Left = 177
          Top = 18
          Width = 94
          Height = 15
          Caption = 'Date de naissance'
        end
        object Label10: TLabel
          Left = 177
          Top = 66
          Width = 18
          Height = 15
          Caption = 'Sex'
        end
        object SpeedButton10: TSpeedButton
          Left = 337
          Top = 73
          Width = 136
          Height = 30
          Caption = 'Chercher'
        end
        object Edit1: TEdit
          Left = 16
          Top = 37
          Width = 146
          Height = 23
          TabOrder = 0
        end
        object DateTimePicker1: TDateTimePicker
          Left = 177
          Top = 37
          Width = 137
          Height = 23
          Date = 45294.000000000000000000
          Time = 0.792888969910563900
          TabOrder = 1
        end
        object RadioButton3: TRadioButton
          Left = 186
          Top = 87
          Width = 56
          Height = 17
          Caption = 'Male'
          TabOrder = 2
        end
        object RadioButton4: TRadioButton
          Left = 248
          Top = 87
          Width = 66
          Height = 17
          Caption = 'Femelle'
          TabOrder = 3
        end
        object Edit3: TEdit
          Left = 16
          Top = 81
          Width = 146
          Height = 23
          TabOrder = 4
        end
        object LabeledEdit2: TLabeledEdit
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
      object ScrollBox2: TScrollBox
        Left = 757
        Top = 3
        Width = 349
        Height = 562
        BevelInner = bvLowered
        TabOrder = 2
        object Label12: TLabel
          Left = 143
          Top = 63
          Width = 27
          Height = 15
          Caption = 'Nom'
          FocusControl = DBEdit5
        end
        object Label17: TLabel
          Left = 143
          Top = 115
          Width = 42
          Height = 15
          Caption = 'Prenom'
          FocusControl = DBEdit6
        end
        object Label23: TLabel
          Left = 143
          Top = 165
          Width = 18
          Height = 15
          Caption = 'Sex'
        end
        object Label26: TLabel
          Left = 8
          Top = 210
          Width = 41
          Height = 15
          Caption = 'Adresse'
          FocusControl = db_sex
        end
        object Label29: TLabel
          Left = 7
          Top = 271
          Width = 90
          Height = 15
          Caption = 'N'#176'Carte National'
          FocusControl = DBEdit13
        end
        object Label30: TLabel
          Left = 148
          Top = 271
          Width = 94
          Height = 15
          Caption = 'Date de naissance'
        end
        object Label31: TLabel
          Left = 46
          Top = 439
          Width = 57
          Height = 15
          Caption = 'Formulaire'
        end
        object Label32: TLabel
          Left = 43
          Top = 751
          Width = 96
          Height = 15
          Caption = 'Acte de Naissance'
        end
        object Label33: TLabel
          Left = 3
          Top = 946
          Width = 87
          Height = 15
          Caption = '                             '
        end
        object Label34: TLabel
          Left = 6
          Top = 326
          Width = 93
          Height = 15
          Caption = 'Date d'#39'inscription'
        end
        object Label35: TLabel
          Left = 156
          Top = 327
          Width = 32
          Height = 15
          Caption = 'Status'
          FocusControl = DBEdit13
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
        object Label36: TLabel
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
        object DBImage1: TDBImage
          Left = 8
          Top = 75
          Width = 126
          Height = 125
          DataField = 'PHOTO'
          DataSource = EtudiantQueryDataSource
          Stretch = True
          TabOrder = 0
          OnClick = DBImage4Click
        end
        object DBEdit5: TDBEdit
          Left = 140
          Top = 84
          Width = 173
          Height = 23
          DataField = 'NOM'
          DataSource = EtudiantQueryDataSource
          TabOrder = 1
        end
        object DBEdit6: TDBEdit
          Left = 143
          Top = 136
          Width = 170
          Height = 23
          DataField = 'PRENOM'
          DataSource = EtudiantQueryDataSource
          TabOrder = 2
        end
        object GroupBox6: TGroupBox
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
            FocusControl = db_sex
          end
        end
        object DBEdit9: TDBEdit
          Left = 6
          Top = 233
          Width = 307
          Height = 23
          DataField = 'ADRESSE'
          DataSource = EtudiantQueryDataSource
          TabOrder = 4
        end
        object db_sex: TDBEdit
          Left = 68
          Top = 206
          Width = 173
          Height = 23
          DataField = 'SEX'
          DataSource = EtudiantQueryDataSource
          TabOrder = 5
          Visible = False
        end
        object DBEdit13: TDBEdit
          Left = 6
          Top = 294
          Width = 139
          Height = 23
          DataField = 'CNI'
          DataSource = EtudiantQueryDataSource
          TabOrder = 6
        end
        object DateTimePicker5: TDateTimePicker
          Left = 152
          Top = 292
          Width = 161
          Height = 23
          Date = 45297.000000000000000000
          Time = 0.119058483796834500
          TabOrder = 7
          OnChange = DateTimePicker4Change
        end
        object DBImage2: TDBImage
          Left = 46
          Top = 460
          Width = 257
          Height = 271
          DataField = 'ACTE_DE_NAISSANCE'
          DataSource = EtudiantQueryDataSource
          Stretch = True
          TabOrder = 8
          OnClick = DBImage5Click
        end
        object DBImage3: TDBImage
          Left = 43
          Top = 775
          Width = 257
          Height = 271
          DataField = 'ACTE_DE_NAISSANCE'
          DataSource = EtudiantQueryDataSource
          Stretch = True
          TabOrder = 9
          OnClick = DBImage6Click
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
        object DBEdit14: TDBEdit
          Left = 156
          Top = 348
          Width = 160
          Height = 23
          DataField = 'STATUT'
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
        object db_ddn: TDBEdit
          Left = 3
          Top = 49
          Width = 110
          Height = 23
          DataField = 'DDN'
          DataSource = EtudiantQueryDataSource
          TabOrder = 14
          Visible = False
        end
        object db_dateInscri: TDBEdit
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
        object ComboBox1: TComboBox
          Left = 140
          Top = 181
          Width = 173
          Height = 23
          TabOrder = 18
          Text = 'sex'
          OnChange = ComboBox1Change
          Items.Strings = (
            'male'
            'femelle')
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Resultat'
      ImageIndex = 1
      object DBGrid4: TDBGrid
        Left = 3
        Top = 18
        Width = 711
        Height = 270
        DataSource = ResultatMatiereDataSource
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object DBGrid5: TDBGrid
        Left = 386
        Top = 300
        Width = 714
        Height = 268
        DataSource = ResultatSemstreDataSource
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object GroupBox7: TGroupBox
        Left = 720
        Top = 18
        Width = 380
        Height = 270
        TabOrder = 2
        object Label38: TLabel
          Left = 17
          Top = 72
          Width = 90
          Height = 15
          Caption = 'Note du controle'
        end
        object Label39: TLabel
          Left = 17
          Top = 128
          Width = 71
          Height = 15
          Caption = 'Note examen'
        end
        object Label40: TLabel
          Left = 17
          Top = 187
          Width = 80
          Height = 15
          Caption = 'Moyen matiere'
        end
        object Label41: TLabel
          Left = 17
          Top = 8
          Width = 40
          Height = 15
          Caption = 'Matiere'
        end
        object Button8: TButton
          Left = 262
          Top = 17
          Width = 107
          Height = 25
          Caption = 'Ajouter'
          TabOrder = 0
        end
        object Button9: TButton
          Left = 262
          Top = 110
          Width = 107
          Height = 25
          Caption = 'Modifier'
          TabOrder = 1
        end
        object DBEdit19: TDBEdit
          Left = 17
          Top = 93
          Width = 153
          Height = 23
          DataField = 'NOTE1'
          TabOrder = 2
        end
        object DBEdit20: TDBEdit
          Left = 17
          Top = 149
          Width = 153
          Height = 23
          DataField = 'NOTE2'
          TabOrder = 3
        end
        object DBEdit21: TDBEdit
          Left = 17
          Top = 207
          Width = 153
          Height = 23
          DataField = 'MOY'
          TabOrder = 4
        end
        object formation_matiere: TComboBox
          Left = 17
          Top = 29
          Width = 152
          Height = 23
          TabOrder = 5
          Text = 'formation_matiere'
          OnChange = formation_matiereChange
        end
        object Button10: TButton
          Left = 262
          Top = 48
          Width = 107
          Height = 25
          Caption = 'Afficher'
          TabOrder = 6
          OnClick = Button3Click
        end
        object Button11: TButton
          Left = 262
          Top = 79
          Width = 107
          Height = 25
          Caption = 'Afficher tout'
          TabOrder = 7
          OnClick = Button3Click
        end
      end
      object GroupBox8: TGroupBox
        Left = 0
        Top = 298
        Width = 380
        Height = 270
        TabOrder = 3
        object Button12: TButton
          Left = 14
          Top = 27
          Width = 131
          Height = 25
          Caption = 'Finaliser le semsetre'
          TabOrder = 0
        end
        object Button13: TButton
          Left = 14
          Top = 58
          Width = 131
          Height = 25
          Caption = 'Document'
          TabOrder = 1
        end
        object Button14: TButton
          Left = 14
          Top = 89
          Width = 131
          Height = 25
          Caption = 'Modifier'
          TabOrder = 2
        end
      end
      object coef: TDBEdit
        Left = 900
        Top = 110
        Width = 49
        Height = 23
        DataField = 'COEFFICENT'
        DataSource = MatiereDataSource
        TabOrder = 4
      end
    end
  end
  object EtudiantQueryDataSource: TDataSource
    AutoEdit = False
    DataSet = EtudiantQuery
    OnDataChange = EtudiantQueryDataSourceDataChange
    Left = 424
    Top = 65520
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=<LOCAL>'
      'User_Name=school'
      'Password=0000'
      'DriverID=Ora')
    Connected = True
    Left = 580
    Top = 65522
  end
  object EtudiantQuery: TFDQuery
    Active = True
    AggregatesActive = True
    Connection = FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    SQL.Strings = (
      'select * from stagiaire')
    Left = 328
    Top = 65520
  end
  object CustomQuery: TFDQuery
    Connection = FDConnection1
    Left = 132
    Top = 65522
  end
  object OpenPictureDialog1: TOpenPictureDialog
    DefaultExt = '*.jpg'
    FilterIndex = 0
    Options = [ofHideReadOnly, ofExtensionDifferent, ofEnableSizing]
    Left = 212
    Top = 65522
  end
  object ResultatMatiereQuery: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from resultat_matiere')
    Left = 692
    Top = 65522
  end
  object ResultatMatiereDataSource: TDataSource
    DataSet = ResultatMatiereQuery
    Left = 800
    Top = 65528
  end
  object MatiereDataSource: TDataSource
    DataSet = MatiereQuery
    Left = 116
    Top = 178
  end
  object MatiereQuery: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from matiere')
    Left = 188
    Top = 186
  end
  object ResultatSemstreQuery: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from resultats_semestre')
    Left = 444
    Top = 458
  end
  object ResultatSemstreDataSource: TDataSource
    DataSet = ResultatSemstreQuery
    Left = 440
    Top = 520
  end
end
