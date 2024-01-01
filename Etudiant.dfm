object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Etudiant'
  ClientHeight = 568
  ClientWidth = 1114
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label2: TLabel
    Left = 32
    Top = 3
    Width = 34
    Height = 15
    Caption = 'Label1'
  end
  object PageControl1: TPageControl
    Left = -7
    Top = -1
    Width = 1113
    Height = 569
    ActivePage = List
    TabOrder = 0
    object Etudiant: TTabSheet
      Caption = 'List'
      object Label1: TLabel
        Left = 40
        Top = 35
        Width = 34
        Height = 15
        Caption = 'Label1'
      end
      object Label3: TLabel
        Left = 40
        Top = 83
        Width = 34
        Height = 15
        Caption = 'Label1'
      end
      object Label4: TLabel
        Left = 40
        Top = 155
        Width = 34
        Height = 15
        Caption = 'Label1'
      end
      object Label5: TLabel
        Left = 40
        Top = 203
        Width = 34
        Height = 15
        Caption = 'Label1'
      end
      object Edit1: TEdit
        Left = 40
        Top = 54
        Width = 121
        Height = 23
        TabOrder = 0
        Text = 'Edit1'
      end
      object Save: TButton
        Left = 312
        Top = 80
        Width = 75
        Height = 25
        Caption = 'Save'
        TabOrder = 1
      end
      object Edit3: TEdit
        Left = 40
        Top = 104
        Width = 121
        Height = 23
        TabOrder = 2
        Text = 'Edit1'
      end
      object Edit4: TEdit
        Left = 40
        Top = 176
        Width = 121
        Height = 23
        TabOrder = 3
        Text = 'Edit1'
      end
      object Edit5: TEdit
        Left = 40
        Top = 224
        Width = 121
        Height = 23
        TabOrder = 4
        Text = 'Edit1'
      end
      object Button5: TButton
        Left = 312
        Top = 151
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 5
      end
    end
    object List: TTabSheet
      Caption = 'List'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 3
        Top = 3
        Width = 1105
        Height = 486
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object Button2: TButton
        Left = 3
        Top = 495
        Width = 105
        Height = 41
        Caption = 'Modifier'
        TabOrder = 1
      end
      object Button3: TButton
        Left = 114
        Top = 495
        Width = 105
        Height = 41
        Caption = 'Button1'
        TabOrder = 2
      end
      object Button4: TButton
        Left = 225
        Top = 495
        Width = 105
        Height = 41
        Caption = 'Button1'
        TabOrder = 3
      end
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDAORA.1;Password=0000;User ID=school;Persist Security' +
      ' Info=True'
    Provider = 'MSDAORA.1'
    Left = 1016
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from stagiaire')
    Left = 928
  end
  object ADODataSet1: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 840
  end
end
