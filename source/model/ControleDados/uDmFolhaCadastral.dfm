object DmFolhaCadastral: TDmFolhaCadastral
  OldCreateOrder = False
  Height = 317
  Width = 421
  object dsFolhaCadastral: TDataSource
    DataSet = cdsFolhaCadastral
    Left = 40
    Top = 16
  end
  object cdsFolhaCadastral: TClientDataSet
    PersistDataPacket.Data = {
      710200009619E0BD01000000180000001600000000000300000071020869645F
      676572616C0800010000000000046E6F6D650100490000000100055749445448
      0200020064000D64745F6E617363696D656E746F04000600000000001663645F
      6369646164655F6E61747572616C696461646504000100000000000970726F66
      697373616F01004900000001000557494454480200020032000974705F706573
      736F610100490000000100055749445448020002000100086370665F636E706A
      0100490000000100055749445448020002000F000C74705F646F63756D656E74
      6F01004900000001000557494454480200020005000569655F72670100490000
      0001000557494454480200020014000C736162655F617373696E617202000300
      00000000086E6F6D655F70616901004900000001000557494454480200020064
      00086E6F6D655F6D616501004900000001000557494454480200020064000565
      6D61696C01004900000001000557494454480200020032000B64745F63616461
      7374726F0400060000000000036F627304004B00000001000753554254595045
      0200490009005769646554657874000A6C6F63616C6964616465010049000000
      01000557494454480200020032000E6E6D5F6361646173747261646F72010049
      00000001000557494454480200020032000763645F6F62726104000100000000
      000973657175656E6369610100490000000100055749445448020002000A000C
      63645F6D756E69636970696F04000100000000000F6F7267616F5F6578706564
      69646F720100490000000100055749445448020002000A0012666F6C68615F70
      726F70726965746172696F02000300000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_geral'
        DataType = ftLargeint
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'dt_nascimento'
        DataType = ftDate
      end
      item
        Name = 'cd_cidade_naturalidade'
        DataType = ftInteger
      end
      item
        Name = 'profissao'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'tp_pessoa'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'cpf_cnpj'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'tp_documento'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ie_rg'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'sabe_assinar'
        DataType = ftBoolean
      end
      item
        Name = 'nome_pai'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'nome_mae'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'email'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'dt_cadastro'
        DataType = ftDate
      end
      item
        Name = 'obs'
        DataType = ftWideMemo
      end
      item
        Name = 'localidade'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'nm_cadastrador'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'cd_obra'
        DataType = ftInteger
      end
      item
        Name = 'sequencia'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'cd_municipio'
        DataType = ftInteger
      end
      item
        Name = 'orgao_expedidor'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'folha_proprietario'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 40
    Top = 64
  end
  object dsFolhaCadEstadoCivil: TDataSource
    DataSet = cdsFolhaCadEstadoCivil
    Left = 168
    Top = 16
  end
  object cdsFolhaCadEstadoCivil: TClientDataSet
    PersistDataPacket.Data = {
      5E0000009619E0BD0100000018000000030000000000030000005E000869645F
      676572616C08000100000000001269645F666F6C68615F63616461737472616C
      08000100000000000F63645F65737461646F5F636976696C0400010000000000
      0000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_geral'
        DataType = ftLargeint
      end
      item
        Name = 'id_folha_cadastral'
        DataType = ftLargeint
      end
      item
        Name = 'cd_estado_civil'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 168
    Top = 72
  end
  object dsFolhaCadEstadoCivilCert: TDataSource
    DataSet = cdsFolhaCadEstadoCivilCert
    Left = 312
    Top = 16
  end
  object cdsFolhaCadEstadoCivilCert: TClientDataSet
    PersistDataPacket.Data = {
      5B0100009619E0BD01000000180000000B0000000000030000005B010869645F
      676572616C08000100000000001F69645F666F6C68615F63616461737472616C
      5F65737461646F5F636976696C08000100000000000B6E725F63657274696461
      6F0100490000000100055749445448020002000F0006666F6C68617301004900
      00000100055749445448020002000A00056C6976726F01004900000001000557
      494454480200020005000464617461040006000000000008636172746F72696F
      0100490000000100055749445448020002006400116E725F73656E74656E6361
      5F6175746F730100490000000100055749445448020002006400056A75697A6F
      010049000000010005574944544802000200640018706F737375695F70616374
      6F5F616E74656E75706369616C020003000000000013756E69616F5F65737461
      76656C5F64657364650100490000000100055749445448020002000A000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_geral'
        DataType = ftLargeint
      end
      item
        Name = 'id_folha_cadastral_estado_civil'
        DataType = ftLargeint
      end
      item
        Name = 'nr_certidao'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'folhas'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'livro'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'data'
        DataType = ftDate
      end
      item
        Name = 'cartorio'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'nr_sentenca_autos'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'juizo'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'possui_pacto_antenupcial'
        DataType = ftBoolean
      end
      item
        Name = 'uniao_estavel_desde'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 304
    Top = 72
  end
  object dsFolhaCadastralEndereco: TDataSource
    DataSet = cdsFolhaCadastralEndereco
    Left = 56
    Top = 144
  end
  object cdsFolhaCadastralEndereco: TClientDataSet
    PersistDataPacket.Data = {
      AD0000009619E0BD010000001800000006000000000003000000AD000869645F
      676572616C08000100000000001269645F666F6C68615F63616461737472616C
      08000100000000000A6C6F677261646F75726F01004900000001000557494454
      48020002006400066E756D65726F010049000000010005574944544802000200
      0A000963645F63696461646504000100000000000662616972726F0100490000
      0001000557494454480200020064000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_geral'
        DataType = ftLargeint
      end
      item
        Name = 'id_folha_cadastral'
        DataType = ftLargeint
      end
      item
        Name = 'logradouro'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'numero'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'cd_cidade'
        DataType = ftInteger
      end
      item
        Name = 'bairro'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 56
    Top = 200
  end
  object dsConjuge: TDataSource
    DataSet = cdsConjuge
    Left = 184
    Top = 144
  end
  object cdsConjuge: TClientDataSet
    PersistDataPacket.Data = {
      460000009619E0BD01000000180000000200000000000300000046000869645F
      676572616C08000100000000001269645F666F6C68615F63616461737472616C
      08000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_geral'
        DataType = ftLargeint
      end
      item
        Name = 'id_folha_cadastral'
        DataType = ftLargeint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 184
    Top = 208
  end
end
