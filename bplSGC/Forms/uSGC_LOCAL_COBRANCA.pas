unit uSGC_LOCAL_COBRANCA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, bfdbGrid, DB, DBClient, Provider, FMTBcd,
  SqlExpr, ExtCtrls, DBCtrls, Mask, udtmConexao, ComCtrls,
  Buttons, bfEdit, bfdbEdit, DBGrids, RelVisualBlue, bfdbEditButton, dbxpress;

type
  TfmSGC_LOCAIS_COBRANCA = class(TForm)
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
    btTransporta: TBitBtn;
    btImprime: TBitBtn;
    RelVisual: TRelVisualBlue;
    edtConsultaNOME: TbfEdit;
    qrID: TIntegerField;
    qrNOME: TStringField;
    qrCOD_BANCO: TStringField;
    qrTIPO_CARTEIRA: TStringField;
    qrTIPO_MOEDA: TStringField;
    qrNUM_CONTA_COMP: TStringField;
    qrCOD_AGENCIA: TStringField;
    qrNUM_CONTA_CORR: TStringField;
    qrCOD_CONVENIO_LD: TIntegerField;
    qrVARIACAO: TIntegerField;
    qrNUM_REMESSAS: TIntegerField;
    qrNUM_REG_REM: TIntegerField;
    qrMENSAGEM1: TStringField;
    qrMENSAGEM2: TStringField;
    qrESP_REM: TStringField;
    qrACEI_REM: TStringField;
    qrINSTRUCAO1: TIntegerField;
    qrINSTRUCAO2: TIntegerField;
    qrULT_CHEQUE: TStringField;
    qrCOD_CONTABIL: TIntegerField;
    qrENDERECO: TStringField;
    qrBAIRRO: TStringField;
    qrCOD_CIDADE: TIntegerField;
    qrUF: TStringField;
    qrCEP: TIntegerField;
    qrFONE: TStringField;
    qrCAIXA_BANCO: TStringField;
    qrLOCAL_COB: TStringField;
    qrPASTA_REM: TStringField;
    qrPASTA_RET: TStringField;
    qrNUM_RETORNO: TIntegerField;
    qrDV_AGENCIA_CONTA: TStringField;
    qrCOD_CENTRO_CUSTO: TIntegerField;
    qrVLR_LIMITE_CRED: TFMTBCDField;
    qrSALDO_COMPENSAR: TFMTBCDField;
    qrVLR_PRE_DATADO: TFMTBCDField;
    qrDT_ULT_MOV: TSQLTimeStampField;
    qrSALDO: TFMTBCDField;
    qrCOD_CAIXA_ANTIGO: TIntegerField;
    qrDIAS_CRED: TIntegerField;
    qrDESATIVADO: TStringField;
    qrCHEQUE_FORM_CONT: TStringField;
    qrDT_INCLUI: TSQLTimeStampField;
    cdsID: TIntegerField;
    cdsNOME: TStringField;
    cdsCOD_BANCO: TStringField;
    cdsTIPO_CARTEIRA: TStringField;
    cdsTIPO_MOEDA: TStringField;
    cdsNUM_CONTA_COMP: TStringField;
    cdsCOD_AGENCIA: TStringField;
    cdsNUM_CONTA_CORR: TStringField;
    cdsCOD_CONVENIO_LD: TIntegerField;
    cdsVARIACAO: TIntegerField;
    cdsNUM_REMESSAS: TIntegerField;
    cdsNUM_REG_REM: TIntegerField;
    cdsMENSAGEM1: TStringField;
    cdsMENSAGEM2: TStringField;
    cdsESP_REM: TStringField;
    cdsACEI_REM: TStringField;
    cdsINSTRUCAO1: TIntegerField;
    cdsINSTRUCAO2: TIntegerField;
    cdsULT_CHEQUE: TStringField;
    cdsCOD_CONTABIL: TIntegerField;
    cdsENDERECO: TStringField;
    cdsBAIRRO: TStringField;
    cdsCOD_CIDADE: TIntegerField;
    cdsUF: TStringField;
    cdsCEP: TIntegerField;
    cdsFONE: TStringField;
    cdsCAIXA_BANCO: TStringField;
    cdsLOCAL_COB: TStringField;
    cdsPASTA_REM: TStringField;
    cdsPASTA_RET: TStringField;
    cdsNUM_RETORNO: TIntegerField;
    cdsDV_AGENCIA_CONTA: TStringField;
    cdsCOD_CENTRO_CUSTO: TIntegerField;
    cdsVLR_LIMITE_CRED: TFMTBCDField;
    cdsSALDO_COMPENSAR: TFMTBCDField;
    cdsVLR_PRE_DATADO: TFMTBCDField;
    cdsDT_ULT_MOV: TSQLTimeStampField;
    cdsSALDO: TFMTBCDField;
    cdsCOD_CAIXA_ANTIGO: TIntegerField;
    cdsDIAS_CRED: TIntegerField;
    cdsDESATIVADO: TStringField;
    cdsCHEQUE_FORM_CONT: TStringField;
    cdsDT_INCLUI: TSQLTimeStampField;
    Label1: TLabel;
    edtID: TbfdbEdit;
    Label2: TLabel;
    edtNOME: TbfdbEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtTipoCarteira: TbfdbEdit;
    Label5: TLabel;
    edtTipoMoeda: TbfdbEdit;
    Label6: TLabel;
    edtNmrContaComp: TbfdbEdit;
    Label7: TLabel;
    edtCodAgencia: TbfdbEdit;
    Label8: TLabel;
    edtNmrContaCorrente: TbfdbEdit;
    Label9: TLabel;
    edtCodConvenioLD: TbfdbEdit;
    Label10: TLabel;
    edtVariacao: TbfdbEdit;
    Label11: TLabel;
    edtMensagem1: TbfdbEdit;
    Label12: TLabel;
    edtMensagem2: TbfdbEdit;
    gbRemessa: TGroupBox;
    Label13: TLabel;
    edtNumRemessas: TbfdbEdit;
    Label14: TLabel;
    edtNumRegRemessas: TbfdbEdit;
    Label15: TLabel;
    edtEspecie: TbfdbEdit;
    Label16: TLabel;
    edtAceite: TbfdbEdit;
    Label17: TLabel;
    edtInstrucao1: TbfdbEdit;
    Label18: TLabel;
    edtInstrucao2: TbfdbEdit;
    Label20: TLabel;
    edtDVAgenciaConta: TbfdbEdit;
    edtBancoCod: TbfdbEditButton;
    edtNomeBanco: TbfdbEdit;
    qrBANCO_NOME: TStringField;
    cdsBANCO_NOME: TStringField;
    ckbInativoCons: TCheckBox;
    qrINATIVO: TStringField;
    cdsINATIVO: TStringField;
    ckbInativo: TDBCheckBox;
    qrNOSSO_NUMERO: TStringField;
    cdsNOSSO_NUMERO: TStringField;

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
    procedure edtBancoCodButtonClick(Sender: TObject);
    procedure edtBancoCodChange(Sender: TObject);
    procedure edtBancoCodExit(Sender: TObject);
    procedure edtConsultaChange(Sender: TObject);
    procedure cdsIDGetText(Sender: TField; var Text: string;
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
  fmSGC_LOCAIS_COBRANCA: TfmSGC_LOCAIS_COBRANCA;
const
  sCodProg : string = 'SGC005';

implementation

uses uFuncoesDB, uFuncoes, uFuncoesTelas;

{$R *.dfm}

function SGC005(sOpUsuario, sOpLocal, sOpFiltros, sOpDBSel: pchar; cOpBlueField, cOpNormal : TColor; iEmpresa, iOp: integer; bOpModal: boolean = false): pchar;
begin
  Result := '';
  with TfmSGC_LOCAIS_COBRANCA.Create(Application) do
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

procedure TfmSGC_LOCAIS_COBRANCA.btTransportaClick(Sender: TObject);
begin
  if bModal then
  begin
    sRetorno := cdsID.AsString+';'
               +cdsNOME.AsString+';'
               ;

    ModalResult := mrOk;
  end;
end;

procedure TfmSGC_LOCAIS_COBRANCA.FormCreate(Sender: TObject);
begin
  bDBAberto := false;

  btConsulta.Glyph.LoadFromResourceName(HInstance,'CONS');
  edtBancoCod.Glyph.LoadFromResourceName(HInstance,'CONS');
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
  ckbInativo.Checked
end;

procedure TfmSGC_LOCAIS_COBRANCA.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if bDBAberto
  then bDBAberto := not FechaDataModule(dtmCon);

  if not bModal then
  begin
    fmSGC_LOCAIS_COBRANCA := nil;
    Action := caFree;
  end;
end;

procedure TfmSGC_LOCAIS_COBRANCA.HabilitaControles;
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

procedure TfmSGC_LOCAIS_COBRANCA.edtBancoCodButtonClick(Sender: TObject);
var
  s : string;
begin
  if cds.Active
  and (not (cds.State in [dsInsert, dsEdit]))
  then cds.Edit;

  s := AbreTela('SGC004','SGC.BPL',sUsuario,sPath_Local,edtBancoCod.Text+';', sBancoDeDados,cCorBluefield,cCorNormal,iEmp, 0,true);
  if (trim(s) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsCOD_BANCO.AsString := Separa_String(s,1);
    cdsBANCO_NOME.AsString := Separa_String(s,2);

    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfmSGC_LOCAIS_COBRANCA.edtBancoCodChange(Sender: TObject);
begin
  if edtBancoCod.Focused then edtNomeBanco.Clear;
end;

procedure TfmSGC_LOCAIS_COBRANCA.edtBancoCodExit(Sender: TObject);
begin
  if (trim(edtBancoCod.Text) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsBANCO_NOME.AsString := Query(' select * from sgc_BANCOS where COD_BANCO = '''+trim(edtBancoCod.Text)+'''  ',sPath_Local,'NOME');
  end;
end;

procedure TfmSGC_LOCAIS_COBRANCA.btConsultaClick(Sender: TObject);
begin
  if not bDBAberto
  then
  begin
    dtmCon := TdtmConexao.Create(fmSGC_LOCAIS_COBRANCA);
    bDBAberto := AbreDataModule(dtmCon, sPath_Local, sBancoDeDados);
  end;

  if not bDBAberto then exit;
  with qr do
  begin
    SQLConnection := dtmCon.SQLDB;
    if active then close;
    SQL.Clear;
    SQL.Add(' select l.*, b.NOME BANCO_NOME from SGC_LOCAIS_COBRANCA l ');
    SQL.Add(' left join SGC_BANCOS b on b.COD_BANCO = l.COD_BANCO');
    SQL.Add(' where l.ID > 0 ');
    if trim(edtConsulta.Text) <> ''
    then SQL.Add(' and l.ID = '''+trim(edtConsulta.Text)+''' ');
    if trim(edtConsultaNOME.Text) <> ''
    then SQL.Add(' and l.NOME like ''%'+trim(edtConsultaNOME.Text)+'%'' ');
    if ckbInativoCons.Checked then
    SQL.Add(' and l.INATIVO = ''S'' ')
    else
    SQL.Add(' and l.INATIVO <> ''S'' ');
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

procedure TfmSGC_LOCAIS_COBRANCA.cdsAfterPost(DataSet: TDataSet);
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

procedure TfmSGC_LOCAIS_COBRANCA.cdsBeforePost(DataSet: TDataSet);
begin
  cdsIDALTERADO.AsString := cdsIDALT.AsString;
  if ckbInativo.Checked then
  cdsINATIVO.AsString := 'S';
end;

procedure TfmSGC_LOCAIS_COBRANCA.cdsIDGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
if cds.State in [dsInsert]
  then Text := 'Automático'
  else Text := cdsID.AsString;
end;

procedure TfmSGC_LOCAIS_COBRANCA.cdsAfterEdit(DataSet: TDataSet);
begin
  cdsUSU_ALTERA.AsString := sUsuario;
  cdsDT_ALTERA.AsDateTime := now;
  HabilitaControles;
end;

procedure TfmSGC_LOCAIS_COBRANCA.cdsAfterInsert(DataSet: TDataSet);
begin
  cdsUSU_INCLUI.AsString := sUsuario;
  HabilitaControles;
end;

procedure TfmSGC_LOCAIS_COBRANCA.dspUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise exception.Create(E.Message);
end;

procedure TfmSGC_LOCAIS_COBRANCA.BeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
                                 DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
                                 var Applied: Boolean);
{var
  Campo : TField;
  SQLStmt, Tabela : String;
  CustomSQLDataSet : TCustomSQLDataSet;^}
begin
{não tem autoincremento nos CODIGOs


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
procedure TfmSGC_LOCAIS_COBRANCA.dbgConsultaDblClick(Sender: TObject);
begin
  if bModal
  and not cds.IsEmpty
  then btTransportaClick(self);
  btIncluiClick(btEditar);
end;

procedure TfmSGC_LOCAIS_COBRANCA.cdsNewRecord(DataSet: TDataSet);
begin
  cdsID.ReadOnly := false;
  HabilitaControles;
end;

procedure TfmSGC_LOCAIS_COBRANCA.cdsAfterCancel(DataSet: TDataSet);
begin
  cdsID.ReadOnly := true;
  HabilitaControles;
end;

procedure TfmSGC_LOCAIS_COBRANCA.cdsAfterDelete(DataSet: TDataSet);
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

procedure TfmSGC_LOCAIS_COBRANCA.btSalvaClick(Sender: TObject);
begin
  if Pode_Salvar
  then cds.Post;
end;

procedure TfmSGC_LOCAIS_COBRANCA.btImprimeClick(Sender: TObject);
begin
 if (not cds.Active) or cds.IsEmpty then exit;

  with RelVisual do
  begin
    TituloRelatorio := Caption;

    Cabecalho1Esquerda := sEmpresa;
    Cabecalho2Centro := '';
    if (edtConsulta.Text <> '') or (edtConsultaNOME.Text <> '') then
    Cabecalho3Esquerda := ('Filtrando por: '+edtConsulta.Text+'  Descrição: '+edtConsultaNOME.Text);

    Cabecalhos.Clear;

    Limpa_Campos;
    DefinicaoCampos.Add('D2;20;E;;ID;ID');
    DefinicaoCampos.Add('D0;100;E;;COD_BANCO;Código Banco');
    DefinicaoCampos.Add('D0;100;E;;NOME;Descrição');
    Execute;
  end;



  end;

procedure TfmSGC_LOCAIS_COBRANCA.btIncluiClick(Sender: TObject);
begin
  if not cds.Active then exit;
  if not bCad then Exit;
  if (TBitBtn(sender).Tag = 1)
  then if (bInc)
       then cds.Insert
       else exit;
  pgc.ActivePage := tsCadastro;
  edtNOME.SetFocus;
  HabilitaControles;
  if cdsINATIVO.AsString <> 'S' then
  ckbInativo.Checked := false;
end;

procedure TfmSGC_LOCAIS_COBRANCA.btDesisteClick(Sender: TObject);
begin
  if cds.State in [dsInsert, dsEdit]
  then cds.Cancel;
  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGC_LOCAIS_COBRANCA.btExcluiClick(Sender: TObject);
begin
  if MessageBox(Handle, pchar('Confirma a exclusão deste registro ?'), 'Excluir', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = id_no
  then Exit;
  cds.delete;
  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGC_LOCAIS_COBRANCA.btSaiClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSGC_LOCAIS_COBRANCA.tsConsultaShow(Sender: TObject);
begin
  if cds.State in [dsInsert, dsEdit]
  then cds.Cancel;

  if  (not cds.IsEmpty)
  and (dbgConsulta.CanFocus)
  then dbgConsulta.SetFocus
  else if edtConsulta.CanFocus
       then edtConsulta.SetFocus;
end;

procedure TfmSGC_LOCAIS_COBRANCA.edtConsultaChange(Sender: TObject);
begin
if cds.Active then cds.Close;

end;

procedure TfmSGC_LOCAIS_COBRANCA.edtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_down then dbgConsulta.SetFocus;
end;


procedure TfmSGC_LOCAIS_COBRANCA.edtConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = chr(vk_return) then btConsultaClick(self);
end;

procedure TfmSGC_LOCAIS_COBRANCA.dbgConsultaKeyPress(Sender: TObject;
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

procedure TfmSGC_LOCAIS_COBRANCA.dbgConsultaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_f9 then edtConsulta.SetFocus;
end;

procedure TfmSGC_LOCAIS_COBRANCA.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(vk_escape) then
  begin
    if pgc.ActivePage = tsCadastro
    then btDesisteClick(self)
    else if bModal
         then btSaiClick(self);
  end;
end;

procedure TfmSGC_LOCAIS_COBRANCA.Direitos;
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
    dtmCon := TdtmConexao.Create(fmSGC_LOCAIS_COBRANCA);
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

function TfmSGC_LOCAIS_COBRANCA.Pode_Salvar: boolean;
begin
  result := false;

  if trim(cdsNOME.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe a descrição.'), 'Aviso', MB_ICONWARNING);
    edtNOME.SetFocus;
    Exit;
  end;




  {if trim(cdsCOD_BANCO.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe o código.'), 'Aviso', MB_ICONWARNING);
    edtBancoCod.SetFocus;
    Exit;
  end}




  

  result := true;
end;

(******************************************************************************)
//exports tem que ser a ultima coisa antes do end.
exports
  SGC005;

end.
