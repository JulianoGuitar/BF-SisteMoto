unit uSplash;
(******************************************************************************)
(*  SGD Bluefield - 01/04/2017                                                  *)
(******************************************************************************)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, jpeg, ExtCtrls, ComCtrls;

type
  TfmSplash = class(TForm)
    Image2: TImage;
    lblInformacao: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure Informacao(sOp:string);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSplash: TfmSplash;

implementation

{$R *.DFM}


procedure TfmSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := CaFree;
end;

procedure TfmSplash.Informacao(sOp: string);
begin
  lblInformacao.Caption := sOp;
  Application.ProcessMessages;
end;

end.
