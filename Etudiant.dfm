object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Etudiant'
  ClientHeight = 589
  ClientWidth = 1085
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label10: TLabel
    Left = 16
    Top = 85
    Width = 27
    Height = 15
    Caption = 'Nom'
  end
  object Label12: TLabel
    Left = 177
    Top = 120
    Width = 94
    Height = 15
    Caption = 'Date de naissance'
  end
  object PageControl1: TPageControl
    Left = -8
    Top = 0
    Width = 1095
    Height = 593
    ActivePage = TabSheet2
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Label1: TLabel
        Left = 911
        Top = 473
        Width = 70
        Height = 15
        Caption = 'ID_STAGIAIRE'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 172
        Top = 13
        Width = 27
        Height = 15
        Caption = 'Nom'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 169
        Top = 61
        Width = 42
        Height = 15
        Caption = 'Prenom'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 169
        Top = 112
        Width = 94
        Height = 15
        Caption = 'Date de naissance'
      end
      object Label5: TLabel
        Left = 74
        Top = 303
        Width = 19
        Height = 15
        Caption = 'SEX'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 71
        Top = 233
        Width = 19
        Height = 15
        Caption = 'CDI'
        FocusControl = DBEdit6
      end
      object Label7: TLabel
        Left = 18
        Top = 3
        Width = 38
        Height = 15
        Caption = 'PHOTO'
        FocusControl = DBImage1
      end
      object Label8: TLabel
        Left = 551
        Top = 13
        Width = 115
        Height = 15
        Caption = 'ACTE_DE_NAISSANCE'
        FocusControl = DBImage2
      end
      object Label9: TLabel
        Left = 783
        Top = 13
        Width = 71
        Height = 15
        Caption = 'FORMULAIRE'
      end
      object DBEdit1: TDBEdit
        Left = 911
        Top = 494
        Width = 70
        Height = 23
        DataField = 'ID_STAGIAIRE'
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 169
        Top = 34
        Width = 192
        Height = 23
        DataField = 'NOM'
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 169
        Top = 82
        Width = 192
        Height = 23
        DataField = 'PRENOM'
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 82
        Top = 372
        Width = 143
        Height = 23
        DataField = 'SEX'
        TabOrder = 3
      end
      object DBEdit6: TDBEdit
        Left = 71
        Top = 254
        Width = 254
        Height = 23
        DataField = 'CDI'
        TabOrder = 4
      end
      object DBImage1: TDBImage
        Left = 18
        Top = 24
        Width = 145
        Height = 145
        DataField = 'PHOTO'
        Stretch = True
        TabOrder = 5
      end
      object DBImage2: TDBImage
        Left = 551
        Top = 34
        Width = 218
        Height = 271
        DataField = 'ACTE_DE_NAISSANCE'
        Stretch = True
        TabOrder = 6
      end
      object DBNavigator1: TDBNavigator
        Left = 5
        Top = 516
        Width = 320
        Height = 25
        TabOrder = 7
      end
      object DBImage3: TDBImage
        Left = 783
        Top = 34
        Width = 218
        Height = 271
        DataField = 'ACTE_DE_NAISSANCE'
        Stretch = True
        TabOrder = 8
      end
      object DateTimePicker1: TDateTimePicker
        Left = 169
        Top = 133
        Width = 192
        Height = 23
        Date = 45294.000000000000000000
        Time = 0.004480393516132608
        TabOrder = 9
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 371
        Top = 119
        Width = 744
        Height = 441
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object GroupBox1: TGroupBox
        Left = 4
        Top = -1
        Width = 744
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
          Left = 192
          Top = 18
          Width = 94
          Height = 15
          Caption = 'Date de naissance'
        end
        object Label14: TLabel
          Left = 192
          Top = 66
          Width = 18
          Height = 15
          Caption = 'Sex'
        end
        object SpeedButton1: TSpeedButton
          Left = 464
          Top = 40
          Width = 113
          Height = 22
          Caption = 's'
        end
        object search_n: TEdit
          Left = 16
          Top = 37
          Width = 146
          Height = 23
          TabOrder = 0
        end
        object DateTimePicker2: TDateTimePicker
          Left = 192
          Top = 37
          Width = 186
          Height = 23
          Date = 45294.000000000000000000
          Time = 0.792888969910563900
          TabOrder = 1
        end
        object RadioButton1: TRadioButton
          Left = 201
          Top = 87
          Width = 56
          Height = 17
          Caption = 'Male'
          TabOrder = 2
        end
        object RadioButton2: TRadioButton
          Left = 263
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
      end
      object ScrollBox1: TScrollBox
        Left = 754
        Top = 3
        Width = 330
        Height = 557
        TabOrder = 2
        object Label15: TLabel
          Left = 143
          Top = 12
          Width = 27
          Height = 15
          Caption = 'Nom'
          FocusControl = DBEdit4
        end
        object Label16: TLabel
          Left = 143
          Top = 64
          Width = 42
          Height = 15
          Caption = 'Prenom'
          FocusControl = DBEdit7
        end
        object Label17: TLabel
          Left = 145
          Top = 122
          Width = 94
          Height = 15
          Caption = 'Date de naissance'
        end
        object Label18: TLabel
          Left = 8
          Top = 143
          Width = 18
          Height = 15
          Caption = 'Sex'
        end
        object DBImage4: TDBImage
          Left = 11
          Top = 12
          Width = 126
          Height = 125
          DataField = 'PHOTO'
          DataSource = DataSource1
          Stretch = True
          TabOrder = 0
        end
        object DBEdit4: TDBEdit
          Left = 143
          Top = 33
          Width = 167
          Height = 23
          DataField = 'NOM'
          DataSource = DataSource1
          TabOrder = 1
        end
        object DBEdit7: TDBEdit
          Left = 143
          Top = 85
          Width = 170
          Height = 23
          DataField = 'PRENOM'
          DataSource = DataSource1
          TabOrder = 2
        end
        object DateTimePicker3: TDateTimePicker
          Left = 146
          Top = 143
          Width = 171
          Height = 23
          Date = 45294.000000000000000000
          Time = 0.004480393516132608
          TabOrder = 3
        end
        object RadioButton3: TRadioButton
          Left = 7
          Top = 164
          Width = 56
          Height = 17
          Caption = 'Male'
          TabOrder = 4
        end
        object RadioButton4: TRadioButton
          Left = 63
          Top = 164
          Width = 66
          Height = 17
          Caption = 'Femelle'
          TabOrder = 5
        end
        object DBEdit8: TDBEdit
          Left = 119
          Top = 187
          Width = 170
          Height = 23
          DataField = 'DDN'
          DataSource = DataSource1
          TabOrder = 6
          OnChange = DBEdit8Change
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 808
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=<LOCAL>'
      'User_Name=school'
      'Password=0000'
      'DriverID=Ora')
    Connected = True
    Left = 1044
    Top = 2
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from stagiaire')
    Left = 712
  end
end
