unit uLogin;
(******************************************************************************)
(*  SGD Bluefield - 01/04/2017                                                  *)
(******************************************************************************)

interface
                                                             
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, bfEdit;

type
  TfmLogin = class(TForm)
    btSai: TBitBtn;
    btOK: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    edjUsuario: TbfEdit;
    edjSenha: TbfEdit;
    procedure edjSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;
function Login(sUsuario,sSenha:string):string;

implementation


{$R *.dfm}
function Login(sUsuario,sSenha:string):string;
var
  u, s : string;
begin
  result := '';

  u := '';
  s := '';
  with TfmLogin.Create(Application) do
  begin
    edjUsuario.Text := sUsuario;
    edjSenha.Text := sSenha;
    ShowModal;
    if ModalResult = mrOK then
    begin
      u := trim(edjUsuario.Text);
      s := edjSenha.Text;
    end;
    Release;
  end;

  if u <> ''
  then result := u+';'+s+';';
end;

(******************************************************************************)

procedure TfmLogin.edjSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = chr(vk_return) then ModalResult := mrOK;
end;

(******************************************************************************)

procedure TfmLogin.FormCreate(Sender: TObject);
begin
  btOK.Glyph.LoadFromResourceName(HInstance,'OK');
  btSai.Glyph.LoadFromResourceName(HInstance,'SAI');
end;

(******************************************************************************)

procedure TfmLogin.FormShow(Sender: TObject);
begin
  if edjUsuario.Text <> ''
  then edjSenha.SetFocus;
end;

end.
