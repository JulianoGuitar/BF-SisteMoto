unit uSGC_CLIENTES;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DB, DBClient, Provider, FMTBcd,
  SqlExpr, ExtCtrls, DBCtrls, Mask, udtmConexao, ComCtrls,
  Buttons, bfEdit,  bfdbEdit, DBGrids, bfdbGrid, bfdbEditButton,
  RelVisualBlue, bfdbComboBox, dbxpress;

type
  TfmSGC_CLIENTES = class(TForm)
    cds: TClientDataSet;
    dsp: TDataSetProvider;
    qr: TSQLQuery;
    ds: TDataSource;
    pgc: TPageControl;
    tsCadastro: TTabSheet;
    tsConsulta: TTabSheet;
    GroupBox1: TGroupBox;
    btConsulta: TBitBtn;
    btSalva: TBitBtn;
    btDesiste: TBitBtn;
    btExclui: TBitBtn;
    GroupBox2: TGroupBox;
    btSai: TBitBtn;
    dbgConsulta: TbfdbGrid;
    btInclui: TBitBtn;
    btEditar: TBitBtn;
    edtConsulta: TbfEdit;
    Label2: TLabel;
    edtNome: TbfdbEdit;
    btTransporta: TBitBtn;
    qrID: TIntegerField;
    qrNOME: TStringField;
    qrUSU_INCLUI: TStringField;
    qrDT_INCLUI: TSQLTimeStampField;
    qrUSU_ALTERA: TStringField;
    qrDT_ALTERA: TSQLTimeStampField;
    qrIDALT: TStringField;
    qrIDALTERADO: TStringField;
    cdsID: TIntegerField;
    cdsNOME: TStringField;
    cdsUSU_INCLUI: TStringField;
    cdsDT_INCLUI: TSQLTimeStampField;
    cdsUSU_ALTERA: TStringField;
    cdsDT_ALTERA: TSQLTimeStampField;
    cdsIDALT: TStringField;
    cdsIDALTERADO: TStringField;
    Label3: TLabel;
    bfdbEdit1: TbfdbEdit;
    qrCNPJ: TStringField;
    cdsCNPJ: TStringField;
    Label1: TLabel;
    edtCNPJ: TbfdbEdit;
    qrCOD_CONTROLE: TIntegerField;
    qrINSC_EST: TStringField;
    qrINSC_MUN: TStringField;
    qrUF: TStringField;
    qrENDERECO: TStringField;
    qrNUMERO: TStringField;
    qrCOMPLEMENTO: TStringField;
    qrBAIRRO: TStringField;
    qrCEP: TIntegerField;
    qrFONE: TStringField;
    qrCEL: TStringField;
    qrMAIL: TStringField;
    COD_CONTROLE: TIntegerField;
    cdsINSC_EST: TStringField;
    cdsINSC_MUN: TStringField;
    cdsUF: TStringField;
    cdsENDERECO: TStringField;
    cdsNUMERO: TStringField;
    cdsCOMPLEMENTO: TStringField;
    cdsBAIRRO: TStringField;
    cdsCEP: TIntegerField;
    cdsFONE: TStringField;
    cdsCEL: TStringField;
    cdsMAIL: TStringField;
    Label7: TLabel;
    edtUF: TbfdbEdit;
    Label8: TLabel;
    edtEndereco: TbfdbEdit;
    Label9: TLabel;
    edtNumero: TbfdbEdit;
    Label10: TLabel;
    edtComplemento: TbfdbEdit;
    Label11: TLabel;
    edtBairro: TbfdbEdit;
    Label12: TLabel;
    edtCEP: TbfdbEdit;
    Label13: TLabel;
    edtFone: TbfdbEdit;
    Label14: TLabel;
    edtCel: TbfdbEdit;
    Label15: TLabel;
    edtEmail: TbfdbEdit;
    qrCOD_CIDADE: TIntegerField;
    cdsCOD_CIDADE: TIntegerField;
    Label17: TLabel;
    edtCodCidade: TbfdbEditButton;
    qrNOME_CIDADE: TStringField;
    cdsNOME_CIDADE: TStringField;
    Label18: TLabel;
    edtNomeCidade: TbfdbEdit;
    btImprime: TBitBtn;
    RelVisual: TRelVisualBlue;
    edtCNPJCons: TbfEdit;
    btConsultaCNPJ: TBitBtn;
    ckbInativoCons: TCheckBox;
    ckbInativo: TDBCheckBox;
    edtConsID: TbfEdit;
    cbxPessoa: TbfdbComboBox;
    cdsPESSOA: TStringField;
    qrPESSOA: TStringField;
    edtConsCidade: TbfEdit;
    edtConsUF: TbfEdit;
    qrEnderecos: TSQLQuery;
    IntegerField1: TIntegerField;
    StringField2: TStringField;
    SQLTimeStampField1: TSQLTimeStampField;
    StringField3: TStringField;
    SQLTimeStampField2: TSQLTimeStampField;
    StringField4: TStringField;
    StringField5: TStringField;
    IntegerField5: TIntegerField;
    StringField17: TStringField;
    StringField18: TStringField;
    cdsEnderecos: TClientDataSet;
    IntegerField6: TIntegerField;
    StringField21: TStringField;
    SQLTimeStampField3: TSQLTimeStampField;
    StringField22: TStringField;
    SQLTimeStampField4: TSQLTimeStampField;
    StringField23: TStringField;
    StringField24: TStringField;
    IntegerField10: TIntegerField;
    cdsEnderecosNOME_CIDADE: TStringField;
    cdsEnderecosINATIVO: TStringField;
    dspEnderecos: TDataSetProvider;
    dsEnderecos: TDataSource;
    qrEnderecosID_PARTICIPANTE: TIntegerField;
    qrEnderecosTIPO_ENDERECO: TStringField;
    qrEnderecosNOME_ENDERECO: TStringField;
    qrEnderecosENDERECO: TStringField;
    qrEnderecosNUMERO: TStringField;
    qrEnderecosCOMPLEMENTO: TStringField;
    qrEnderecosBAIRRO: TStringField;
    qrEnderecosCEP: TIntegerField;
    qrEnderecosUF: TStringField;
    cdsEnderecosID_PARTICIPANTE: TIntegerField;
    cdsEnderecosTIPO_ENDERECO: TStringField;
    cdsEnderecosNOME_ENDERECO: TStringField;
    cdsEnderecosENDERECO: TStringField;
    cdsEnderecosNUMERO: TStringField;
    cdsEnderecosCOMPLEMENTO: TStringField;
    cdsEnderecosBAIRRO: TStringField;
    cdsEnderecosCEP: TIntegerField;
    cdsEnderecosUF: TStringField;
    pgcDados: TPageControl;
    tbDocumentos: TTabSheet;
    qrContatos: TSQLQuery;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    SQLTimeStampField5: TSQLTimeStampField;
    StringField6: TStringField;
    SQLTimeStampField6: TSQLTimeStampField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField10: TStringField;
    IntegerField4: TIntegerField;
    cdsContatos: TClientDataSet;
    cdsContatosID: TIntegerField;
    StringField20: TStringField;
    SQLTimeStampField7: TSQLTimeStampField;
    StringField25: TStringField;
    SQLTimeStampField8: TSQLTimeStampField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField29: TStringField;
    cdsContatosID_PARTICIPANTE: TIntegerField;
    dspContatos: TDataSetProvider;
    dsContatos: TDataSource;
    qrContatosCONTATO: TStringField;
    qrContatosSETOR: TStringField;
    qrContatosMAIL: TStringField;
    qrContatosFONE: TStringField;
    cdsContatosCONTATO: TStringField;
    cdsContatosSETOR: TStringField;
    cdsContatosMAIL: TStringField;
    cdsContatosFONE: TStringField;
    qrCOD_PAIS: TIntegerField;
    qrNOME_PAIS: TStringField;
    cdsCOD_PAIS: TIntegerField;
    cdsNOME_PAIS: TStringField;
    Label4: TLabel;
    Label19: TLabel;
    edtCodPais: TbfdbEditButton;
    edtNomePais: TbfdbEdit;
    qrNOME_FANTASIA: TStringField;
    qrMAIL_NFE: TStringField;
    qrSIMPLES_NACIONAL: TStringField;
    qrTIPO_CONTRIBUINTE: TStringField;
    qrSUFRAMA: TStringField;
    qrSUFRAMA_VALIDADE: TSQLTimeStampField;
    cdsNOME_FANTASIA: TStringField;
    cdsMAIL_NFE: TStringField;
    cdsSIMPLES_NACIONAL: TStringField;
    cdsTIPO_CONTRIBUINTE: TStringField;
    cdsSUFRAMA: TStringField;
    cdsSUFRAMA_VALIDADE: TSQLTimeStampField;
    tbEndereco: TTabSheet;
    gbEndereco: TGroupBox;
    bfdbGrid1: TbfdbGrid;
    edtInscEstadual: TbfdbEdit;
    Label5: TLabel;
    edtIscMunicipal: TbfdbEdit;
    Label6: TLabel;
    Label16: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edtSuframa: TbfdbEdit;
    Label22: TLabel;
    edtSuframaValidade: TbfdbEdit;
    tbContatos: TTabSheet;
    gbContatos: TGroupBox;
    bfdbGrid2: TbfdbGrid;
    cbxSimplesNacional: TbfdbComboBox;
    cbxTipoContribuinte: TbfdbComboBox;
    Label23: TLabel;
    edtNomeFantasia: TbfdbEdit;
    Label24: TLabel;
    Label25: TLabel;
    bfdbEdit2: TbfdbEdit;
    qrCLIENTE: TStringField;
    qrFORNECEDOR: TStringField;
    qrTRANSPORTADORA: TStringField;
    qrVENDEDOR: TStringField;
    cdsCLIENTE: TStringField;
    cdsFORNECEDOR: TStringField;
    cdsTRANSPORTADORA: TStringField;
    cdsVENDEDOR: TStringField;
    cdsOUTROS: TStringField;
    qrOUTROS: TStringField;
    cdsINATIVO_CLI: TStringField;
    cdsINATIVO_FOR: TStringField;
    cdsINATIVO_TRANSP: TStringField;
    cdsINATIVO_VEND: TStringField;
    cdsINATIVO_OUTROS: TStringField;
    qrINATIVO_CLI: TStringField;
    qrINATIVO_FOR: TStringField;
    qrINATIVO_TRANSP: TStringField;
    qrINATIVO_VEND: TStringField;
    qrINATIVO_OUTROS: TStringField;
    qrApoio: TSQLQuery;
    tbFaturamento: TTabSheet;
    qrID_VENDEDOR: TIntegerField;
    qrID_TRANSPORTADORA: TIntegerField;
    qrID_SEGMENTO: TIntegerField;
    qrNOME_VENDEDOR: TStringField;
    qrNOME_TRANSPORTADOR: TStringField;
    qrNOME_SEGMENTO: TStringField;
    cdsID_VENDEDOR: TIntegerField;
    cdsNOME_VENDEDOR: TStringField;
    cdsID_TRANSPORTADORA: TIntegerField;
    cdsNOME_TRANSPORTADORA: TStringField;
    cdsID_SEGMENTO: TIntegerField;
    cdsNOME_SEGMENTO: TStringField;
    Label26: TLabel;
    edtNomeTransportadora: TbfdbEdit;
    Label27: TLabel;
    edtNomeVendedor: TbfdbEdit;
    edtCodVendedor: TbfdbEditButton;
    edtCodTransportadora: TbfdbEditButton;
    edtCodSegmento: TbfdbEditButton;
    edtNomeSegmento: TbfdbEdit;
    Label28: TLabel;

    procedure Direitos;
    procedure AbreEnderecos;
    procedure AbreContatos;
    function Pode_Salvar: boolean;
    function ExisteCNPJ: boolean;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);

    procedure btConsultaClick(Sender: TObject);
    procedure dbgConsultaDblClick(Sender: TObject);
    procedure tsConsultaShow(Sender: TObject);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure dbgConsultaKeyPress(Sender: TObject; var Key: Char);

    procedure btIncluiClick(Sender: TObject);
    procedure btSalvaClick(Sender: TObject);
    procedure btDesisteClick(Sender: TObject);
    procedure btExcluiClick(Sender: TObject);
    procedure btSaiClick(Sender: TObject);

    procedure FormKeyPress(Sender: TObject; var Key: Char);

    procedure BeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspUpdateError(Sender: TObject; DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind; var Response: TResolverResponse);
    procedure cdsAfterPost(DataSet: TDataSet);
    procedure cdsBeforePost(DataSet: TDataSet);
    procedure cdsAfterEdit(DataSet: TDataSet);
    procedure cdsAfterInsert(DataSet: TDataSet);
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure cdsAfterCancel(DataSet: TDataSet);
    procedure cdsAfterDelete(DataSet: TDataSet);
    procedure btTransportaClick(Sender: TObject);
    procedure cdsIDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsCNPJGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btConsultaModuloClick(Sender: TObject);
    procedure btImprimeClick(Sender: TObject);
    procedure edtCodCidadeButtonClick(Sender: TObject);
    procedure edtCodCidadeChange(Sender: TObject);
    procedure edtCodCidadeExit(Sender: TObject);
    procedure edtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgConsultaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConsultaChange(Sender: TObject);
    procedure btConsultaCNPJClick(Sender: TObject);
    procedure cdsPESSOAGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure tsCadastroShow(Sender: TObject);
    procedure cdsEnderecosTIPO_ENDERECOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure bfdbGrid1DblClick(Sender: TObject);
    procedure TabSheet1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure bfdbGrid2DblClick(Sender: TObject);
    procedure edtCodPaisButtonClick(Sender: TObject);
    procedure edtCodPaisChange(Sender: TObject);
    procedure edtCodPaisExit(Sender: TObject);
    procedure cdsTIPO_CONTRIBUINTEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cbxPessoaExit(Sender: TObject);
    procedure edtCodVendedorButtonClick(Sender: TObject);
    procedure edtCodVendedorChange(Sender: TObject);
    procedure edtCodVendedorExit(Sender: TObject);
    procedure edtCodTransportadoraButtonClick(Sender: TObject);
    procedure edtCodTransportadoraChange(Sender: TObject);
    procedure edtCodTransportadoraExit(Sender: TObject);
    procedure edtCodSegmentoButtonClick(Sender: TObject);
    procedure edtCodSegmentoChange(Sender: TObject);
    procedure edtCodSegmentoExit(Sender: TObject);

  private
    procedure HabilitaControles;
    { Private declarations }
  public
    cCorBluefield, cCorNormal : tColor;
    sRetorno,
    sEmpresa,
    sUsuario, sPath_Local, sBancoDeDados: string;
    bDBAberto, bModal,
    bCad, bInc, bAlt, bExc : boolean;
    dtmCon : TdtmConexao;
    id, iEmp : integer;
    { Public declarations }
  end;

