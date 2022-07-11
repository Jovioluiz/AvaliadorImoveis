unit uInterfaceManipuladorBenfeitorias;

interface

type
  TParametrosLevantamento = record
    cd_obra,
    cd_proprietario,
    cd_beneficiario: Integer;
    sequencia,
    localizacao: string;
  end;

type
  IInterfaceManipuladorBenfeitorias = interface
  ['{E063CB9D-96DD-41CC-A268-17E94FC6DF6B}']
    procedure CarregaLevantamento(Parametros: TParametrosLevantamento);
    function GetNomeBenfeitoria(CodBenfeitoria: string): string;
  end;

implementation

end.
