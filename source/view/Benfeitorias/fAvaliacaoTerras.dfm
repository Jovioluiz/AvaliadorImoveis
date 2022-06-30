inherited frmAvaliacaoTerras: TfrmAvaliacaoTerras
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Avalia'#231#227'o Terras'
  ClientHeight = 446
  ClientWidth = 727
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 733
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo1: TPanel
    Width = 727
    Height = 446
    ExplicitWidth = 727
    ExplicitHeight = 446
    object pnlBaixo: TPanel
      Left = 1
      Top = 143
      Width = 725
      Height = 302
      Align = alBottom
      TabOrder = 0
      object gbfh: TGroupBox
        Left = 1
        Top = 1
        Width = 723
        Height = 300
        Align = alClient
        Caption = 'Fator Homogeiniza'#231#227'o'
        TabOrder = 0
        object Label5: TLabel
          Left = 7
          Top = 39
          Width = 129
          Height = 13
          Caption = 'FH = (FA) x (FM) x (FD) = '
        end
        object Label6: TLabel
          Left = 554
          Top = 39
          Width = 8
          Height = 13
          Caption = '='
        end
        object Label7: TLabel
          Left = 50
          Top = 70
          Width = 86
          Height = 13
          Caption = #193'rea Total em ha:'
        end
        object Label8: TLabel
          Left = 101
          Top = 96
          Width = 35
          Height = 13
          Caption = 'Classe:'
        end
        object Label9: TLabel
          Left = 287
          Top = 96
          Width = 42
          Height = 13
          Caption = #193'rea ha:'
        end
        object Label10: TLabel
          Left = 435
          Top = 17
          Width = 13
          Height = 13
          Caption = 'FD'
        end
        object Label11: TLabel
          Left = 296
          Top = 17
          Width = 14
          Height = 13
          Caption = 'FM'
        end
        object Label12: TLabel
          Left = 415
          Top = 39
          Width = 6
          Height = 13
          Caption = 'x'
        end
        object Label13: TLabel
          Left = 273
          Top = 39
          Width = 6
          Height = 13
          Caption = 'x'
        end
        object grid: TDBGrid
          Left = 2
          Top = 128
          Width = 719
          Height = 170
          Align = alBottom
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 8
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = gridDblClick
        end
        object btnAdicionar: TButton
          Left = 645
          Top = 97
          Width = 75
          Height = 25
          Caption = 'Adicionar'
          TabOrder = 7
          OnClick = btnAdicionarClick
        end
        object cbClasse: TComboBox
          Left = 142
          Top = 94
          Width = 121
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 5
          Items.Strings = (
            'I'
            'II'
            'III'
            'IV'
            'V'
            'VI'
            'VII'
            'VII')
        end
        object edtAreaClasse: TNumberBox
          Left = 340
          Top = 94
          Width = 121
          Height = 21
          Decimal = 4
          Mode = nbmFloat
          TabOrder = 6
          NegativeValueColor = clRed
        end
        object edtFatorHomogeinizacao: TNumberBox
          Left = 568
          Top = 36
          Width = 121
          Height = 21
          Mode = nbmFloat
          ReadOnly = True
          TabOrder = 3
        end
        object edtFD: TNumberBox
          Left = 427
          Top = 36
          Width = 121
          Height = 21
          Mode = nbmFloat
          TabOrder = 2
          OnChange = edtFDChange
        end
        object edtFM: TNumberBox
          Left = 287
          Top = 36
          Width = 121
          Height = 21
          Mode = nbmFloat
          TabOrder = 1
          OnChange = edtFMChange
        end
        object edtFA: TNumberBox
          Left = 142
          Top = 36
          Width = 121
          Height = 21
          Mode = nbmFloat
          TabOrder = 0
          OnChange = edtFAChange
        end
        object edtAreaTotal: TNumberBox
          Left = 142
          Top = 67
          Width = 122
          Height = 21
          Decimal = 4
          Mode = nbmFloat
          TabOrder = 4
        end
      end
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 725
      Height = 142
      Align = alClient
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 61
        Width = 84
        Height = 13
        Caption = 'Objeto do Laudo:'
      end
      object Label2: TLabel
        Left = 35
        Top = 101
        Width = 56
        Height = 13
        Caption = 'Atribuido a:'
      end
      object Label3: TLabel
        Left = 479
        Top = 101
        Width = 73
        Height = 13
        Caption = 'N'#250'mero Laudo:'
      end
      object Label4: TLabel
        Left = 8
        Top = 21
        Width = 75
        Height = 13
        Caption = 'Num. Processo:'
      end
      object edtAtribuido: TEdit
        Left = 98
        Top = 98
        Width = 375
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
      end
      object edtNrLaudo: TEdit
        Left = 558
        Top = 98
        Width = 155
        Height = 21
        TabOrder = 3
      end
      object edtObjLaudo: TEdit
        Left = 98
        Top = 58
        Width = 619
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
      end
      object edtNumProcesso: TEdit
        Left = 98
        Top = 18
        Width = 111
        Height = 21
        TabOrder = 0
      end
    end
  end
end
