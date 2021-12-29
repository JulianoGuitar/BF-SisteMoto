unit uFuncoes;
(******************************************************************************)
(*  SGD Bluefield - 01/04/2017                                                  *)
(******************************************************************************)

interface

uses
  Sysutils, Windows, Forms, Controls;


function Separa_String(sOp: string; iOP: integer; sOP_Separador: string = ';'): string;
function CgcCpfPic(pdado: string ): string;
function CepPic(Cep: String): String;
function Completa(Texto : String; caracter: Char; Tamanho: Integer): String;
function ExtractTempDir : String;

function Valida_CGC(sOp: string): Boolean;
function Valida_CPF(sOp: string): Boolean;

implementation

(******************************************************************************)

function ExtractTempDir : String;
var
  Buffer : Array[0..144] of Char;
begin
  GetTempPath(144,Buffer);
  Result := StrPas(Buffer);
end;

(******************************************************************************)

function Separa_String(sOp : string; iOP : integer; sOP_Separador: string = ';') : string;
var
  a : Array [1..255] of string;
  i, ii : integer;
  s, c : string;
begin

  s := '';
  ii := 1;
  for i := 1 to length(sOp) do
  begin
    c := copy(sOp,i,1);
    if c = sOP_Separador then
    begin
      a[ii] := s;
      s := '';
      inc(ii);
    end
    else s := s + c;
  end;
  a[ii] := s;
  result := a[iOp];

end;

{******************************************************************************}
function CgcCpfPic( pdado: string ): string;
begin
Result := '';
if Length(pdado) = 11
then Result := Copy( pdado, 1, 3 ) + '.' + Copy( pdado, 4, 3 ) + '.' +
               Copy( pdado, 7, 3 ) + '-' + Copy( pdado, 10, 2 )
else
if Length(pdado) = 14 then//Juliano 08/01/2013
Result := Copy( pdado, 1, 2 ) + '.' + Copy( pdado, 3, 3 ) + '.' +
               Copy( pdado, 6, 3 ) + '/' + Copy( pdado, 9, 4 ) + '-' +
               Copy( pdado, 13, 2 );
end;

(******************************************************************************)

function CepPic(Cep: String): String;
var
  Aux: String;
begin
Aux := Trim(Cep);
if Length(Aux) <> 8
then Aux := Completa(Aux, ' ', 8);
if Length(Aux) = 8
then Insert('-', Aux, 6);
Result := Aux;
end;

(******************************************************************************)

function Completa(Texto: String; Caracter: Char; Tamanho: Integer): String;
var
 ff : Integer;
 Aux: String;
begin
{ Função para ajustar o Texto com Tamanho e preencher o restante com Caracter
                              Michael Murussi                               }
Aux := Texto;
if Length(Aux) < Tamanho
then begin
     for ff := 1 to (Tamanho - Length(Aux))
     do Aux := Aux + Caracter;
     end
else Aux := Copy(Aux, 1, Tamanho);

Result := Aux;
end;

(******************************************************************************)

Function Valida_CGC(sOp: string): Boolean;
var
  aDig: array [1..14] of Byte;
  i, Resto: Byte;
  DV1, DV2: Byte;
  Total1, Total2: Integer;
begin
  result := FALSE;
  if Length(Trim(sOp)) = 14 then
  begin

    if trim(sOp) = '00000000000000' then exit;

    for i := 1 to 14 do
    Try
      aDig[i] := StrToInt (sOp[i]);
    Except
      aDig[i] := 0;
    end;

    Total1 := aDig[1] * 5 + aDig[2] * 4 + aDig[3] * 3 + aDig[4] * 2 + aDig[5] * 9 + aDig[6] * 8 +
              aDig[7] * 7 + aDig[8] * 6 + aDig[9] * 5 + aDig[10] * 4 + aDig[11] * 3 + aDig[12] * 2;

    Resto := Total1 mod 11;

    if Resto > 1 then DV1 := 11 - Resto else DV1 := 0;
    Total2 := aDig[1] * 6 + aDig[2] * 5 + aDig[3] * 4 + aDig[4] * 3 + aDig[5] * 2 + aDig[6] * 9 +
              aDig[7] * 8 + aDig[8] * 7 + aDig[9] * 6 + aDig[10] * 5 + aDig[11] * 4 + aDig[12] * 3 + DV1 * 2 ;

    Resto := Total2 mod 11;

    if Resto > 1 then DV2 := 11 - Resto else DV2 := 0;
    if (DV1 = aDig[13]) and (DV2 = aDig[14]) then result := TRUE;
  end;
end;

(******************************************************************************)

Function Valida_CPF(sOp: string): Boolean;
var
  i, Numero, Resto: Byte;
  DV1, DV2: Byte;
  Total, Soma: Integer;
Begin
  result := FALSE;
  if length (Trim (sOp)) = 11 Then
  begin
    if trim(sOp) = '00000000000' then exit;

    Total := 0 ;
    Soma := 0 ;
    for i := 1 to 9 do
    Begin
      Try
        Numero := StrToInt (sOp[i]);
      Except
        Numero := 0;
      end;
      Total := Total + (Numero * (11 - i)) ;
      Soma := Soma + Numero;
    end;
    Resto := Total mod 11;
    if Resto > 1 then DV1 := 11 - Resto else DV1 := 0;
    Total := Total + Soma + 2 * DV1;
    Resto := Total mod 11;
    if Resto > 1 then DV2 := 11 - Resto else DV2 := 0;
    if (IntToStr (DV1) = sOP[10]) and (IntToStr (DV2) = sOp[11]) then result := TRUE;
  end;
end;

(******************************************************************************)

end.
