unit uManipuladorBenfeitoriasReprodutivas;

interface

uses
  uManipuladorBenfeitorias;

type
  TTipoCultivo = (tcNativo = 1, tcTradicional, tcTecnificado);
  TAcessibilidade = (taOtima, taMuitoBoa, taBoa, taRegular, taRuim);
  TDistancia = (tdMuitoProximo, tdProximo, tdDistante, tdMuitoDistante);
  TNivelManejo = (tnmAvancado, tnmSemiAvancado, tnmTradicional, tnmPrimitivo, tnmImprodutivo);

  TDadosBenfeitoria = record
    cd_benfeitoria: Integer;
    un_medida: string;
    quantidade,
    idade: Double;
    tp_cultivo: TTipoCultivo;
  end;

  TManipuladorBenfeitoriasReprodutivas = class(TManipuladorBenfeitorias)

  public
    procedure CarregaLevantamento(Parametros: TParametrosLevantamento); override;
    procedure AdicionarBenfeitoriaReprodutiva(DadosBenfeitorias: TDadosBenfeitoria); overload;
  end;

implementation

uses
  System.Variants;

{ TManipuladorBenfeitoriasReprodutivas }

procedure TManipuladorBenfeitoriasReprodutivas.AdicionarBenfeitoriaReprodutiva(DadosBenfeitorias: TDadosBenfeitoria);
begin
  if Dados.cdsLFBenfeitoriaReprodutiva.Locate('cd_benfeitoria;un_medida;idade;tp_cultivo',
                                              VarArrayOf([DadosBenfeitorias.cd_benfeitoria,
                                                          DadosBenfeitorias.un_medida,
                                                          DadosBenfeitorias.idade,
                                                          Ord(DadosBenfeitorias.tp_cultivo)]), []) then
    Dados.cdsLFBenfeitoriaReprodutiva.Edit
  else
    Dados.cdsLFBenfeitoriaReprodutiva.Append;
  Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('cd_benfeitoria').AsInteger := DadosBenfeitorias.cd_benfeitoria;
  Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('un_medida').AsString := DadosBenfeitorias.un_medida;
  Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('quantidade').AsFloat := DadosBenfeitorias.quantidade;
  Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('idade').AsFloat := DadosBenfeitorias.idade;
  Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('tp_cultivo').AsInteger := Ord(DadosBenfeitorias.tp_cultivo);
  Dados.cdsLFBenfeitoriaReprodutiva.Post;
end;

procedure TManipuladorBenfeitoriasReprodutivas.CarregaLevantamento(Parametros: TParametrosLevantamento);
begin
  inherited;
///
end;

end.
