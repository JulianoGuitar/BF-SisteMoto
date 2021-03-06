unit uFuncoesTelas;
(******************************************************************************)
(*  SGD Bluefield - 01/04/2017                                                  *)
(******************************************************************************)

interface

uses
  Graphics, SysUtils, Windows, forms;

type
  TAbreTela = function(sOpUsuario, sOpLocal, sOpFiltros, sOpDBSel: pchar; cOpBlueField, cOpNormal : TColor; iEmpresa, iOp: integer; bOpModal: boolean): pchar;
  TConsultaCNPJ = function(sOpCNPJ:pChar): pChar;

function AbreTela(sOpTela, sOpPacote, sOpUsuario, sOpLocal, sOpFiltros, sOpDBSel:string; cOpBlueField, cOpNormal : TColor; iEmpresa, iOp: integer; bOpModal: boolean = false): string;
function ConsultaCNPJ(sOpCNPJ:string): string;

implementation


function AbreTela(sOpTela, sOpPacote, sOpUsuario, sOpLocal, sOpFiltros, sOpDBSel:string; cOpBlueField, cOpNormal : TColor; iEmpresa, iOp: integer; bOpModal: boolean = false): string;
var
  mPacote: HModule;
  AbreChild : TAbreTela;
begin
  result := '';

  mPacote := LoadPackage(sOpPacote);
  if mPacote = 0 then
  begin
    MessageBox(Application.Handle, pchar('Pacote '+sOpPacote+' n?o carregado.'), 'ops!', MB_ICONERROR);
    exit;
  end;

  try
    @AbreChild := GetProcAddress(mPacote, pchar(sOpTela));
    if Assigned(AbreChild)
    then result := AbreChild(pchar(sOpUsuario), pchar(sOpLocal), pchar(sOpFiltros), pchar(sOpDBSel), cOpBlueField, cOpNormal, iEmpresa, iOp,  bOpModal)
  except
    on e : Exception do
    begin
      MessageBox(Application.Handle, pChar('N?o foi poss?vel abrir '+sOpTela+#13+#13+e.message), 'Erro', MB_ICONERROR);
      exit;
    end;
  end;
end;

function ConsultaCNPJ(sOpCNPJ:string): string;
var
  Funcao: TConsultaCNPJ;
  cfmHandle, th: tHandle;
begin

  result := '';
  cfmHandle := LoadLibrary(pChar('ConsultaCNPJ.dll'));
  if cfmHandle = 0 then
  begin
    MessageBox(Application.Handle, pchar('ConsultaCNPJ.dll n?o pode ser carregada.'), 'ops!', MB_ICONERROR);
    exit;
  end;

  try
    @Funcao := GetProcAddress(cfmHandle, pChar('ConsultaCNPJ'));
    if Assigned(Funcao)
    then result := Funcao(pchar(sOpCNPJ));
  except
    on e : Exception do
    begin
      MessageBox(Application.Handle, pChar('N?o foi poss?vel executar a fun??o ConsultaCNPJ.'+#13+#13+e.message), 'Erro', MB_ICONERROR);
      exit;
    end;
  end;

end;

end.
