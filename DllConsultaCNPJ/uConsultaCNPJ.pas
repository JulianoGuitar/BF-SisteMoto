unit uConsultaCNPJ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons,
  ACBrBase, ACBrSocket, ACBrConsultaCNPJ, Mask, pngimage;


{$DEFINE SUPPORT_PNG}  // Remova o Ponto, se seu Delphi suporta PNG


type
  TfmConsultaCNPJ = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    EditTipo: TEdit;
    EditRazaoSocial: TEdit;
    EditAbertura: TEdit;
    EditEndereco: TEdit;
    EditNumero: TEdit;
    EditComplemento: TEdit;
    EditBairro: TEdit;
    EditCidade: TEdit;
    EditUF: TEdit;
    EditCEP: TEdit;
    EditSituacao: TEdit;
    Panel1: TPanel;
    Label1: TLabel;
    ButBuscar: TBitBtn;
    EditCaptcha: TEdit;
    Label14: TLabel;
    Timer1: TTimer;
    EditFantasia: TEdit;
    Label13: TLabel;
    ACBrConsultaCNPJ1: TACBrConsultaCNPJ;
    EditCNPJ: TMaskEdit;
    Panel3: TPanel;
    Image1: TImage;
    LabAtualizarCaptcha: TLabel;
    ckRemoverEspacosDuplos: TCheckBox;
    ListCNAE2: TListBox;
    Label15: TLabel;
    EditCNAE1: TEdit;
    Label16: TLabel;
    EditEmail: TEdit;
    Label17: TLabel;
    EditTelefone: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    EditPorte: TEdit;
    btOK: TBitBtn;
    editIBGE: TEdit;
    procedure LabAtualizarCaptchaClick(Sender: TObject);
    procedure ButBuscarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditCaptchaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmConsultaCNPJ: TfmConsultaCNPJ;

implementation

(*
uses
  JPEG
{$IFDEF SUPPORT_PNG}
  , pngimage
{$ENDIF}
  ;
  *)
{$R *.dfm}

procedure TfmConsultaCNPJ.ButBuscarClick(Sender: TObject);
var
  I: Integer;
begin
  if EditCaptcha.Text <> '' then
  begin
    if ACBrConsultaCNPJ1.Consulta(
      EditCNPJ.Text,
      EditCaptcha.Text,
      ckRemoverEspacosDuplos.Checked
    ) then
    begin
      EditTipo.Text        := ACBrConsultaCNPJ1.EmpresaTipo;
      EditRazaoSocial.Text := ACBrConsultaCNPJ1.RazaoSocial;
      EditPorte.Text       := ACBrConsultaCNPJ1.Porte;
      EditAbertura.Text    := DateToStr( ACBrConsultaCNPJ1.Abertura );
      EditFantasia.Text    := ACBrConsultaCNPJ1.Fantasia;
      EditEndereco.Text    := ACBrConsultaCNPJ1.Endereco;
      EditNumero.Text      := ACBrConsultaCNPJ1.Numero;
      EditComplemento.Text := ACBrConsultaCNPJ1.Complemento;
      EditBairro.Text      := ACBrConsultaCNPJ1.Bairro;
      EditComplemento.Text := ACBrConsultaCNPJ1.Complemento;
      EditCidade.Text      := ACBrConsultaCNPJ1.Cidade;
      editIBGE.Text      := ACBrConsultaCNPJ1.IBGE_Municipio;
      EditUF.Text          := ACBrConsultaCNPJ1.UF;
      EditCEP.Text         := ACBrConsultaCNPJ1.CEP;
      EditSituacao.Text    := ACBrConsultaCNPJ1.Situacao;
      EditCNAE1.Text       := ACBrConsultaCNPJ1.CNAE1;
      EditEmail.Text       := ACBrConsultaCNPJ1.EndEletronico;
      EditTelefone.Text    := ACBrConsultaCNPJ1.Telefone;

      ListCNAE2.Clear;
      for I := 0 to ACBrConsultaCNPJ1.CNAE2.Count - 1 do
        ListCNAE2.Items.Add(ACBrConsultaCNPJ1.CNAE2[I]);
    end;
  end
  else
  begin
    ShowMessage('? necess?rio digitar o captcha.');
    EditCaptcha.SetFocus;
  end;
