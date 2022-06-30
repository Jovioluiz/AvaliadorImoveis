unit uObjetoRegraInterface;

interface

uses
  FireDAC.Comp.Client;

type
  IObjetoRegraInterface = interface
  ['{C37D4379-4E3D-4CA1-BE6D-0DD26330F580}']
    function GetConexao: TFDConnection;
  end;

implementation

end.
