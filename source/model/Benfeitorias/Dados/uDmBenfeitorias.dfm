object dtmBenfeitorias: TdtmBenfeitorias
  OldCreateOrder = False
  Height = 252
  Width = 343
  object dsLFBenfeitoriaReprodutiva: TDataSource
    DataSet = cdsLFBenfeitoriaReprodutiva
    Left = 216
    Top = 16
  end
  object cdsLFBenfeitoriaReprodutiva: TClientDataSet
    PersistDataPacket.Data = {
      330100009619E0BD01000000180000000900000000000300000033010869645F
      676572616C08000100000000001F69645F6C6576616E74616D656E746F5F6669
      7369636F5F62656E666569746F0800010000000100094649454C444E414D4524
      00098069645F6C6576616E74616D656E746F5F66697369636F5F62656E666569
      746F72696173000E63645F62656E666569746F72696101004900000001000557
      49445448020002001E0009756E5F6D6564696461010049000000010005574944
      5448020002000A000A7175616E74696461646508000400000000000569646164
      6508000400000000000A74705F63756C7469766F040001000000000005707265
      636F080004000000010007535542545950450200490006004D6F6E6579000E69
      645F62656E666569746F72696104000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_geral'
        DataType = ftLargeint
      end
      item
        Name = 'id_levantamento_fisico_benfeitorias'
        DataType = ftLargeint
      end
      item
        Name = 'cd_benfeitoria'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'un_medida'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'quantidade'
        DataType = ftFloat
      end
      item
        Name = 'idade'
        DataType = ftFloat
      end
      item
        Name = 'tp_cultivo'
        DataType = ftInteger
      end
      item
        Name = 'preco'
        DataType = ftCurrency
      end
      item
        Name = 'id_benfeitoria'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 216
    Top = 72
    object cdsLFBenfeitoriaReprodutivaid_geral: TLargeintField
      FieldName = 'id_geral'
      Visible = False
    end
    object cdsLFBenfeitoriaReprodutivaid_levantamento_fisico_benfeitorias: TLargeintField
      FieldName = 'id_levantamento_fisico_benfeitorias'
      Visible = False
    end
    object cdsLFBenfeitoriaReprodutivaun_medida: TStringField
      DisplayLabel = 'UN Medida'
      FieldName = 'un_medida'
      Size = 10
    end
    object cdsLFBenfeitoriaReprodutivaquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
    end
    object cdsLFBenfeitoriaReprodutivaidade: TFloatField
      DisplayLabel = 'Idade'
      FieldName = 'idade'
    end
    object cdsLFBenfeitoriaReprodutivatp_cultivo: TIntegerField
      DisplayLabel = 'Cultivo'
      FieldName = 'tp_cultivo'
    end
    object cdsLFBenfeitoriaReprodutivapreco: TCurrencyField
      FieldName = 'preco'
    end
    object cdsLFBenfeitoriaReprodutivaid_benfeitoria: TIntegerField
      FieldName = 'id_benfeitoria'
      Visible = False
    end
    object cdsLFBenfeitoriaReprodutivacd_benfeitoria: TStringField
      DisplayLabel = 'C'#243'd. Benfeitoria'
      FieldName = 'cd_benfeitoria'
      Size = 30
    end
  end
  object dsLFBenfeitorias: TDataSource
    DataSet = cdsLFBenfeitorias
    Left = 48
    Top = 24
  end
  object cdsLFBenfeitorias: TClientDataSet
    PersistDataPacket.Data = {
      6B0100009619E0BD01000000180000000C0000000000030000006B010869645F
      676572616C08000100000000000763645F6F62726104000100000000001F6964
      5F666F6C68615F63616461737472616C5F70726F70726965746172696F080001
      00000000001F69645F666F6C68615F63616461737472616C5F62656E65666963
      696172696F08000100000000000973657175656E636961010049000000010005
      5749445448020002000A000B6C6F63616C697A6163616F010049000000010005
      5749445448020002000A00086E725F6C6175646F010049000000010005574944
      54480200020014000F64745F6C6576616E74616D656E746F0400060000000000
      0E61636573736962696C696461646504000100000000001463645F63656E7472
      6F5F636F6E73756D69646F7204000100000000001B64697374616E6369615F63
      656E74726F5F636F6E73756D69646F7204000100000000000C6E6976656C5F6D
      616E656A6F04000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_geral'
        DataType = ftLargeint
      end
      item
        Name = 'cd_obra'
        DataType = ftInteger
      end
      item
        Name = 'id_folha_cadastral_proprietario'
        DataType = ftLargeint
      end
      item
        Name = 'id_folha_cadastral_beneficiario'
        DataType = ftLargeint
      end
      item
        Name = 'sequencia'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'localizacao'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'nr_laudo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'dt_levantamento'
        DataType = ftDate
      end
      item
        Name = 'acessibilidade'
        DataType = ftInteger
      end
      item
        Name = 'cd_centro_consumidor'
        DataType = ftInteger
      end
      item
        Name = 'distancia_centro_consumidor'
        DataType = ftInteger
      end
      item
        Name = 'nivel_manejo'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 48
    Top = 80
  end
  object dsClasseTerra: TDataSource
    DataSet = cdsClasseTerra
    Left = 32
    Top = 160
  end
  object cdsClasseTerra: TClientDataSet
    PersistDataPacket.Data = {
      870000009619E0BD010000001800000007000000000003000000870005666174
      6F72080004000000000006636C61737365010049000000010005574944544802
      000200050007617265615F686108000400000000000266610800040000000000
      02666D080004000000000002666408000400000000000A617265615F746F7461
      6C08000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'fator'
        DataType = ftFloat
      end
      item
        Name = 'classe'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'area_ha'
        DataType = ftFloat
      end
      item
        Name = 'fa'
        DataType = ftFloat
      end
      item
        Name = 'fm'
        DataType = ftFloat
      end
      item
        Name = 'fd'
        DataType = ftFloat
      end
      item
        Name = 'area_total'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 120
    Top = 160
    object cdsClasseTerrafator: TFloatField
      DisplayLabel = 'Fator Homogeiniza'#231#227'o'
      FieldName = 'fator'
    end
    object cdsClasseTerraclasse: TStringField
      DisplayLabel = 'Classe'
      FieldName = 'classe'
      Size = 5
    end
    object cdsClasseTerraarea_ha: TFloatField
      DisplayLabel = #193'rea ha'
      FieldName = 'area_ha'
    end
    object cdsClasseTerrafa: TFloatField
      FieldName = 'fa'
      Visible = False
    end
    object cdsClasseTerrafm: TFloatField
      FieldName = 'fm'
      Visible = False
    end
    object cdsClasseTerrafd: TFloatField
      FieldName = 'fd'
      Visible = False
    end
    object cdsClasseTerraarea_total: TFloatField
      FieldName = 'area_total'
      Visible = False
    end
  end
end