end;

procedure TfmConsultaCNPJ.EditCaptchaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    ButBuscarClick(ButBuscar);
end;

procedure TfmConsultaCNPJ.FormShow(Sender: TObject);
begin
  Timer1.Enabled:= True;
end;

procedure TfmConsultaCNPJ.LabAtualizarCaptchaClick(Sender: TObject);
var
  Stream: TMemoryStream;
//  Jpg: TJPEGImage;
{$IFDEF DELPHI2009_UP}
  png: TPngImage;
{$ELSE}
  ImgArq: String;
{$ENDIF}
begin
  {$IFNDEF SUPPORT_PNG}
    ShowMessage('Aten??o: Seu Delphi n?o d? suporte nativo a imagens PNG. Queira verificar o c?digo fonte deste exemplo para saber como proceder.');
    Exit;
    // COMO PROCEDER:
    //
    // 1) Caso o site da receita esteja utilizando uma imagem do tipo JPG, voc? pode utilizar o c?digo comentado abaixo.
    //    * Comente ou apague o c?digo que trabalha com PNG, incluindo o IFDEF/ENDIF;
    //    * descomente a declara??o da vari?vel jpg
    //    * descomente o c?digo abaixo;
    // 2) Caso o site da receita esteja utilizando uma imagem do tipo PNG, voc? ter? que utilizar uma biblioteca de terceiros para
    //conseguir trabalhar com imagens PNG.
    //  Neste caso, recomendamos verificar o manual da biblioteca em como fazer a implementa??o. Algumas sugest?es:
    //    * Procure no F?rum do ACBr sobre os erros que estiver recebendo. Uma das maneiras mais simples est? no link abaixo:
    //      - http://www.projetoacbr.com.br/forum/topic/20087-imagem-png-delphi-7/
    //    * O exemplo acima utiliza a biblioteca GraphicEX. Mas existem outras bibliotecas, caso prefira:
    //      - http://synopse.info/forum/viewtopic.php?id=115
    //      - http://graphics32.org/wiki/
    //      - http://cc.embarcadero.com/Item/25631
    //      - V?rias outras: http://torry.net/quicksearchd.php?String=png&Title=Yes
  {$ENDIF}

  Stream:= TMemoryStream.Create;
  try
    ACBrConsultaCNPJ1.Captcha(Stream);

   {$IFDEF DELPHI2009_UP}
    //Use esse c?digo quando a imagem do site for do tipo PNG
    png:= TPngImage.Create;
    try
      png.LoadFromStream(Stream);
      Image1.Picture.Assign(png);
    finally
      png.Free;
    end;
    { //Use esse c?digo quando a imagem do site for do tipo JPG
      Jpg:= TJPEGImage.Create;
      try
        Jpg.LoadFromStream(Stream);
        Image1.Picture.Assign(Jpg);
      finally
        Jpg.Free;
      end;
    }
   {$ELSE}
    ImgArq := ExtractFilePath(ParamStr(0))+PathDelim+'captch.png';
    Stream.SaveToFile( ImgArq );
    Image1.Picture.LoadFromFile( ImgArq );
   {$ENDIF}

    EditCaptcha.Clear;
    EditCaptcha.SetFocus;
  finally
    Stream.Free;
  end;
end;

procedure TfmConsultaCNPJ.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:= False;
  LabAtualizarCaptchaClick(LabAtualizarCaptcha);
  EditCNPJ.SetFocus;
end;

procedure TfmConsultaCNPJ.FormCreate(Sender: TObject);
begin
//  btOK.Glyph.LoadFromResourceName(HInstance,'OK');
//  ButBuscar.Glyph.LoadFromResourceName(HInstance,'CONS');
end;

procedure TfmConsultaCNPJ.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = chr(vk_escape)
  then ModalResult := mrCancel;
end;


end.
