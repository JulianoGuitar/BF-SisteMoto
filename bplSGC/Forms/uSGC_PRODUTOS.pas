unit uSGC_PRODUTOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, bfdbGrid, DB, DBClient, Provider, FMTBcd,
  SqlExpr, ExtCtrls, DBCtrls, Mask, udtmConexao, ComCtrls,
  Buttons, bfEdit, bfdbEdit, DBGrids, bfdbMemo, RelVisualBlue, bfdbComboBox,
  bfdbEditButton, DBXPRESS;

type
  TfmSGC_PRODUTOS = class(TForm)
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
    qrUSU_INCLUI: TStringField;
    qrUSU_ALTERA: TStringField;
    qrDT_ALTERA: TSQLTimeStampField;
    qrIDALT: TStringField;
    qrIDALTERADO: TStringField;
    cdsUSU_INCLUI: TStringField;
    cdsUSU_ALTERA: TStringField;
    cdsDT_ALTERA: TSQLTimeStampField;
    cdsIDALT: TStringField;
    cdsIDALTERADO: TStringField;
    Label2: TLabel;
    edtNomeProd: TbfdbEdit;
    btTransporta: TBitBtn;
    btImprime: TBitBtn;
    RelVisual: TRelVisualBlue;
    edtConsultaNOME: TbfEdit;
    qrID: TIntegerField;
    qrDT_INCLUI: TSQLTimeStampField;
    cdsID: TIntegerField;
    cdsDT_INCLUI: TSQLTimeStampField;
    ckbInativoCons: TCheckBox;
    qrINATIVO: TStringField;
    cdsINATIVO: TStringField;
    ckbInativo: TDBCheckBox;
    qrCOD_PROD: TStringField;
    qrNOME: TStringField;
    qrID_GRUPO: TIntegerField;
    qrUNIDADE: TStringField;
    qrID_FAMILIA: TIntegerField;
    qrREF_FAB: TStringField;
    qrFABRICANTE: TStringField;
    qrCUSTO_REP: TFMTBCDField;
    qrMOEDA: TStringField;
    qrLOCAL_ALMOX: TStringField;
    qrPALAVRAS_CHAVE: TStringField;
    qrNCM: TStringField;
    qrNCM_EXCESSAO: TStringField;
    qrORIGEM_MERCADORIA: TStringField;
    qrTIPO_ITEM: TStringField;
    qrGTIN: TStringField;
    qrFICHA_TECNICA: TStringField;
    qrCONTROLE_PF: TStringField;
    qrPESO_LIQ: TFMTBCDField;
    qrPESO_BRU: TFMTBCDField;
    qrEMBALAGEM: TFMTBCDField;
    cdsCOD_PROD: TStringField;
    cdsNOME: TStringField;
    cdsID_GRUPO: TIntegerField;
    cdsUNIDADE: TStringField;
    cdsID_FAMILIA: TIntegerField;
    cdsREF_FAB: TStringField;
    cdsFABRICANTE: TStringField;
    cdsCUSTO_REP: TFMTBCDField;
    cdsMOEDA: TStringField;
    cdsLOCAL_ALMOX: TStringField;
    cdsPALAVRAS_CHAVE: TStringField;
    cdsNCM: TStringField;
    cdsNCM_EXCESSAO: TStringField;
    cdsORIGEM_MERCADORIA: TStringField;
    cdsTIPO_ITEM: TStringField;
    cdsGTIN: TStringField;
    cdsFICHA_TECNICA: TStringField;
    cdsCONTROLE_PF: TStringField;
    cdsPESO_LIQ: TFMTBCDField;
    cdsPESO_BRU: TFMTBCDField;
    cdsEMBALAGEM: TFMTBCDField;
    Label3: TLabel;
    edtCodProd: TbfdbEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cdsNOME_GRUPO: TStringField;
    cdsNOME_FAMILIA: TStringField;
    Label7: TLabel;
    edtNomeFamilia: TbfdbEdit;
    Label8: TLabel;
    edtNomeGrupo: TbfdbEdit;
    qrNOME_FAMILIA: TStringField;
    qrNOME_GRUPO: TStringField;
    Label9: TLabel;
    edtRefFab: TbfdbEdit;
    Label12: TLabel;
    edtLocalAlmox: TbfdbEdit;
    pgcDados: TPageControl;
    tbTributacao: TTabSheet;
    tbFichaTecnica: TTabSheet;
    Label13: TLabel;
    edtNCM: TbfdbEdit;
    Label14: TLabel;
    edtNCMExcessao: TbfdbEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtGTIN: TbfdbEdit;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    edtUnidade: TbfdbEditButton;
    edtCodGrupo: TbfdbEditButton;
    edtCodFamilia: TbfdbEditButton;
    cbxOrigemMercadoria: TbfdbComboBox;
    cbxTipoItem: TbfdbComboBox;
    memFichaTecnica: TbfdbMemo;
    ckbControlePF: TDBCheckBox;
    Label11: TLabel;
    cbxMoeda: TbfdbComboBox;
    Label1: TLabel;
    edtFabricante: TbfdbEdit;
    edtConsNCM: TbfEdit;
    Label10: TLabel;
    edtCustoRep: TbfdbEdit;

    procedure Direitos;
    function Pode_Salvar: boolean;

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
    procedure btImprimeClick(Sender: TObject);
    procedure edtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgConsultaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConsultaChange(Sender: TObject);
    procedure cdsIDGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure edtUnidadeButtonClick(Sender: TObject);
    procedure edtCodGrupoButtonClick(Sender: TObject);
    procedure edtCodGrupoChange(Sender: TObject);
    procedure edtCodGrupoExit(Sender: TObject);
    procedure edtCodFamiliaButtonClick(Sender: TObject);
    procedure edtCodFamiliaChange(Sender: TObject);
    procedure edtCodFamiliaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsORIGEM_MERCADORIAGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsTIPO_ITEMGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);

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
    //id : string;
    iEmp, id : integer;
    { Public declarations }
  end;

