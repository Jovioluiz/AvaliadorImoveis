inherited frmBenfeitoriasReprodutivas: TfrmBenfeitoriasReprodutivas
  BorderStyle = bsDialog
  Caption = 'Benfeitorias Reprodutivas'
  ClientHeight = 813
  ClientWidth = 976
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 982
  ExplicitHeight = 842
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo1: TPanel
    Width = 976
    Height = 813
    ExplicitWidth = 976
    ExplicitHeight = 813
    object gbCabecalho: TGroupBox
      Left = 1
      Top = 1
      Width = 974
      Height = 105
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 9
        Top = 18
        Width = 50
        Height = 13
        Caption = 'C'#243'd. Obra'
      end
      object Label2: TLabel
        Left = 598
        Top = 18
        Width = 49
        Height = 13
        Caption = 'Sequencia'
      end
      object Label3: TLabel
        Left = 3
        Top = 48
        Width = 56
        Height = 13
        Caption = 'Propriet'#225'rio'
      end
      object Label4: TLabel
        Left = 3
        Top = 75
        Width = 55
        Height = 13
        Caption = 'Benefici'#225'rio'
      end
      object Label5: TLabel
        Left = 732
        Top = 18
        Width = 54
        Height = 13
        Caption = 'Localiza'#231#227'o'
      end
      object Label6: TLabel
        Left = 638
        Top = 75
        Width = 44
        Height = 13
        Caption = 'N'#186' Laudo'
      end
      object edtNmObra: TEdit
        Left = 126
        Top = 15
        Width = 466
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object edtObra: TEdit
        Left = 64
        Top = 15
        Width = 57
        Height = 21
        TabOrder = 1
        OnChange = edtObraChange
      end
      object edtSequencia: TEdit
        Left = 653
        Top = 15
        Width = 65
        Height = 21
        TabOrder = 2
      end
      object edtNmProprietario: TEdit
        Left = 127
        Top = 45
        Width = 466
        Height = 21
        Enabled = False
        TabOrder = 3
      end
      object edtBeneficiario: TEdit
        Left = 127
        Top = 72
        Width = 466
        Height = 21
        Enabled = False
        TabOrder = 4
      end
      object edtLocalizacao: TEdit
        Left = 792
        Top = 15
        Width = 153
        Height = 21
        TabOrder = 5
      end
      object edtNrLaudo: TEdit
        Left = 688
        Top = 72
        Width = 257
        Height = 21
        TabOrder = 6
      end
      object edtCodProprietario: TEdit
        Left = 65
        Top = 45
        Width = 57
        Height = 21
        TabOrder = 7
      end
      object edtCodBeneficiario: TEdit
        Left = 64
        Top = 72
        Width = 57
        Height = 21
        TabOrder = 8
        OnExit = edtCodBeneficiarioExit
      end
    end
    object grBenfeitorias: TGroupBox
      Left = 1
      Top = 106
      Width = 974
      Height = 105
      Align = alTop
      Caption = 'Benfeitorias'
      TabOrder = 1
      object Label7: TLabel
        Left = 25
        Top = 29
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label8: TLabel
        Left = 609
        Top = 29
        Width = 39
        Height = 13
        Caption = 'Unidade'
      end
      object Label9: TLabel
        Left = 30
        Top = 65
        Width = 28
        Height = 13
        Caption = 'Idade'
      end
      object Label10: TLabel
        Left = 283
        Top = 65
        Width = 56
        Height = 13
        Caption = 'Tipo Cultivo'
      end
      object Label11: TLabel
        Left = 746
        Top = 29
        Width = 56
        Height = 13
        Caption = 'Quantidade'
      end
      object edtCodigoBenfeitoria: TEdit
        Left = 64
        Top = 26
        Width = 57
        Height = 21
        TabOrder = 0
      end
      object edtNmBenfeitoria: TEdit
        Left = 127
        Top = 26
        Width = 466
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object edtUnidade: TEdit
        Left = 654
        Top = 26
        Width = 68
        Height = 21
        TabOrder = 2
      end
      object rgTipoCultivo: TRadioGroup
        Left = 346
        Top = 50
        Width = 247
        Height = 40
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        BiDiMode = bdLeftToRight
        Columns = 3
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Nativo'
          'Tradicional'
          'Tecnificado')
        ParentBiDiMode = False
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 3
      end
      object edtQuantidade: TNumberBox
        Left = 808
        Top = 26
        Width = 137
        Height = 21
        Mode = nbmFloat
        TabOrder = 4
      end
      object btnAdicionar: TButton
        Left = 870
        Top = 58
        Width = 75
        Height = 25
        Caption = 'Adicionar'
        TabOrder = 5
        OnClick = btnAdicionarClick
      end
      object edtIdade: TNumberBox
        Left = 64
        Top = 60
        Width = 121
        Height = 21
        Mode = nbmFloat
        TabOrder = 6
      end
    end
    object gbGrid: TGroupBox
      Left = 1
      Top = 211
      Width = 974
      Height = 272
      Align = alTop
      TabOrder = 2
      object gridBenfeitorias: TDBGrid
        Left = 2
        Top = 15
        Width = 970
        Height = 255
        Align = alClient
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = gridBenfeitoriasDblClick
      end
    end
    object gbFatores: TGroupBox
      Left = 1
      Top = 483
      Width = 974
      Height = 260
      Align = alTop
      Caption = 'Fatores de Homogeneiza'#231#227'o'
      TabOrder = 3
      object rgAcessibilidade: TRadioGroup
        Left = 2
        Top = 15
        Width = 970
        Height = 59
        Align = alTop
        Caption = 'Acessibilidade'
        Columns = 5
        Items.Strings = (
          #211'tima'
          'Muito Boa'
          'Boa'
          'Regular'
          'Ruim')
        TabOrder = 0
      end
      object gbDistancia: TGroupBox
        Left = 2
        Top = 74
        Width = 970
        Height = 103
        Align = alTop
        TabOrder = 1
        object Label12: TLabel
          Left = 7
          Top = 6
          Width = 287
          Height = 13
          Caption = 'Dist'#226'ncia ao centro consumidor mais pr'#243'ximo considerada a '
        end
        object edtCentroConsumidor: TEdit
          Left = 308
          Top = 6
          Width = 77
          Height = 21
          TabOrder = 0
        end
        object edtNmCentroConsumidor: TEdit
          Left = 391
          Top = 6
          Width = 474
          Height = 21
          Enabled = False
          TabOrder = 1
        end
        object rgDistanciaCentro: TRadioGroup
          Left = 3
          Top = 31
          Width = 964
          Height = 62
          Columns = 4
          Items.Strings = (
            'Muito Pr'#243'ximo (At'#233' 5 Km)'
            'Pr'#243'ximo (de 6 a 15 Km)'
            'Distante (de 16 a 30 Km)'
            'Muito Distante (acima de 30 Km)')
          TabOrder = 2
        end
      end
      object GroupBox1: TGroupBox
        Left = 2
        Top = 177
        Width = 970
        Height = 105
        Align = alTop
        Caption = 'N'#237'vel de Manejo'
        TabOrder = 2
        object rgNivelManejo: TRadioGroup
          Left = 2
          Top = 15
          Width = 966
          Height = 58
          Align = alTop
          Columns = 5
          DoubleBuffered = False
          Items.Strings = (
            'Avan'#231'ado'
            'Semi-Avan'#231'ado'
            'Tradicional'
            'Primitivo'
            'Improdutivo')
          ParentDoubleBuffered = False
          TabOrder = 0
        end
      end
    end
    object btnAvTerras: TButton
      Left = 768
      Top = 771
      Width = 97
      Height = 25
      Caption = 'Avalia'#231#227'o Terras'
      TabOrder = 4
      OnClick = btnAvTerrasClick
    end
    object btnCancelar: TButton
      Left = 871
      Top = 771
      Width = 97
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 5
      OnClick = btnCancelarClick
    end
  end
end
