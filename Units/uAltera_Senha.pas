unit uAltera_Senha;
(******************************************************************************)
(*  SGD Bluefield - 01/04/2017                                                  *)
(******************************************************************************)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, EditJul, Buttons, BitBtnJul, ExtCtrls;

type
  TfmAltera_Senha = class(TForm)
    btOK: TBitBtnJul;
    btDesiste: TBitBtnJul;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    edtSenha: TEditJul;
    edtConfirma: TEditJul;
    edtSenha_Ant: TEditJul;
 //   procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure btOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    sSenha_Atual : string;
    { Public declarations }
  end;

var
  fmAltera_Senha: TfmAltera_Senha;

implementation



{$R *.dfm}

(******************************************************************************)
{
procedure TfmAltera_Senha.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if (key in ['À'..'ÿ']) or (key in [chr(VK_SPACE),'´','~','\','?','^','''','"','`']) then key := #0;
end;

(******************************************************************************)
}
procedure TfmAltera_Senha.btOKClick(Sender: TObject);
begin
  if trim(edtSenha_Ant.Text) <> trim(sSenha_Atual) then
  begin
    if trim(sSenha_Atual) = ''
    then MessageBox(Handle, pchar('A senha atual deve ficar em branco para criar uma nova senha.'), 'Aviso', MB_ICONWARNING)
    else MessageBox(Handle, pchar('Senha atual não confere.'), 'Aviso', MB_ICONWARNING);
    edtSenha_Ant.SetFocus;
    exit;
  end;
  if trim(edtSenha.Text) = '' then
  begin
    MessageBox(Handle, pchar('A nova senha não pode ser em branco.'), 'Aviso', MB_ICONWARNING);
    edtSenha.SetFocus;
    exit;
  end;
  if edtSenha.Text = edtSenha_Ant.Text then
  begin
    MessageBox(Handle, pchar('A nova senha é igual a atual.'), 'Aviso', MB_ICONWARNING);
    edtSenha.SetFocus;
    exit;
  end;

  if trim(edtConfirma.Text) = '' then
  begin
    MessageBox(Handle, pchar('Confirme a nova senha.'), 'Aviso', MB_ICONWARNING);
    edtSenha.SetFocus;
    exit;
  end;
  if edtSenha.Text <> edtConfirma.Text then
  begin
    MessageBox(Handle, pchar('A confirmação da senha não confere com a nova senha.'), 'Aviso', MB_ICONWARNING);
    edtConfirma.SetFocus;
    exit;
  end;



  ModalResult := mrOk;

end;

(******************************************************************************)

procedure TfmAltera_Senha.FormCreate(Sender: TObject);
begin
  btOK.Glyph.LoadFromResourceName(HInstance,'OK');
  btDesiste.Glyph.LoadFromResourceName(HInstance,'DESIST');
end;

(******************************************************************************)

end.