var
  fmSGC_PRODUTOS: TfmSGC_PRODUTOS;
const
  sCodProg : string = 'SGC030';

implementation

uses uFuncoesDB, uFuncoes, uFuncoesTelas;

{$R *.dfm}

function SGC030(sOpUsuario, sOpLocal, sOpFiltros, sOpDBSel: pchar; cOpBlueField, cOpNormal : TColor; iEmpresa, iOp: integer; bOpModal: boolean = false): pchar;
begin
  Result := '';
  with TfmSGC_PRODUTOS.Create(Application) do
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
    edtConsulta.Text := Separa_String(sOpFiltros,1);
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

procedure TfmSGC_PRODUTOS.btTransportaClick(Sender: TObject);
begin
  if bModal then
  begin
    sRetorno := cdsID.AsString+';'
               +cdsCOD_PROD.AsString+';'
               +cdsNOME.AsString+';'
               +cdsID_FAMILIA.AsString+';'
               +cdsNOME_FAMILIA.AsString+';'
               +cdsUNIDADE.AsString+';'
               +FormatFloat('0.00',cdsCUSTO_REP.AsFloat)+';'
               ;

    ModalResult := mrOk;
  end;
end;

procedure TfmSGC_PRODUTOS.FormCreate(Sender: TObject);
begin
  bDBAberto := false;

  btConsulta.Glyph.LoadFromResourceName(HInstance,'CONS');
  edtCodGrupo.Glyph.LoadFromResourceName(HInstance,'CONS');
  edtCodFamilia.Glyph.LoadFromResourceName(HInstance,'CONS');
  edtUnidade.Glyph.LoadFromResourceName(HInstance,'CONS');
  btTransporta.Glyph.LoadFromResourceName(HInstance,'DIR');
  btImprime.Glyph.LoadFromResourceName(HInstance,'PRINT');
  btInclui.Glyph.LoadFromResourceName(HInstance,'INC');
  btSalva.Glyph.LoadFromResourceName(HInstance,'SALVA');
  btDesiste.Glyph.LoadFromResourceName(HInstance,'DESIST');
  btExclui.Glyph.LoadFromResourceName(HInstance,'EXC');
  btSai.Glyph.LoadFromResourceName(HInstance,'SAI');
  btEditar.Glyph.LoadFromResourceName(HInstance,'EDIT');

  pgc.ActivePage := tsConsulta;
  if cdsINATIVO.AsString = 'S' then
  ckbInativo.Checked;
  if cdsCONTROLE_PF.AsString = 'S' then
  ckbControlePF.Checked;
end;

procedure TfmSGC_PRODUTOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if bDBAberto
  then bDBAberto := not FechaDataModule(dtmCon);

  if not bModal then
  begin
    fmSGC_PRODUTOS := nil;
    Action := caFree;
  end;
