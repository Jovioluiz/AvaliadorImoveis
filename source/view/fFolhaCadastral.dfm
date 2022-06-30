object frmFolhaCadastral: TfrmFolhaCadastral
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Folha Cadastral'
  ClientHeight = 738
  ClientWidth = 1195
  Color = clBtnFace
  ParentFont = True
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 1195
    Height = 738
    Align = alClient
    TabOrder = 0
    object pcFundo: TPageControl
      Left = 1
      Top = 1
      Width = 1193
      Height = 736
      ActivePage = tbsCabecalho
      Align = alClient
      TabOrder = 0
      object tbsCabecalho: TTabSheet
        Caption = 'Dados do Propriet'#225'rio/Ocupante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clDefault
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        object pnlFundoDadosProp: TPanel
          Left = 0
          Top = 0
          Width = 1185
          Height = 708
          Align = alClient
          TabOrder = 0
          object Label1: TLabel
            Left = 1
            Top = 1
            Width = 1183
            Height = 19
            Align = alTop
            Alignment = taCenter
            Caption = 'Dados do Propriet'#225'rio/Ocupante'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clDefault
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 228
          end
          object pnlEstadoCivil: TPanel
            Left = 1
            Top = 264
            Width = 1183
            Height = 170
            Align = alTop
            TabOrder = 0
            object gbEstadoCivil: TGroupBox
              Left = 1
              Top = 1
              Width = 1181
              Height = 168
              Align = alClient
              Caption = 'Estado Civil'
              TabOrder = 0
              object Label13: TLabel
                Left = 330
                Top = 22
                Width = 71
                Height = 16
                Caption = 'Certid'#227'o N'#186':'
              end
              object Label14: TLabel
                Left = 553
                Top = 22
                Width = 42
                Height = 16
                Caption = 'Folhas:'
              end
              object Label15: TLabel
                Left = 746
                Top = 22
                Width = 32
                Height = 16
                Caption = 'Livro:'
              end
              object Label16: TLabel
                Left = 927
                Top = 22
                Width = 51
                Height = 16
                Caption = 'Cart'#243'rio:'
              end
              object Label17: TLabel
                Left = 330
                Top = 52
                Width = 112
                Height = 16
                Caption = 'Senten'#231'a Autos N'#186':'
              end
              object Label18: TLabel
                Left = 745
                Top = 52
                Width = 33
                Height = 16
                Caption = 'Juizo:'
              end
              object Label19: TLabel
                Left = 945
                Top = 52
                Width = 31
                Height = 16
                Caption = 'Data:'
              end
              object Label28: TLabel
                Left = 19
                Top = 22
                Width = 70
                Height = 16
                Caption = 'Estado Civil:'
              end
              object lblUniaoEstavel: TLabel
                Left = 8
                Top = 52
                Width = 81
                Height = 16
                Caption = 'Uni'#227'o Est'#225'vel:'
                Visible = False
              end
              object edtNumeroCertidao: TEdit
                Left = 407
                Top = 19
                Width = 121
                Height = 24
                CharCase = ecUpperCase
                Enabled = False
                TabOrder = 1
              end
              object edtFolhas: TEdit
                Left = 601
                Top = 19
                Width = 121
                Height = 24
                CharCase = ecUpperCase
                Enabled = False
                TabOrder = 2
              end
              object edtLivro: TEdit
                Left = 793
                Top = 19
                Width = 121
                Height = 24
                CharCase = ecUpperCase
                Enabled = False
                TabOrder = 3
              end
              object edtCartorio: TEdit
                Left = 984
                Top = 19
                Width = 181
                Height = 24
                CharCase = ecUpperCase
                Enabled = False
                TabOrder = 4
              end
              object edtNumeroSentenca: TEdit
                Left = 448
                Top = 48
                Width = 274
                Height = 24
                CharCase = ecUpperCase
                Enabled = False
                TabOrder = 6
              end
              object edtJuizo: TEdit
                Left = 793
                Top = 48
                Width = 121
                Height = 24
                CharCase = ecUpperCase
                Enabled = False
                TabOrder = 7
              end
              object gbPacto: TGroupBox
                Left = 2
                Top = 85
                Width = 1177
                Height = 81
                Align = alBottom
                Caption = 'Pacto Antenupcial'
                TabOrder = 8
                object Label20: TLabel
                  Left = 17
                  Top = 41
                  Width = 71
                  Height = 16
                  Caption = 'Certid'#227'o N'#186':'
                end
                object Label21: TLabel
                  Left = 238
                  Top = 41
                  Width = 42
                  Height = 16
                  Caption = 'Folhas:'
                end
                object Label22: TLabel
                  Left = 425
                  Top = 41
                  Width = 32
                  Height = 16
                  Caption = 'Livro:'
                end
                object Label23: TLabel
                  Left = 599
                  Top = 41
                  Width = 51
                  Height = 16
                  Caption = 'Cart'#243'rio:'
                end
                object Label24: TLabel
                  Left = 945
                  Top = 41
                  Width = 31
                  Height = 16
                  Caption = 'Data:'
                end
                object chkPactoAntenupcial: TCheckBox
                  Left = 17
                  Top = 17
                  Width = 167
                  Height = 17
                  Caption = 'Possui Pacto Antenupcial'
                  TabOrder = 0
                  OnClick = chkPactoAntenupcialClick
                end
                object edtCertidaoPacto: TEdit
                  Left = 94
                  Top = 37
                  Width = 131
                  Height = 24
                  CharCase = ecUpperCase
                  Enabled = False
                  TabOrder = 1
                end
                object edtFolhasPacto: TEdit
                  Left = 286
                  Top = 37
                  Width = 125
                  Height = 24
                  CharCase = ecUpperCase
                  Enabled = False
                  TabOrder = 2
                end
                object edtLivroPacto: TEdit
                  Left = 463
                  Top = 37
                  Width = 121
                  Height = 24
                  CharCase = ecUpperCase
                  Enabled = False
                  TabOrder = 3
                end
                object edtCartorioPacto: TEdit
                  Left = 656
                  Top = 37
                  Width = 235
                  Height = 24
                  CharCase = ecUpperCase
                  Enabled = False
                  TabOrder = 4
                end
                object edtDataPacto: TDateTimePicker
                  Left = 982
                  Top = 40
                  Width = 181
                  Height = 24
                  Date = 44707.000000000000000000
                  Time = 0.872174039352103100
                  TabOrder = 5
                end
              end
              object cblistEstadosCivis: TComboBox
                Left = 95
                Top = 19
                Width = 218
                Height = 22
                Style = csOwnerDrawFixed
                TabOrder = 0
                OnChange = cblistEstadosCivisChange
              end
              object edtData: TDateTimePicker
                Left = 984
                Top = 49
                Width = 181
                Height = 24
                Date = 44707.000000000000000000
                Time = 0.871829629628337000
                TabOrder = 9
                OnExit = edtDataExit
              end
              object edtUniaoEstavel: TEdit
                Left = 95
                Top = 49
                Width = 218
                Height = 24
                TabOrder = 5
                Visible = False
              end
            end
          end
          object pnlDadosProprietario: TPanel
            Left = 1
            Top = 83
            Width = 1183
            Height = 181
            Align = alTop
            TabOrder = 1
            OnExit = pnlDadosProprietarioExit
            object gbDadosProprietario: TGroupBox
              Left = 1
              Top = 1
              Width = 1181
              Height = 179
              Align = alClient
              Caption = 'Dados Propriet'#225'rio'
              TabOrder = 0
              object Label10: TLabel
                Left = 866
                Top = 87
                Width = 100
                Height = 16
                Caption = 'Org'#227'o Expedidor:'
              end
              object Label11: TLabel
                Left = 30
                Top = 115
                Width = 59
                Height = 16
                Caption = 'Nome Pai:'
              end
              object Label12: TLabel
                Left = 610
                Top = 115
                Width = 66
                Height = 16
                Caption = 'Nome M'#227'e:'
              end
              object Label2: TLabel
                Left = 51
                Top = 29
                Width = 38
                Height = 16
                Caption = 'Nome:'
              end
              object Label3: TLabel
                Left = 865
                Top = 30
                Width = 101
                Height = 16
                Caption = 'Data Nascimento:'
              end
              object Label4: TLabel
                Left = 12
                Top = 59
                Width = 77
                Height = 16
                Caption = 'Naturalidade:'
              end
              object Label5: TLabel
                Left = 656
                Top = 59
                Width = 20
                Height = 16
                Caption = 'UF:'
              end
              object Label6: TLabel
                Left = 909
                Top = 60
                Width = 57
                Height = 16
                Caption = 'Profiss'#227'o:'
              end
              object Label7: TLabel
                Left = 29
                Top = 87
                Width = 60
                Height = 16
                Caption = 'CPF/CNPJ:'
              end
              object Label8: TLabel
                Left = 639
                Top = 87
                Width = 37
                Height = 16
                Caption = 'RG/IE:'
              end
              object Label9: TLabel
                Left = 315
                Top = 87
                Width = 98
                Height = 16
                Caption = 'Tipo Documento:'
              end
              object Label49: TLabel
                Left = 635
                Top = 146
                Width = 41
                Height = 16
                Caption = 'E-mail:'
              end
              object cbTpDocumento: TComboBox
                Left = 419
                Top = 84
                Width = 206
                Height = 22
                Style = csOwnerDrawFixed
                TabOrder = 7
              end
              object edtCodCidadeNatural: TEdit
                Left = 96
                Top = 56
                Width = 54
                Height = 24
                NumbersOnly = True
                TabOrder = 2
                OnChange = edtCodCidadeNaturalChange
              end
              object edtCpfCnpj: TEdit
                Left = 96
                Top = 84
                Width = 195
                Height = 24
                TabOrder = 6
              end
              object edtNmCidadeNatural: TEdit
                Left = 162
                Top = 56
                Width = 463
                Height = 24
                Enabled = False
                TabOrder = 3
              end
              object edtNmMae: TEdit
                Left = 682
                Top = 115
                Width = 483
                Height = 24
                CharCase = ecUpperCase
                TabOrder = 11
              end
              object edtNmPai: TEdit
                Left = 95
                Top = 112
                Width = 459
                Height = 24
                CharCase = ecUpperCase
                TabOrder = 10
              end
              object edtNome: TEdit
                Left = 95
                Top = 26
                Width = 749
                Height = 24
                CharCase = ecUpperCase
                TabOrder = 0
              end
              object edtOrgaoExpedidor: TEdit
                Left = 984
                Top = 84
                Width = 181
                Height = 24
                CharCase = ecUpperCase
                TabOrder = 9
              end
              object edtProfissao: TEdit
                Left = 984
                Top = 56
                Width = 181
                Height = 24
                CharCase = ecUpperCase
                TabOrder = 5
              end
              object edtRgIe: TEdit
                Left = 682
                Top = 84
                Width = 121
                Height = 24
                TabOrder = 8
              end
              object edtUfNatural: TEdit
                Left = 682
                Top = 57
                Width = 73
                Height = 24
                CharCase = ecUpperCase
                Enabled = False
                TabOrder = 4
              end
              object chkSabeAssinar: TCheckBox
                Left = 37
                Top = 147
                Width = 97
                Height = 17
                Caption = 'Sabe Assinar'
                TabOrder = 12
              end
              object edtEmail: TEdit
                Left = 682
                Top = 143
                Width = 483
                Height = 24
                TabOrder = 13
                OnExit = edtEmailExit
              end
              object edtDtNascimento: TDateTimePicker
                Left = 984
                Top = 26
                Width = 181
                Height = 24
                Date = 44694.000000000000000000
                Time = 0.870951458331546700
                TabOrder = 1
              end
            end
          end
          object pnlObs: TPanel
            Left = 1
            Top = 434
            Width = 1183
            Height = 208
            Align = alClient
            TabOrder = 2
            object memoObs: TMemo
              Left = 1
              Top = 105
              Width = 1181
              Height = 102
              Align = alBottom
              TabOrder = 0
            end
            object pnlEndereco: TPanel
              Left = 1
              Top = 1
              Width = 1181
              Height = 104
              Align = alClient
              TabOrder = 1
              object Label40: TLabel
                Left = 4
                Top = 24
                Width = 74
                Height = 16
                Caption = 'Logradouro: '
              end
              object Label41: TLabel
                Left = 578
                Top = 24
                Width = 39
                Height = 16
                Caption = 'Bairro:'
              end
              object Label42: TLabel
                Left = 427
                Top = 24
                Width = 31
                Height = 16
                Caption = 'Num:'
              end
              object Label43: TLabel
                Left = 34
                Top = 58
                Width = 44
                Height = 16
                Caption = 'Cidade:'
              end
              object Label44: TLabel
                Left = 438
                Top = 58
                Width = 20
                Height = 16
                Caption = 'UF:'
              end
              object Label45: TLabel
                Left = 556
                Top = 61
                Width = 61
                Height = 16
                Caption = 'Telefones:'
              end
              object edtLogradouro: TEdit
                Left = 82
                Top = 20
                Width = 331
                Height = 24
                CharCase = ecUpperCase
                TabOrder = 0
              end
              object edtBairro: TEdit
                Left = 623
                Top = 20
                Width = 307
                Height = 24
                CharCase = ecUpperCase
                TabOrder = 2
              end
              object edtNumero: TEdit
                Left = 464
                Top = 20
                Width = 73
                Height = 24
                CharCase = ecUpperCase
                TabOrder = 1
              end
              object edtCidadeEndereco: TEdit
                Left = 82
                Top = 55
                Width = 52
                Height = 24
                NumbersOnly = True
                TabOrder = 3
                OnChange = edtCidadeEnderecoChange
              end
              object edtNmCidade: TEdit
                Left = 141
                Top = 55
                Width = 272
                Height = 24
                Enabled = False
                TabOrder = 4
              end
              object edtUf: TEdit
                Left = 464
                Top = 55
                Width = 72
                Height = 24
                CharCase = ecUpperCase
                Enabled = False
                TabOrder = 5
              end
              object edtTelefones: TEdit
                Left = 623
                Top = 55
                Width = 307
                Height = 24
                CharCase = ecUpperCase
                TabOrder = 6
              end
            end
          end
          object pnlRodape: TPanel
            Left = 1
            Top = 642
            Width = 1183
            Height = 65
            Align = alBottom
            TabOrder = 3
            DesignSize = (
              1183
              65)
            object Label25: TLabel
              Left = 5
              Top = 34
              Width = 65
              Height = 16
              Anchors = [akLeft]
              Caption = 'Localidade:'
              ExplicitTop = 49
            end
            object Label26: TLabel
              Left = 375
              Top = 34
              Width = 31
              Height = 16
              Anchors = [akLeft]
              Caption = 'Data:'
              ExplicitTop = 49
            end
            object Label27: TLabel
              Left = 590
              Top = 34
              Width = 76
              Height = 16
              Anchors = [akLeft]
              Caption = 'Respons'#225'vel:'
              ExplicitTop = 49
            end
            object edtLocalidade: TEdit
              Left = 76
              Top = 28
              Width = 274
              Height = 24
              Anchors = [akLeft]
              CharCase = ecUpperCase
              TabOrder = 0
            end
            object edtResponsavel: TEdit
              Left = 672
              Top = 28
              Width = 318
              Height = 24
              Anchors = [akLeft]
              CharCase = ecUpperCase
              TabOrder = 1
            end
            object edtDataLocalidade: TDateTimePicker
              Left = 411
              Top = 28
              Width = 172
              Height = 24
              Date = 44710.000000000000000000
              Time = 0.712636111107713100
              TabOrder = 2
            end
          end
          object pnlObra: TPanel
            Left = 1
            Top = 20
            Width = 1183
            Height = 63
            Align = alTop
            TabOrder = 4
            object GroupBox1: TGroupBox
              Left = 1
              Top = 1
              Width = 1181
              Height = 61
              Align = alClient
              TabOrder = 0
              object Label46: TLabel
                Left = 3
                Top = 24
                Width = 76
                Height = 16
                Caption = 'C'#243'digo Obra:'
              end
              object Label47: TLabel
                Left = 372
                Top = 24
                Width = 29
                Height = 16
                Caption = 'SEQ:'
              end
              object Label48: TLabel
                Left = 492
                Top = 24
                Width = 58
                Height = 16
                Caption = 'Municipio:'
              end
              object edtObra: TEdit
                Left = 96
                Top = 21
                Width = 47
                Height = 24
                NumbersOnly = True
                TabOrder = 0
                OnExit = edtObraExit
              end
              object edtSeqObra: TEdit
                Left = 411
                Top = 21
                Width = 75
                Height = 24
                CharCase = ecUpperCase
                TabOrder = 1
                OnExit = edtSeqObraExit
              end
              object edtCodMunicipioObra: TEdit
                Left = 556
                Top = 21
                Width = 53
                Height = 24
                NumbersOnly = True
                TabOrder = 2
                OnChange = edtCodMunicipioObraChange
                OnExit = edtCodMunicipioObraExit
              end
              object edtNmMunicipioObra: TEdit
                Left = 615
                Top = 21
                Width = 356
                Height = 24
                TabStop = False
                Enabled = False
                TabOrder = 3
              end
              object rgTpPessoa: TRadioGroup
                Left = 980
                Top = 5
                Width = 185
                Height = 47
                Caption = 'Pessoa'
                Columns = 2
                Items.Strings = (
                  'Fisica'
                  'Juridica')
                TabOrder = 4
              end
              object edtNmObra: TEdit
                Left = 149
                Top = 21
                Width = 217
                Height = 24
                Enabled = False
                TabOrder = 5
              end
            end
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'C'#244'njuge'
        ImageIndex = 2
        object pnlFundoConjuge: TPanel
          Left = 0
          Top = 0
          Width = 1185
          Height = 708
          Align = alClient
          TabOrder = 0
          object gbConjuge: TGroupBox
            Left = 1
            Top = 1
            Width = 1183
            Height = 224
            Align = alTop
            BiDiMode = bdLeftToRight
            Caption = 'C'#244'njuge'
            ParentBiDiMode = False
            TabOrder = 0
            object Label29: TLabel
              Left = 52
              Top = 26
              Width = 31
              Height = 13
              Caption = 'Nome:'
            end
            object Label30: TLabel
              Left = 859
              Top = 26
              Width = 85
              Height = 13
              Caption = 'Data Nascimento:'
            end
            object Label31: TLabel
              Left = 13
              Top = 53
              Width = 65
              Height = 13
              Caption = 'Naturalidade:'
            end
            object Label32: TLabel
              Left = 650
              Top = 53
              Width = 17
              Height = 13
              Caption = 'UF:'
            end
            object Label33: TLabel
              Left = 903
              Top = 53
              Width = 48
              Height = 13
              Caption = 'Profiss'#227'o:'
            end
            object Label34: TLabel
              Left = 860
              Top = 81
              Width = 85
              Height = 13
              Caption = 'Org'#227'o Expedidor:'
            end
            object Label35: TLabel
              Left = 633
              Top = 81
              Width = 32
              Height = 13
              Caption = 'RG/IE:'
            end
            object Label36: TLabel
              Left = 309
              Top = 81
              Width = 81
              Height = 13
              Caption = 'Tipo Documento:'
            end
            object Label37: TLabel
              Left = 30
              Top = 81
              Width = 52
              Height = 13
              Caption = 'CPF/CNPJ:'
            end
            object Label38: TLabel
              Left = 31
              Top = 108
              Width = 48
              Height = 13
              Caption = 'Nome Pai:'
            end
            object Label39: TLabel
              Left = 604
              Top = 108
              Width = 54
              Height = 13
              Caption = 'Nome M'#227'e:'
            end
            object edtNmConjuge: TEdit
              Left = 96
              Top = 23
              Width = 749
              Height = 21
              TabOrder = 0
            end
            object edtCdCidadeNaturalidadeConjuge: TEdit
              Left = 96
              Top = 50
              Width = 54
              Height = 21
              TabOrder = 1
            end
            object edtNmCidadeNaturalidadeConjuge: TEdit
              Left = 156
              Top = 50
              Width = 463
              Height = 21
              Enabled = False
              TabOrder = 2
            end
            object edtUfNaturalidadeConjuge: TEdit
              Left = 673
              Top = 50
              Width = 73
              Height = 21
              Enabled = False
              TabOrder = 3
            end
            object edtProfissaoConjuge: TEdit
              Left = 978
              Top = 50
              Width = 181
              Height = 21
              TabOrder = 4
            end
            object edtOrgaoExpedidorConjuge: TEdit
              Left = 978
              Top = 78
              Width = 181
              Height = 21
              TabOrder = 5
            end
            object edtRgConjuge: TEdit
              Left = 673
              Top = 78
              Width = 121
              Height = 21
              TabOrder = 6
            end
            object cbTipoDocumentoConjuge: TComboBox
              Left = 413
              Top = 78
              Width = 206
              Height = 22
              Style = csOwnerDrawFixed
              TabOrder = 7
            end
            object edtCpfCnpjConjuge: TEdit
              Left = 96
              Top = 78
              Width = 195
              Height = 21
              TabOrder = 8
            end
            object edtNmPaiConjuge: TEdit
              Left = 96
              Top = 105
              Width = 459
              Height = 21
              TabOrder = 9
            end
            object edtNmMaeConjuge: TEdit
              Left = 676
              Top = 108
              Width = 483
              Height = 21
              TabOrder = 10
            end
            object chkSabeAssinarConjuge: TCheckBox
              Left = 30
              Top = 132
              Width = 97
              Height = 17
              Caption = 'Sabe Assinar'
              TabOrder = 11
            end
            object edtDtNascimentoConjuge: TDateTimePicker
              Left = 978
              Top = 23
              Width = 181
              Height = 21
              Date = 44710.000000000000000000
              Time = 0.713382696761982500
              TabOrder = 12
            end
          end
        end
      end
      object tbsDadosImovel: TTabSheet
        Caption = 'Dados do Im'#243'vel'
        ImageIndex = 3
        object PageControl1: TPageControl
          Left = 0
          Top = 0
          Width = 1185
          Height = 708
          ActivePage = tbsDocOcupantes
          Align = alClient
          TabOrder = 0
          object tbsDocRegistrados: TTabSheet
            Caption = 'Documentos Registrados'
          end
          object tbsDocOcupantes: TTabSheet
            Caption = 'Documentos Ocupante'
            ImageIndex = 1
          end
        end
      end
    end
  end
end
