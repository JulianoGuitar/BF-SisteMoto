unit uConsultaCNPJunit;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms;

function ConsultaCNPJ(sOpCNPJ:pChar): pChar;

implementation

uses uConsultaCNPJ;

function ConsultaCNPJ(sOpCNPJ:pChar): pChar;
var s : string;
begin
  result := '';
  if (trim(sOpCNPJ) = '')
  then exit;

  fmConsultaCNPJ := TfmConsultaCNPJ.Create(Application);
  //fmConsultaCNPJ.Consulta_CNPJ(CgcCpfPic(trim(edtCNPJ.Text)));
  //fmConsultaCNPJ.EditCNPJ.Text := CgcCpfPic(trim(edtCNPJ.Text));
  fmConsultaCNPJ.EditCNPJ.Text := sOpCNPJ;
  fmConsultaCNPJ.ShowModal;

  if (fmConsultaCNPJ.ModalResult = mrOk)
  and (trim(fmConsultaCNPJ.EditRazaoSocial.Text) <> '')
  then
  begin
    s := trim(fmConsultaCNPJ.EditRazaoSocial.Text)+';'
         +trim(fmConsultaCNPJ.EditFantasia.Text)+';'
         +trim(fmConsultaCNPJ.EditUF.Text)+';'
         +trim(fmConsultaCNPJ.EditCidade.Text)+';'
         +trim(fmconsultaCNPJ.EditIBGE.Text)+';'
         +trim(fmConsultaCNPJ.EditEndereco.Text)+';'
         +trim(fmConsultaCNPJ.EditNumero.Text)+';'
         +trim(fmConsultaCNPJ.EditComplemento.Text)+';'
         +trim(fmConsultaCNPJ.EditBairro.Text)+';'
         +trim(fmConsultaCNPJ.EditCEP.Text)+';'
         ;
    result := pchar(s);
  end;

  fmConsultaCNPJ.Release;
end;

exports ConsultaCNPJ;

end.
