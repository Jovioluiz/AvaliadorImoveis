unit uObjetoRegraInterface;

interface

uses
  FireDAC.Comp.Client;

type
  IObjetoRegraInterface = interface
    function GetConexao: TFDConnection;
  end;

implementation

end.