end;

procedure TfmSGC_PRODUTOS.HabilitaControles;
begin
  btInclui.Enabled     := bInc and ( not(cds.State in [dsInsert, dsEdit]));
  btSalva.Enabled   := ((cds.State in [dsInsert]) and bInc)
                    or ((cds.State in [dsEdit]) and bAlt)
                    ;
  //BtnEditar.Enabled   := (DSPadrao.DataSet.State in [dsBrowse]);
  btExclui.Enabled  := bExc and (cds.State in [dsBrowse, dsEdit]);
 // btDesiste.Enabled := (cds.State in [dsInsert, dsEdit]);
//  BtnPesquisa.Enabled := not (DSPadrao.DataSet.State in [dsInsert, dsEdit]);
end;

procedure TfmSGC_PRODUTOS.btConsultaClick(Sender: TObject);
begin
  if not bDBAberto
  then
  begin
    dtmCon := TdtmConexao.Create(fmSGC_PRODUTOS);
    bDBAberto := AbreDataModule(dtmCon, sPath_Local, sBancoDeDados);
  end;

  if not bDBAberto then exit;
  with qr do
  begin
    SQLConnection := dtmCon.SQLDB;
    if active then close;
    SQL.Clear;
    SQL.Add(' select p.*, f.nome NOME_FAMILIA');
    SQL.Add(' ,g.cod_grupo || '' '' || g.sub_grupo || '' '' || g.descricao NOME_GRUPO');
    SQL.Add(' from SGC_PRODUTOS p');
    SQL.Add(' left join SGC_FAMILIA_PROD f on f.ID = p.ID_FAMILIA ');
    SQL.Add(' left join SGC_UNIDADES u on u.UNIDADE = p.UNIDADE');
    SQL.Add(' left join SGC_GRUPO_PRODUTOS g on g.ID = p.ID_GRUPO');
    SQL.Add(' where p.ID > 0 ');

    if trim(edtConsulta.Text) <> ''
    then SQL.Add(' and p.COD_PROD = '''+trim(edtConsulta.Text)+''' ');
    if trim(edtConsultaNOME.Text) <> ''
    then SQL.Add(' and p.nome like ''%'+trim(edtConsultaNOME.Text)+'%'' ');
    if trim(edtConsNCM.Text) <> ''
    then SQL.Add(' and p.NCM = '''+trim(edtConsNCM.Text)+''' ');

    if ckbInativoCons.Checked then
    SQL.Add(' and p.INATIVO = ''S'' ')
    else
    SQL.Add(' and p.INATIVO <> ''S'' ');
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

procedure TfmSGC_PRODUTOS.cdsAfterPost(DataSet: TDataSet);
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
    then
    cds.Locate('ID',id,[]);
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

procedure TfmSGC_PRODUTOS.cdsBeforePost(DataSet: TDataSet);
begin
  cdsIDALTERADO.AsString := cdsIDALT.AsString;
  if ckbInativo.Checked then
  cdsINATIVO.AsString := 'S';
  if ckbControlePF.Checked then
  cdsCONTROLE_PF.AsString := 'S';
end;

procedure TfmSGC_PRODUTOS.cdsIDGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
if cds.State in [dsInsert]
  then Text := 'Automático'
  else Text := cdsID.AsString;
end;

procedure TfmSGC_PRODUTOS.cdsAfterEdit(DataSet: TDataSet);
begin
  cdsUSU_ALTERA.AsString := sUsuario;
  cdsDT_ALTERA.AsDateTime := now;
  HabilitaControles;
end;

procedure TfmSGC_PRODUTOS.cdsAfterInsert(DataSet: TDataSet);
begin
  cdsUSU_INCLUI.AsString := sUsuario;
  HabilitaControles;
end;

procedure TfmSGC_PRODUTOS.dspUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise exception.Create(E.Message);
end;

procedure TfmSGC_PRODUTOS.BeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
                                 DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
                                 var Applied: Boolean);
{var
  Campo : TField;
  SQLStmt, Tabela : String;
  CustomSQLDataSet : TCustomSQLDataSet;^}
begin
{não tem autoincremento nos CODIGO
s


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
procedure TfmSGC_PRODUTOS.dbgConsultaDblClick(Sender: TObject);
begin
  if bModal
  and not cds.IsEmpty
  then btTransportaClick(self);
  btIncluiClick(btEditar);
end;

procedure TfmSGC_PRODUTOS.cdsNewRecord(DataSet: TDataSet);
begin
  cdsID.ReadOnly := false;
  HabilitaControles;
  cdsMOEDA.AsString := 'REAL';
  cdsORIGEM_MERCADORIA.AsString := '0';
  cdsTIPO_ITEM.AsString := '00';
  cdsNCM.AsString := '999999';
  cdsUNIDADE.AsString := 'UN';
  cdsCUSTO_REP.AsFloat := 0;
  cdsPESO_BRU.AsFloat := 0;
  cdsPESO_LIQ.AsFloat := 0;
  cdsEMBALAGEM.AsFloat := 0;
end;

procedure TfmSGC_PRODUTOS.cdsORIGEM_MERCADORIAGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
  begin
    if Sender.Value = '0' then
      Text := '0 - NACIONAL, EXCETO AS INDICADAS NOS CÓDIGOS 3, 4, 5 E 8';
    if Sender.Value = '1' then
      Text := '1 - ESTRANGEIRA - IMPORTAÇÃO DIRETA, EXCETO A INDICADA NO CÓDIGO 6';
    if Sender.Value = '2' then
      Text := '2 - ESTRANGEIRA - ADQUIRIDA NO MERCADO INTERNO, EXCETO A INDICADA NO CÓDIGO 7';
    if Sender.Value = '3' then
      Text := '3 - NACIONAL, MERCADORIA OU BEM COM CONTEÚDO DE IMPORTAÇÃO SUPERIOR A 40% E INFERIOR OU IGUAL A 70%';
    if Sender.Value = '4' then
      Text := '4 - NACIONAL, CUJA PRODUÇÃO TENHA SIDO FEITA EM CONFORMIDADE COM OS PROCESSOS PRODUTIVOS BÁSICOS DE QUE TRATAM O DECRETO-LEI Nº 288/67, E AS LEIS NºS 8.248/91, 8.387/91, 10.176/01 E 11.484/07';
    if Sender.Value = '5' then
      Text := '5 - NACIONAL, MERCADORIA OU BEM COM CONTEÚDO DE IMPORTAÇÃO INFERIOR OU IGUAL A 40%';
    if Sender.Value = '6' then
      Text := '6 - ESTRANGEIRA - IMPORTAÇÃO DIRETA, SEM SIMILAR NACIONAL, CONSTANTE EM LISTA DE RESOLUÇÃO CAMEX';
    if Sender.Value = '7' then
      Text := '7 - ESTRANGEIRA - ADQUIRIDA NO MERCADO INTERNO, SEM SIMILAR NACIONAL, CONSTANTE EM LISTA DE RESOLUÇÃO CAMEX';
    if Sender.Value = '8' then
      Text := '8 - NACIONAL, MERCADORIA OU BEM COM CONTEÚDO DE IMPORTAÇÃO SUPERIOR A 70% (SETENTA POR CENTO). (AJUSTE SINIEF 15/2013 VIG.01/08/2013)';

  end;
end;

procedure TfmSGC_PRODUTOS.cdsTIPO_ITEMGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if not Sender.IsNull then
  begin
    if Sender.Value = '00' then
      Text := '00 - MERCADORIA PARA REVENDA';
    if Sender.Value = '01' then
      Text := '01 - MATÉRIA-PRIMA';
    if Sender.Value = '02' then
      Text := '02 - EMBALAGEM';
    if Sender.Value = '03' then
      Text := '03 - PRODUTO EM PROCESSO';
    if Sender.Value = '04' then
      Text := '04 - PRODUTO ACABADO';
    if Sender.Value = '05' then
      Text := '05 - SUBPRODUTO';
    if Sender.Value = '06' then
      Text := '06 - PRODUTO INTERMEDIÁRIO';
    if Sender.Value = '07' then
      Text := '07 - MATERIAL DE USO E CONSUMO';
    if Sender.Value = '08' then
      Text := '08 - ATIVO IMOBILIZADO';
    if Sender.Value = '09' then
      Text := '09 - SERVIÇOS';
    if Sender.Value = '10' then
      Text := '10 - OUTROS INSUMOS';
    if Sender.Value = '99' then
      Text := '99 - OUTRAS';
  end;
end;

procedure TfmSGC_PRODUTOS.cdsAfterCancel(DataSet: TDataSet);
begin
  cdsID.ReadOnly := true;
  HabilitaControles;
end;

procedure TfmSGC_PRODUTOS.cdsAfterDelete(DataSet: TDataSet);
var
  td : TTransactionDesc;
begin
  td.TransactionID := Cardinal(FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  td.IsolationLevel := xilREADCOMMITTED;
  qr.SQLConnection.StartTransaction(td);
  try
//    id := cdsCODIGO.AsString;
    cds.ApplyUpdates(-1);

    qr.SQLConnection.Commit(td);

    cdsID.ReadOnly := true;
    cds.Refresh;

    HabilitaControles;
//    cds.Locate('CODIGO',id,[]);
  except
    on e : Exception do
    begin
      qr.SQLConnection.Rollback(td);
      MessageBox(Handle, pChar('Mensagem do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      exit;
    end;
  end;
end;

procedure TfmSGC_PRODUTOS.btSalvaClick(Sender: TObject);
begin
  if Pode_Salvar
  then cds.Post;
end;

procedure TfmSGC_PRODUTOS.btImprimeClick(Sender: TObject);
begin
 if (not cds.Active) or cds.IsEmpty then exit;

  with RelVisual do
  begin
    TituloRelatorio := Caption;

    Cabecalho1Esquerda := sEmpresa;
    Cabecalho2Centro := '';
    if (edtConsulta.Text <> '') or (edtConsultaNOME.Text <> '') then
    Cabecalho3Esquerda := ('Filtrando por: '+edtConsulta.Text+' Descrição: '+edtConsultaNOME.Text);

    Cabecalhos.Clear;

    Limpa_Campos;
    DefinicaoCampos.Add('D2;20;E;;ID;ID');
    DefinicaoCampos.Add('D0;100;E;;DESCRICAO;Descrição');
    DefinicaoCampos.Add('D0;40;E;;TIPO_ES;Tipo');
    DefinicaoCampos.Add('D0;40;E;;CALCULA_CUSTO;Calc.Custo');
    Execute;
  end;



  end;

procedure TfmSGC_PRODUTOS.btIncluiClick(Sender: TObject);
begin
  if not cds.Active then exit;
  if not bCad then Exit;
  if (TBitBtn(sender).Tag = 1)
  then if (bInc)
       then cds.Insert
       else exit;
  pgc.ActivePage := tsCadastro;
  edtCodProd.SetFocus;
  HabilitaControles;
  if cdsINATIVO.AsString <> 'S' then
  ckbInativo.Checked := false;
  if cdsCONTROLE_PF.AsString <> 'S' then
  ckbControlePF.Checked := false;
end;

procedure TfmSGC_PRODUTOS.btDesisteClick(Sender: TObject);
begin
  if cds.State in [dsInsert, dsEdit]
  then cds.Cancel;
  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGC_PRODUTOS.btExcluiClick(Sender: TObject);
begin
  if MessageBox(Handle, pchar('Confirma a exclusão deste registro ?'), 'Excluir', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = id_no
  then Exit;
  cds.delete;
  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGC_PRODUTOS.btSaiClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSGC_PRODUTOS.tsConsultaShow(Sender: TObject);
begin
  if cds.State in [dsInsert, dsEdit]
  then cds.Cancel;

  if  (not cds.IsEmpty)
  and (dbgConsulta.CanFocus)
  then dbgConsulta.SetFocus
  else if edtConsulta.CanFocus
       then edtConsulta.SetFocus;
end;

procedure TfmSGC_PRODUTOS.edtCodFamiliaButtonClick(Sender: TObject);
var
  s : string;
begin
  if cds.Active
  and (not (cds.State in [dsInsert, dsEdit]))
  then cds.Edit;

  s := AbreTela('SGC021','SGC.BPL',sUsuario,sPath_Local,edtCodFamilia.Text+';'+edtNomeFamilia.Text+';', sBancoDeDados,cCorBluefield,cCorNormal,iEmp, 0,true);
  if (trim(s) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsID_FAMILIA.AsString := Separa_String(s,1);
    cdsNOME_FAMILIA.AsString := Separa_String(s,2);
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfmSGC_PRODUTOS.edtCodFamiliaChange(Sender: TObject);
begin
  if edtCodFamilia.Focused then edtNomeFamilia.Clear;
end;

procedure TfmSGC_PRODUTOS.edtCodFamiliaExit(Sender: TObject);
begin
  if (trim(edtCodFamilia.Text) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsNOME_FAMILIA.AsString := Query(' select * from sgc_FAMILIA_PROD where ID = '''+trim(edtCodFamilia.Text)+'''  ',sPath_Local,'NOME');
  end;
end;

procedure TfmSGC_PRODUTOS.edtCodGrupoButtonClick(Sender: TObject);
var
  s : string;
begin
  if cds.Active
  and (not (cds.State in [dsInsert, dsEdit]))
  then cds.Edit;

  s := AbreTela('SGC012','SGC.BPL',sUsuario,sPath_Local,edtCodGrupo.Text+';'+edtNomeGrupo.Text+';', sBancoDeDados,cCorBluefield,cCorNormal,iEmp, 0,true);
  if (trim(s) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsID_GRUPO.AsString := Separa_String(s,1);
    cdsNOME_GRUPO.AsString := Separa_String(s,2);
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;


procedure TfmSGC_PRODUTOS.edtCodGrupoChange(Sender: TObject);
begin
  if edtCodGrupo.Focused then edtNomeGrupo.Clear;
end;

procedure TfmSGC_PRODUTOS.edtCodGrupoExit(Sender: TObject);
begin
  if (trim(edtCodGrupo.Text) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsNOME_GRUPO.AsString := Query(' select * from sgc_GRUPO_PRODUTOS where ID = '''+trim(edtCodGrupo.Text)+'''  ',sPath_Local,'DESCRICAO');
  end;
end;

procedure TfmSGC_PRODUTOS.edtConsultaChange(Sender: TObject);
begin
if cds.Active then cds.Close;

end;

procedure TfmSGC_PRODUTOS.edtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_down then dbgConsulta.SetFocus;
end;


procedure TfmSGC_PRODUTOS.edtConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = chr(vk_return) then btConsultaClick(self);
end;

procedure TfmSGC_PRODUTOS.edtUnidadeButtonClick(Sender: TObject);
var
  s : string;
begin
  if cds.Active
  and (not (cds.State in [dsInsert, dsEdit]))
  then cds.Edit;

  s := AbreTela('SGC014','SGC.BPL',sUsuario,sPath_Local,edtUnidade.Text+';', sBancoDeDados,cCorBluefield,cCorNormal,iEmp, 0,true);
  if (trim(s) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsUNIDADE.AsString := Separa_String(s,1);
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfmSGC_PRODUTOS.dbgConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = chr(vk_return) then
  begin
    if bModal
    and not cds.IsEmpty
    then btTransportaClick(self);
    btIncluiClick(btEditar);
  end;
end;

procedure TfmSGC_PRODUTOS.
dbgConsultaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_f9 then edtConsulta.SetFocus;
end;

procedure TfmSGC_PRODUTOS.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(vk_escape) then
  begin
    if pgc.ActivePage = tsCadastro
    then btDesisteClick(self)
    else if bModal
         then btSaiClick(self);
  end;
end;

procedure TfmSGC_PRODUTOS.FormShow(Sender: TObject);
begin
pgcDados.ActivePage := tbTributacao;
end;

procedure TfmSGC_PRODUTOS.Direitos;
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
    dtmCon := TdtmConexao.Create(fmSGC_PRODUTOS);
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

function TfmSGC_PRODUTOS.Pode_Salvar: boolean;
begin
  result := false;

  if trim(cdsCOD_PROD.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe Código.'), 'Aviso', MB_ICONWARNING);
    edtCodProd.SetFocus;
    Exit;
  end;

  if trim(cdsNOME.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe a descrição.'), 'Aviso', MB_ICONWARNING);
    edtNomeProd.SetFocus;
    Exit;
  end;

  if trim(cdsID_GRUPO.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe o Grupo.'), 'Aviso', MB_ICONWARNING);
    edtCodGrupo.SetFocus;
    Exit;
  end;

  if trim(cdsUNIDADE.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe a Unidade.'), 'Aviso', MB_ICONWARNING);
    edtUnidade.SetFocus;
    Exit;
  end;

  if trim(cdsNCM.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe o NCM.'), 'Aviso', MB_ICONWARNING);
    pgcDados.ActivePage := tbTributacao;
    edtNCM.SetFocus;
    Exit;
  end;


  result := true;
end;

(******************************************************************************)
//exports tem que ser a ultima coisa antes do end.
exports
  SGC030;

end.
