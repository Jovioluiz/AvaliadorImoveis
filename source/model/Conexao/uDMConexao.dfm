object dmConexao: TdmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 150
  Width = 215
  object conexao: TFDConnection
    Params.Strings = (
      'DriverID=PG')
    TxOptions.AutoStart = False
    TxOptions.AutoStop = False
    Left = 32
    Top = 16
  end
  object driver: TFDPhysPgDriverLink
    Left = 96
    Top = 16
  end
end