var
  fmSGC_CLIENTES: TfmSGC_CLIENTES;
const
  sCodProg : string = 'SGC015';

implementation

uses uFuncoesDB, uFuncoes, uFuncoesTelas;

{$R *.dfm}

function SGC015(sOpUsuario, sOpLocal, sOpFiltros, sOpDBSel: pchar; cOpBlueField, cOpNormal : TColor; iEmpresa, iOp: integer; bOpModal: boolean = false): pchar;
begin
  Result := '';
  with TfmSGC_CLIENTES.Create(Application) do
  begin;
    bModal := bOpModal;

    if bModal then
    begin
      FormStyle := fsStayOnTop;
      Visible := false;
//      BorderStyle := bsDialog;
//    Position := poScreenCenter;
    end;
    sUsuario := sOpUsuario;
    sPath_Local := sOpLocal; sBancoDeDados := sOpDBSel;
    cCorBluefield := cOpBlueField;
    cCorNormal := cOpNormal;

     iEmp := iEmpresa;
     sEmpresa := Query(' select * from SGC_EMPRESAS where ID = '+IntToStr(iEmp),sPath_Local,'NOME');

    Direitos;
    //desabilitar em telas com muitos dados
    btConsultaClick(btConsulta);

    if bModal then
    begin
      ShowModal;
      if ModalResult = mrOk
      then result := pchar(sRetorno);
      Release;
    end
    else Show;

  end;
