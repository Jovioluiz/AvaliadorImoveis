unit uMensagem;

interface

uses
  Vcl.Dialogs, System.UITypes, System.Classes;

type
  TMensagem = class

    class procedure MostrarMensagem(Titulo, Mensagem: string; const Buttons: array of string; const Icon: TTaskDialogIcon = tdiInformation);
  end;

implementation

{ TMensagem }

class procedure TMensagem.MostrarMensagem(Titulo, Mensagem: string; const Buttons: array of string; const Icon: TTaskDialogIcon = tdiInformation);
var
  dialog: TTaskDialog;
begin
  dialog := TTaskDialog.Create(nil);
  try
    dialog.Caption := Titulo;
    dialog.Text := Mensagem;
    dialog.MainIcon := Icon;
    dialog.CommonButtons := [];
    for var I := 0 to Pred(Length(Buttons)) do
      dialog.Buttons.Add.Caption := Buttons[I];
    dialog.Execute;
  finally
    dialog.Free;
  end;
end;

end.
