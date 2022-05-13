program AvaliadorImoveis;

uses
  Vcl.Forms,
  uPrincipal in 'source\view\uPrincipal.pas' {frmPrincipal},
  fFolhaCadastral in 'source\view\fFolhaCadastral.pas' {frmFolhaCadastral},
  fFormGenerico in 'source\view\Generico\fFormGenerico.pas' {frmGenerico},
  uTypeFolhaCadastral in 'source\controller\types\uTypeFolhaCadastral.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