end;

procedure TfmSGC_CLIENTES.btTransportaClick(Sender: TObject);
begin
  if bModal then
  begin
    sRetorno := cdsID.AsString+';'
               +cdsNOME.AsString+';'
               ;

    ModalResult := mrOk;
  end;
end;

function TfmSGC_CLIENTES.ExisteCNPJ: boolean;
begin
  result := false;
  if cbxPessoa.ItemIndex <> 2 then
  begin
    with qrApoio do
    begin
      SQLConnection := dtmCon.SQLDB;
      if active then close;
      SQL.Clear;
      SQL.Add('select * from SGC_PARTICIPANTES');
      SQL.Add('where ID <> '+IntToStr(cdsID.AsInteger)+' ');
      SQL.Add('and CNPJ = '''+cdsCNPJ.AsString+''' ');
      open;
      if not IsEmpty then
      begin
        case cbxPessoa.ItemIndex of
          0 : MessageBox(Handle, pchar('Este CPF já foi cadastrado'), 'Aviso', MB_ICONWARNING);
          1 : MessageBox(Handle, pchar('Este CNPJ já foi cadastrado'), 'Aviso', MB_ICONWARNING);
        end;
        edtCNPJ.SetFocus;
        close;
        result := true;
        exit;
      end;
      close;
    end;
  end;
  //result := false;
end;

procedure TfmSGC_CLIENTES.FormCreate(Sender: TObject);
begin
  bDBAberto := false;
  edtCodCidade.Glyph.LoadFromResourceName(HInstance,'CONS');
  btConsulta.Glyph.LoadFromResourceName(HInstance,'CONS');
  edtCodPais.Glyph.LoadFromResourceName(HInstance,'CONS');
  edtCodVendedor.Glyph.LoadFromResourceName(HInstance,'CONS');
  edtCodTransportadora.Glyph.LoadFromResourceName(HInstance,'CONS');
  edtCodSegmento.Glyph.LoadFromResourceName(HInstance,'CONS');
  btTransporta.Glyph.LoadFromResourceName(HInstance,'DIR');
  btImprime.Glyph.LoadFromResourceName(HInstance,'PRINT');
  btInclui.Glyph.LoadFromResourceName(HInstance,'INC');
  btSalva.Glyph.LoadFromResourceName(HInstance,'SALVA');
  btDesiste.Glyph.LoadFromResourceName(HInstance,'DESIST');
  btExclui.Glyph.LoadFromResourceName(HInstance,'EXC');
  btSai.Glyph.LoadFromResourceName(HInstance,'SAI');
  btEditar.Glyph.LoadFromResourceName(HInstance,'EDIT');

  pgc.ActivePage := tsConsulta;
  if cdsINATIVO_CLI.AsString = 'S' then
  ckbInativo.Checked
end;

procedure TfmSGC_CLIENTES.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if bDBAberto
  then bDBAberto := not FechaDataModule(dtmCon);

  if not bModal then
  begin
    fmSGC_CLIENTES := nil;
    Action := caFree;
  end;  
end;

procedure TfmSGC_CLIENTES.HabilitaControles;
begin
  btInclui.Enabled     := bInc and ( not(cds.State in [dsInsert, dsEdit]));
  btSalva.Enabled   := ((cds.State in [dsInsert]) and bInc)
                    or ((cds.State in [dsEdit]) and bAlt)
                    ;
  cdsCNPJ.ReadOnly := not (cds.State in [dsInsert]);
  cdsPessoa.ReadOnly := not (cds.State in [dsInsert]);
  //BtnEditar.Enabled   := (DSPadrao.DataSet.State in [dsBrowse]);
  btExclui.Enabled  := bExc and (cds.State in [dsBrowse, dsEdit]);
 // btDesiste.Enabled := (cds.State in [dsInsert, dsEdit]);
//  BtnPesquisa.Enabled := not (DSPadrao.DataSet.State in [dsInsert, dsEdit]);
end;

procedure TfmSGC_CLIENTES.edtCodCidadeButtonClick(Sender: TObject);
var
  s : string;
begin
  if cds.Active
  and (not (cds.State in [dsInsert, dsEdit]))
  then cds.Edit;

  s := AbreTela('SGC002','SGC.BPL',sUsuario,sPath_Local,edtCodCidade.Text+';', sBancoDeDados,cCorBluefield,cCorNormal,iEmp, 0,true);
  if (trim(s) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsCOD_CIDADE.AsString := Separa_String(s,1);
    cdsNOME_CIDADE.AsString := Separa_String(s,2);
    cdsUF.AsString := Separa_String(s,3);
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfmSGC_CLIENTES.edtCodCidadeChange(Sender: TObject);
begin
  if edtCodCidade.Focused then edtNomeCidade.Clear;
end;

procedure TfmSGC_CLIENTES.edtCodCidadeExit(Sender: TObject);
begin
//  ChangeExit(DBEdit3);
  if (trim(edtCodCidade.Text) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsNOME_CIDADE.AsString := Query(' select * from sgc_CIDADES where ID = '''+trim(edtCodCidade.Text)+'''  ',sPath_Local,'NOME');
  end;
end;

procedure TfmSGC_CLIENTES.edtCodPaisButtonClick(Sender: TObject);
var
  s : string;
begin
  if cds.Active
  and (not (cds.State in [dsInsert, dsEdit]))
  then cds.Edit;

  s := AbreTela('SGC006','SGC.BPL',sUsuario,sPath_Local,edtCodPais.Text+';', sBancoDeDados,cCorBluefield,cCorNormal,iEmp, 0,true);
  if (trim(s) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsCOD_PAIS.AsString := Separa_String(s,1);
    cdsNOME_PAIS.AsString := Separa_String(s,2);
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfmSGC_CLIENTES.edtCodPaisChange(Sender: TObject);
begin
  if edtCodPais.Focused then edtNomePais.Clear;
end;

procedure TfmSGC_CLIENTES.edtCodPaisExit(Sender: TObject);
begin
//  ChangeExit(DBEdit3);
  if (trim(edtCodPais.Text) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsNOME_PAIS.AsString := Query(' select * from sgc_PAISES where ID = '''+trim(edtCodPais.Text)+'''  ',sPath_Local,'NOME');
  end;
end;

procedure TfmSGC_CLIENTES.edtCodSegmentoButtonClick(Sender: TObject);
var
  s : string;
begin
  if cds.Active
  and (not (cds.State in [dsInsert, dsEdit]))
  then cds.Edit;

  s := AbreTela('SGC009','SGC.BPL',sUsuario,sPath_Local,edtCodSegmento.Text+';'+edtNomeSegmento.Text+';', sBancoDeDados,cCorBluefield,cCorNormal,iEmp, 0,true);
  if (trim(s) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsID_SEGMENTO.AsString := Separa_String(s,1);
    cdsNOME_SEGMENTO.AsString := Separa_String(s,2);
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfmSGC_CLIENTES.edtCodSegmentoChange(Sender: TObject);
begin
  if edtCodSegmento.Focused then edtNomeSegmento.Clear;
end;

procedure TfmSGC_CLIENTES.edtCodSegmentoExit(Sender: TObject);
begin
  if (trim(edtCodSegmento.Text) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsNOME_SEGMENTO.AsString := Query(' select * from sgc_SEGMENTO_CLIENTE where ID = '''+trim(edtCodSegmento.Text)+'''  ',sPath_Local,'DESCRICAO');
  end;
end;

procedure TfmSGC_CLIENTES.edtCodTransportadoraButtonClick(Sender: TObject);
var
  s : string;
begin
  if cds.Active
  and (not (cds.State in [dsInsert, dsEdit]))
  then cds.Edit;

  s := AbreTela('SGC019','SGC.BPL',sUsuario,sPath_Local,edtCodTransportadora.Text+';', sBancoDeDados,cCorBluefield,cCorNormal,iEmp, 0,true);
  if (trim(s) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsID_TRANSPORTADORA.AsString := Separa_String(s,1);
    cdsNOME_TRANSPORTADORA.AsString := Separa_String(s,2);
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;


procedure TfmSGC_CLIENTES.edtCodTransportadoraChange(Sender: TObject);
begin
  if edtCodTransportadora.Focused then edtNomeTransportadora.Clear;
end;

procedure TfmSGC_CLIENTES.edtCodTransportadoraExit(Sender: TObject);
begin
  if (trim(edtCodTransportadora.Text) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsNOME_VENDEDOR.AsString := Query(' select * from sgc_PARTICIPANTES where ID = '''+trim(edtCodVendedor.Text)+'''  ',sPath_Local,'NOME');
  end;
end;

procedure TfmSGC_CLIENTES.edtCodVendedorButtonClick(Sender: TObject);
var
  s : string;
begin
  if cds.Active
  and (not (cds.State in [dsInsert, dsEdit]))
  then cds.Edit;

  s := AbreTela('SGC020','SGC.BPL',sUsuario,sPath_Local,edtCodVendedor.Text+';', sBancoDeDados,cCorBluefield,cCorNormal,iEmp, 0,true);
  if (trim(s) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsID_VENDEDOR.AsString := Separa_String(s,1);
    cdsNOME_VENDEDOR.AsString := Separa_String(s,2);
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfmSGC_CLIENTES.edtCodVendedorChange(Sender: TObject);
begin
  if edtCodVendedor.Focused then edtNomeVendedor.Clear;
end;

procedure TfmSGC_CLIENTES.edtCodVendedorExit(Sender: TObject);
begin
  if (trim(edtCodVendedor.Text) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsNOME_VENDEDOR.AsString := Query(' select * from sgc_PARTICIPANTES where ID = '''+trim(edtCodVendedor.Text)+'''  ',sPath_Local,'NOME');
  end;
end;

procedure TfmSGC_CLIENTES.bfdbGrid1DblClick(Sender: TObject);
var
  s : string;
begin
  if cds.Active
  and (not (cds.State in [dsInsert]))
  then cds.Edit
  else
  exit;

  s := AbreTela('SGC016','SGC.BPL',sUsuario,sPath_Local,cdsID.AsString+';'+cdsNOME.AsString+';'+cdsEnderecosNOME_CIDADE.AsString+';', sBancoDeDados,cCorBluefield,cCorNormal,iEmp, 0,true);
  if (trim(s) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
//    cdsCOD_CIDADE.AsString := Separa_String(s,1);
//    cdsNOME_CIDADE.AsString := Separa_String(s,2);
//    cdsUF.AsString := Separa_String(s,3);
    //Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfmSGC_CLIENTES.bfdbGrid2DblClick(Sender: TObject);
var
  s : string;
begin
  if cds.Active
  and (not (cds.State in [dsInsert]))
  then cds.Edit
  else
  exit;

  s := AbreTela('SGC017','SGC.BPL',sUsuario,sPath_Local,cdsID.AsString+';'+cdsNOME.AsString+';'+cdsContatosCONTATO.AsString+';', sBancoDeDados,cCorBluefield,cCorNormal,iEmp, 0,true);
  if (trim(s) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
//    cdsCOD_CIDADE.AsString := Separa_String(s,1);
//    cdsNOME_CIDADE.AsString := Separa_String(s,2);
//    cdsUF.AsString := Separa_String(s,3);
    //Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;


procedure TfmSGC_CLIENTES.btConsultaClick(Sender: TObject);
begin
  if not bDBAberto
  then
  begin
    dtmCon := TdtmConexao.Create(fmSGC_CLIENTES);
    bDBAberto := AbreDataModule(dtmCon, sPath_Local, sBancoDeDados);
  end;

  if not bDBAberto then exit;
  with qr do
  begin
    SQLConnection := dtmCon.SQLDB;
    if active then close;
    SQL.Clear;
    SQL.Add(' select e.*, c.nome nome_cidade, p.nome NOME_PAIS, v.nome NOME_VENDEDOR');
    SQL.Add(' , t.nome NOME_TRANSPORTADORA, s.descricao NOME_SEGMENTO from SGC_PARTICIPANTES e');
    SQL.Add(' left join SGC_cidades c on c.id = e.cod_cidade ');
    SQL.Add(' left join SGC_paises p on p.id = e.cod_pais');
    SQL.Add(' left join SGC_PARTICIPANTES v on v.ID = e.ID_VENDEDOR');
    SQL.Add(' left join SGC_PARTICIPANTES t on t.ID = e.ID_TRANSPORTADORA');
    SQL.Add(' left join SGC_SEGMENTO_CLIENTE s on s.ID = e.ID_SEGMENTO');
    SQL.Add(' where e.ID > 0 and e.CLIENTE = 1 ');
    if trim(edtConsID.Text) <> ''
    then SQL.Add(' and e.ID = '''+trim(edtConsID.Text)+''' ');
    if trim(edtConsulta.Text) <> ''
    then SQL.Add(' and e.NOME like ''%'+trim(edtConsulta.Text)+'%'' ');
    if trim(edtCNPJCons.Text) <> ''
    then SQL.Add(' and e.CNPJ = '''+trim(edtCNPJCons.Text)+''' ');
    if AnsiUpperCase(trim(edtConsCidade.Text)) <> ''
    then SQL.Add(' and UPPER(c.NOME) like ''%'+trim(edtConsCidade.Text)+'%'' ');
    if  AnsiUpperCase(trim(edtConsUF.Text)) <> ''
    then SQL.Add(' and e.UF = '''+trim(edtConsUF.Text)+''' ');

    if ckbInativoCons.Checked then
    SQL.Add(' and e.INATIVO_CLI = ''S'' ')
    else
    SQL.Add(' and e.INATIVO_CLI <> ''S'' ');
  end;

  if cds.Active
  then cds.Close;

  dbgConsulta.DataSource := ds;
  cds.Open;

  if  (not bModal)
  and (not cds.IsEmpty)
  and (dbgConsulta.CanFocus)
  then dbgConsulta.SetFocus;

  HabilitaControles;
end;

procedure TfmSGC_CLIENTES.btConsultaCNPJClick(Sender: TObject);
var s : string;
begin
  if cbxPessoa.ItemIndex = 1 then
  begin
   //if (cbxPessoa.ItemIndex <> 1)
    if (trim(edtCNPJ.Text) = '')
    then exit;

    s := ConsultaCNPJ(edtCNPJ.Text);

    if trim(s) = '' then exit;
    if (cds.State in [dsInsert, dsEdit])
    and (MessageBox(Handle, pchar('Deseja transportar os dados consultados para o cadastro?'), 'Alimentar dados cadastro', MB_YESNO+MB_ICONQUESTION) = id_yes)
    then
    begin
      cdsNOME.AsString := Separa_String(s,1);
      //edtNome_Fantasia.Text := Separa_String(s,2);
      cdsUF.AsString := Separa_String(s,3);
      cdsNOME_CIDADE.AsString := Separa_String(s,4);
      cdsCOD_CIDADE.AsString :=  Separa_String(s,5);
      cdsENDERECO.AsString := Separa_String(s,6);
      cdsNUMERO.AsString := Separa_String(s,7);
      cdsCOMPLEMENTO.AsString := Separa_String(s,8);
      cdsBAIRRO.AsString := Separa_String(s,9);
      //edtCEP.Text := Separa_String(s,10);
      //if edtCidade.CanFocus then edtCidade.SetFocus;
      //boRecebe := true;
    end;
  end;
end;

procedure TfmSGC_CLIENTES.cdsAfterPost(DataSet: TDataSet);
var
  td : TTransactionDesc;
begin
  td.TransactionID := Cardinal(FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  td.IsolationLevel := xilREADCOMMITTED;
  qr.SQLConnection.StartTransaction(td);
  try
    id := cdsID.AsInteger;
    cds.ApplyUpdates(-1);

    qr.SQLConnection.Commit(td);

    cdsID.ReadOnly := true;
    cds.Refresh;

    HabilitaControles;

    if id > 0
    then cds.Locate('ID',id,[]);
    pgc.ActivePage := tsConsulta;
  except
    on e : Exception do
    begin
      qr.SQLConnection.Rollback(td);
      MessageBox(Handle, pChar('Mensagem do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      cds.Cancel;
      cds.CancelUpdates;
      cds.Refresh;
      HabilitaControles;
      exit;
    end;
  end;
end;

procedure TfmSGC_CLIENTES.cdsBeforePost(DataSet: TDataSet);
begin
  cdsIDALTERADO.AsString := cdsIDALT.AsString;
  if ckbInativo.Checked then
  cdsINATIVO_CLI.AsString := 'S';
  cdsCLIENTE.AsString := '1';
end;

procedure TfmSGC_CLIENTES.cdsAfterEdit(DataSet: TDataSet);
begin
  cdsUSU_ALTERA.AsString := sUsuario;
  cdsDT_ALTERA.AsDateTime := now;
  HabilitaControles;
end;

procedure TfmSGC_CLIENTES.cdsAfterInsert(DataSet: TDataSet);
begin
  cdsUSU_INCLUI.AsString := sUsuario;
  HabilitaControles;
end;

procedure TfmSGC_CLIENTES.dspUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise exception.Create(E.Message);
end;

procedure TfmSGC_CLIENTES.AbreContatos;
begin
  with qrContatos do
  begin
    SQLConnection := dtmCon.SQLDB;
    if active then close;
    SQL.Clear;
    SQL.Add('select c.* from SGC_CONTATOS c');
    SQL.Add('where c.ID > 0 ');
    SQL.Add('and c.ID_PARTICIPANTE = '+IntToStr(cdsID.AsInteger)+' ');
    SQL.Add('and c.INATIVO = ''N'' ');
  end;
  if cdsContatos.Active then cdsContatos.close;
  cdsContatos.Open

end;

procedure TfmSGC_CLIENTES.AbreEnderecos;
begin
  with qrENDERECOS do
  begin
    SQLConnection := dtmCon.SQLDB;
    if active then close;
    SQL.Clear;
    SQL.Add('select e.*, c.nome NOME_CIDADE from SGC_ENDERECOS e');
    SQL.Add('left join SGC_CIDADES c on c.ID = e.COD_CIDADE');
    SQL.Add('where e.ID > 0 ');
    SQL.Add('and e.ID_PARTICIPANTE = '+IntToStr(cdsID.AsInteger)+' ');
    SQL.Add('and e.INATIVO = ''N'' ');
  end;
  if cdsENDERECOS.Active then cdsENDERECOS.close;
  cdsENDERECOS.Open

end;

procedure TfmSGC_CLIENTES.BeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
                                 DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
                                 var Applied: Boolean);
{var
  Campo : TField;
  SQLStmt, Tabela : String;
  CustomSQLDataSet : TCustomSQLDataSet;^}
begin
{não tem autoincremento nos EMPRESAS


  case UpdateKind of
    ukInsert: // Inserindo um registro
    begin
      //showmessage('aqui');
      Campo := DeltaDS.Fields[0];
//      showmessage(campo.FieldName);
      if (Campo.DataType = ftInteger) and Campo.IsNull then
      begin

        Tabela := UpperCase(IProviderSupport(SourceDS).PSGetTableName);
//        showmessage(Tabela);

        SQLStmt := Format('SELECT GEN_ID(GEN_%s_ID, 1) FROM RDB$DATABASE', [Tabela]);

        dtmCon.SQLDB.Execute(SQLStmt, nil, @CustomSQLDataSet);

        if Assigned(CustomSQLDataSet) then
        begin

          DeltaDS.Edit;
          Campo.NewValue := CustomSQLDataSet.Fields[0].AsInteger;
          DeltaDS.Post;
          id := CustomSQLDataSet.Fields[0].AsInteger;
//          showmessage(IntToStr(CustomSQLDataSet.Fields[0].AsInteger));

          SysUtils.FreeAndNil(CustomSQLDataSet);

        end;
      end;
    end;
  end;
  }
end;
procedure TfmSGC_CLIENTES.dbgConsultaDblClick(Sender: TObject);
begin
  if bModal
  and not cds.IsEmpty
  then btTransportaClick(self);
  btIncluiClick(btEditar);
end;


procedure TfmSGC_CLIENTES.cdsNewRecord(DataSet: TDataSet);
begin
  //cdsID.ReadOnly := false;
  HabilitaControles;
  cdsPESSOA.AsString := '2';
  cdsSIMPLES_NACIONAL.AsString := 'S';
  cdsTIPO_CONTRIBUINTE.AsString := '1';
end;

procedure TfmSGC_CLIENTES.cdsPESSOAGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if not Sender.IsNull then
  begin
    if Sender.Value = '1' then
      Text := '1 - FÍSICA';
    if Sender.Value = '2' then
      Text := '2 - JURÍDICA';
    if Sender.Value = '3' then
      Text := '3 - EXTERIOR';
  end;
end;

procedure TfmSGC_CLIENTES.cdsTIPO_CONTRIBUINTEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
  begin
    if Sender.Value = '1' then
      Text := '1 - CONTRIBUINTE';
    if Sender.Value = '2' then
      Text := '2 - CONTRIBUINTE ISENTO';
    if Sender.Value = '9' then
      Text := '9 - NÃO CONTRIBUINTE';
  end;
end;

procedure TfmSGC_CLIENTES.cbxPessoaExit(Sender: TObject);
begin
if cdsPESSOA.AsString <> '2' then btConsultaCNPJ.Enabled := false
else
btConsultaCNPJ.Enabled := true;

if cdsPESSOA.AsString <> '3' then
begin
  edtCodPais.Enabled := false;
  edtNomePais.Enabled := false;
end
else
edtCodPais.Enabled := true;
edtNomePais.Enabled := true;

end;

procedure TfmSGC_CLIENTES.cdsAfterCancel(DataSet: TDataSet);
begin
  cdsID.ReadOnly := true;
  HabilitaControles;
end;

procedure TfmSGC_CLIENTES.cdsAfterDelete(DataSet: TDataSet);
var
  td : TTransactionDesc;
begin
  td.TransactionID := Cardinal(FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  td.IsolationLevel := xilREADCOMMITTED;
  qr.SQLConnection.StartTransaction(td);
  try
//    id := cdsID.AsString;
    cds.ApplyUpdates(-1);

    qr.SQLConnection.Commit(td);

    cdsID.ReadOnly := true;
    cds.Refresh;

    HabilitaControles;
//    cds.Locate('ID',id,[]);
  except
    on e : Exception do
    begin
      qr.SQLConnection.Rollback(td);
      MessageBox(Handle, pChar('Mensagem do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      exit;
    end;
  end;
end;

procedure TfmSGC_CLIENTES.btSalvaClick(Sender: TObject);
begin
  if Pode_Salvar
  then cds.Post;
end;

procedure TfmSGC_CLIENTES.btImprimeClick(Sender: TObject);
begin
 if (not cds.Active) or cds.IsEmpty then exit;

  with RelVisual do
  begin
    TituloRelatorio := Caption;

    Cabecalho1Esquerda := sEmpresa;
    Cabecalho2Centro := '';
    if (edtConsulta.Text <> '') or (edtCNPJCons.Text <> '') then
    Cabecalho3Esquerda := ('Filtrando por: '+edtConsulta.Text+'  CNPJ: '+edtCNPJCons.Text);

    Cabecalhos.Clear;

    Limpa_Campos;
    DefinicaoCampos.Add('D2;20;E;;ID;ID');
    DefinicaoCampos.Add('D0;100;E;;NOME;Descrição');
    DefinicaoCampos.Add('D0;50;D;;CNPJ;CNPJ');
    Execute;
  end;



  end;

procedure TfmSGC_CLIENTES.btIncluiClick(Sender: TObject);
begin
  if not cds.Active then exit;
  if not bCad then Exit;
  if (TBitBtn(sender).Tag = 1)
  then if (bInc)
       then cds.Insert
       else exit;
  pgc.ActivePage := tsCadastro;
  cbxPessoa.SetFocus;
  HabilitaControles;
  if cdsINATIVO_CLI.AsString <> 'S' then
  ckbInativo.Checked := false;
end;

procedure TfmSGC_CLIENTES.btDesisteClick(Sender: TObject);
begin
  if cds.State in [dsInsert, dsEdit]
  then cds.Cancel;
  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGC_CLIENTES.btExcluiClick(Sender: TObject);
begin
 MessageBox(Handle, pchar('Não é possível excluir, apenas inativar'), 'Aviso', MB_ICONWARNING);
 //Exit;
//  cds.delete;
//  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGC_CLIENTES.btSaiClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSGC_CLIENTES.tsCadastroShow(Sender: TObject);
begin
AbreEnderecos;
AbreContatos;
pgcDados.ActivePage := tbDocumentos;
end;

procedure TfmSGC_CLIENTES.tsConsultaShow(Sender: TObject);
begin
  if cds.State in [dsInsert, dsEdit]
  then cds.Cancel;

  if  (not cds.IsEmpty)
  and (dbgConsulta.CanFocus)
  then dbgConsulta.SetFocus
  else if edtConsulta.CanFocus
       then edtConsulta.SetFocus;
end;

procedure TfmSGC_CLIENTES.edtConsultaChange(Sender: TObject);
begin
if cds.Active then cds.Close;

end;

procedure TfmSGC_CLIENTES.edtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_down then dbgConsulta.SetFocus;

end;

procedure TfmSGC_CLIENTES.edtConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = chr(vk_return) then btConsultaClick(self);
end;

procedure TfmSGC_CLIENTES.dbgConsultaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = chr(vk_return) then
  begin
    dbgConsultaDblClick(self);
  end;
end;

procedure TfmSGC_CLIENTES.dbgConsultaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_f9 then edtConsulta.SetFocus;
end;

procedure TfmSGC_CLIENTES.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = chr(vk_escape) then
  begin
    if btDesiste.Enabled
    then btDesisteClick(self)
    else if bModal
         then btSaiClick(self);
  end;
end;

procedure TfmSGC_CLIENTES.Direitos;
var
  s : string;
begin
  bCad := false;
  bInc := false;
  bAlt := false;
  bExc := false;

  if not bDBAberto
  then
  begin
    dtmCon := TdtmConexao.Create(fmSGC_CLIENTES);
    bDBAberto := AbreDataModule(dtmCon, sPath_Local, sBancoDeDados);
  end;


  s := DireitosUsuario(sUsuario,sCodProg,dtmCon.qrApoio);
  if trim(s) <> '' then
  begin
    bCad := Separa_String(s,1) = 'S';
    bInc := Separa_String(s,2) = 'S';
    bAlt := Separa_String(s,3) = 'S';
    bExc := Separa_String(s,4) = 'S';
  end;

  btExclui.Visible := bExc;
  btInclui.Enabled := bCad and bInc;
  btEditar.Enabled := bCad;
  tsCadastro.TabVisible := bCad;
  btTransporta.Visible := bModal;

  if not bExc
  then dsp.Options := dsp.Options + [poDisableDeletes];
  if not bInc
  then dsp.Options := dsp.Options + [poDisableInserts];
  if not bAlt
  then dsp.Options := dsp.Options + [poDisableEdits];
end;

(******************************************************************************)

function TfmSGC_CLIENTES.Pode_Salvar: boolean;
begin
  result := false;

  if trim(cdsPessoa.AsString) = ''  then
  begin
    MessageBox(Handle, pchar('Informe o Tipo.'), 'Aviso', MB_ICONWARNING);
    cbxPessoa.SetFocus;
    Exit;
  end;

  if (trim(cdsCNPJ.AsString) = '') and  (cbxPessoa.ItemIndex <> 2)  then
  begin
    MessageBox(Handle, pchar('Informe o CPF ou CNPJ.'), 'Aviso', MB_ICONWARNING);
    edtCNPJ.SetFocus;
    Exit;
  end;

  case cbxPessoa.ItemIndex of
  0 : begin
        if not Valida_CPF(cdsCNPJ.AsString) then
        begin
          MessageBox(Handle, pchar('CPF informado não é válido!'), 'Aviso', MB_ICONWARNING);
          edtCNPJ.SetFocus;
          Exit;
        end;
      end;

  1 : begin
        if not Valida_CGC(cdsCNPJ.AsString) then
        begin
          MessageBox(Handle, pchar('CNPJ informado não é válido!'), 'Aviso', MB_ICONWARNING);
          edtCNPJ.SetFocus;
          Exit;
        end;
      end;
  end;

 // if ExisteCNPJ then exit;  //essa função funciona, descomentar quando for para valer

  if trim(cdsNOME.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe o Nome.'), 'Aviso', MB_ICONWARNING);
    edtNome.SetFocus;
    Exit;
  end;

  if cbxPessoa.ItemIndex = 2 then
  begin
    if cdsCOD_PAIS.AsString = '' then
    begin
       MessageBox(Handle, pchar('Informe o País.'), 'Aviso', MB_ICONWARNING);
       edtCodPais.SetFocus;
       Exit;
    end;

    cdsCOD_CIDADE.AsInteger := 0;
    edtCodCidadeExit(self);
    cdsUF.AsString := 'EX';

    if trim(cdsENDERECO.AsString) = '' then
    begin
      MessageBox(Handle, pchar('Informe o Endereço.'), 'Aviso', MB_ICONWARNING);
      edtEndereco.SetFocus;
      Exit;
    end;

    if trim(cdsNUMERO.AsString) = '' then
    begin
      MessageBox(Handle, pchar('Informe o Número.'), 'Aviso', MB_ICONWARNING);
      edtNumero.SetFocus;
      Exit;
    end;

    if trim(cdsBAIRRO.AsString) = '' then
    begin
      MessageBox(Handle, pchar('Informe o Bairro.'), 'Aviso', MB_ICONWARNING);
      edtBairro.SetFocus;
      Exit;
    end;

    if cdsCEP.AsString = '' then
    begin
      MessageBox(Handle, pchar('Informe o CEP.'), 'Aviso', MB_ICONWARNING);
      edtCEP.SetFocus;
      Exit;
    end;

    if cdsCOD_PAIS.AsInteger = 105 then
    begin
       MessageBox(Handle, pchar('Cliente estrangeiro não pode ser Brasileiro.'), 'Aviso', MB_ICONWARNING);
       edtCodPais.SetFocus;
       Exit;
    end;

    if trim(cdsMAIL.AsString) = '' then
    begin
      MessageBox(Handle, pchar('Informe o Email.'), 'Aviso', MB_ICONWARNING);
      edtEmail.SetFocus;
      Exit;
    end;

    if trim(cdsFONE.AsString) = '' then
    begin
      MessageBox(Handle, pchar('Informe o Telefone.'), 'Aviso', MB_ICONWARNING);
      edtFone.SetFocus;
      Exit;
    end;

    if trim(cdsSIMPLES_NACIONAL.AsString) = '' then
    begin
      MessageBox(Handle, pchar('Informe se o Cliente faz parte do Simples Nacional.'), 'Aviso', MB_ICONWARNING);
      cbxSimplesNacional.SetFocus;
      Exit;
    end;

    if trim(cdsTIPO_CONTRIBUINTE.AsString) = '' then
    begin
      MessageBox(Handle, pchar('Informe o Tipo de Contribuição do Cliente.'), 'Aviso', MB_ICONWARNING);
      cbxTipoContribuinte.SetFocus;
      Exit;
    end;

    if (cdsTIPO_CONTRIBUINTE.AsString = '1') and (cdsINSC_EST.AsString = '') then
    begin
      MessageBox(Handle, pchar('Informe a Inscrição Estadual.'), 'Aviso', MB_ICONWARNING);
      edtInscEstadual.SetFocus;
      Exit;
    end;


  end
  else
  begin


    if cdsCOD_CIDADE.AsString = '' then
    begin
      MessageBox(Handle, pchar('Informe a Cidade.'), 'Aviso', MB_ICONWARNING);
      edtCodCidade.SetFocus;
      Exit;
    end;

    if trim(cdsUF.AsString) = '' then
    begin
      MessageBox(Handle, pchar('Informe a UF.'), 'Aviso', MB_ICONWARNING);
      edtUF.SetFocus;
      Exit;
    end;

    if trim(cdsENDERECO.AsString) = '' then
    begin
      MessageBox(Handle, pchar('Informe o Endereço.'), 'Aviso', MB_ICONWARNING);
      edtEndereco.SetFocus;
      Exit;
    end;

    if trim(cdsNUMERO.AsString) = '' then
    begin
      MessageBox(Handle, pchar('Informe o Número.'), 'Aviso', MB_ICONWARNING);
      edtNumero.SetFocus;
      Exit;
    end;

    if trim(cdsBAIRRO.AsString) = '' then
    begin
      MessageBox(Handle, pchar('Informe o Bairro.'), 'Aviso', MB_ICONWARNING);
      edtBairro.SetFocus;
      Exit;
    end;

    if cdsCEP.AsString = '' then
    begin
      MessageBox(Handle, pchar('Informe o CEP.'), 'Aviso', MB_ICONWARNING);
      edtCEP.SetFocus;
      Exit;
    end;

    cdsCOD_PAIS.AsInteger := 105;
    cdsNOME_PAIS.AsString := 'Brasil';

    if trim(cdsMAIL.AsString) = '' then
    begin
      MessageBox(Handle, pchar('Informe o Email.'), 'Aviso', MB_ICONWARNING);
      edtEmail.SetFocus;
      Exit;
    end;

    if trim(cdsFONE.AsString) = '' then
    begin
      MessageBox(Handle, pchar('Informe o Telefone.'), 'Aviso', MB_ICONWARNING);
      edtFone.SetFocus;
      Exit;
    end;

    if trim(cdsSIMPLES_NACIONAL.AsString) = '' then
    begin
      MessageBox(Handle, pchar('Informe se o Cliente faz parte do Simples Nacional.'), 'Aviso', MB_ICONWARNING);
      cbxSimplesNacional.SetFocus;
      Exit;
    end;

    if trim(cdsTIPO_CONTRIBUINTE.AsString) = '' then
    begin
      MessageBox(Handle, pchar('Informe o Tipo de Contribuição do Cliente.'), 'Aviso', MB_ICONWARNING);
      cbxTipoContribuinte.SetFocus;
      Exit;
    end;

    if (cdsTIPO_CONTRIBUINTE.AsString = '1') and (cdsINSC_EST.AsString = '') then
    begin
      MessageBox(Handle, pchar('Informe a Inscrição Estadual.'), 'Aviso', MB_ICONWARNING);
      edtInscEstadual.SetFocus;
      Exit;
    end;


  end;

  result := true;
end;

procedure TfmSGC_CLIENTES.TabSheet1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin

end;

(******************************************************************************)

procedure TfmSGC_CLIENTES.cdsIDGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if cds.State in [dsInsert]
  then Text := 'Automático'
  else Text := cdsID.AsString;
end;

procedure TfmSGC_CLIENTES.cdsCNPJGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if cds.State  in [dsEdit]    //antes tava com o insert tb, assim só na edição ele perde a máscara
  then Text := cdsCNPJ.AsString
  else Text := CgcCpfPic(cdsCNPJ.AsString);
end;

procedure TfmSGC_CLIENTES.cdsEnderecosTIPO_ENDERECOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
  begin
    if Sender.Value = '01' then
      Text := '01 - COBRANÇA';
    if Sender.Value = '02' then
      Text := '02 - ENTREGA';
  end;
end;

procedure TfmSGC_CLIENTES.btConsultaModuloClick(Sender: TObject);
begin
end;
//exports tem que ser a ultima coisa antes do end.
exports
  SGC015;

end.
