object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Avaliador de Im'#243'veis'
  ClientHeight = 661
  ClientWidth = 1264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = menuOpcoes
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 1264
    Height = 661
    Align = alClient
    TabOrder = 0
  end
  object menuOpcoes: TMainMenu
    Left = 432
    Top = 224
    object FolhaCadastral1: TMenuItem
      Caption = 'Folha Cadastral'
      object Cadastrar1: TMenuItem
        Caption = 'Cadastrar'
        OnClick = Cadastrar1Click
      end
      object Visualizar1: TMenuItem
        Caption = 'Visualizar'
      end
    end
  end
end
