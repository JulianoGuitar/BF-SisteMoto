unit uSGV_Comandas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, bfdbGrid, DB, DBClient, Provider, FMTBcd,
  SqlExpr, ExtCtrls, DBCtrls, Mask, udtmConexao, ComCtrls,
  Buttons, bfEdit, bfdbEdit, DBGrids, bfdbMemo, RelVisualBlue, bfdbComboBox,
  bfdbEditButton, DBXPRESS;

type
  TfmSGV_COMANDAS = class(TForm)
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
    Label2: TLabel;
    edtCliente: TbfdbEdit;
    btTransporta: TBitBtn;
    btImprime: TBitBtn;
    RelVisual: TRelVisualBlue;
    edtConsultaNOME: TbfEdit;
    Label3: TLabel;
    edtComanda: TbfdbEdit;
    Label4: TLabel;
    edtNomeCli: TbfdbEdit;
    edtCodCli: TbfdbEditButton;
    edtConsComanda: TbfEdit;
    btFecharComanda: TBitBtn;
    ckbAbertasCons: TCheckBox;
    qrID: TIntegerField;
    qrUSU_INCLUI: TStringField;
    qrDT_INCLUI: TSQLTimeStampField;
    qrUSU_ALTERA: TStringField;
    qrDT_ALTERA: TSQLTimeStampField;
    qrIDALT: TStringField;
    qrIDALTERADO: TStringField;
    qrCOMANDA: TIntegerField;
    qrNOME: TStringField;
    qrID_CLIENTE: TIntegerField;
    qrFECHADA: TStringField;
    qrTOTAL: TFMTBCDField;
    qrNOME_CLIENTE: TStringField;
    cdsID: TIntegerField;
    cdsUSU_INCLUI: TStringField;
    cdsDT_INCLUI: TSQLTimeStampField;
    cdsUSU_ALTERA: TStringField;
    cdsDT_ALTERA: TSQLTimeStampField;
    cdsIDALT: TStringField;
    cdsIDALTERADO: TStringField;
    cdsCOMANDA: TIntegerField;
    cdsNOME: TStringField;
    cdsID_CLIENTE: TIntegerField;
    cdsFECHADA: TStringField;
    cdsTOTAL: TFMTBCDField;
    cdsNOME_CLIENTE: TStringField;
    qrSOCIO: TStringField;
    cdsSOCIO: TStringField;
    DBCheckBox1: TDBCheckBox;

    procedure Direitos;
    function Pode_Salvar: boolean;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);

    procedure btConsultaClick(Sender: TObject);
    procedure dbgConsultaDblClick(Sender: TObject);
    procedure tsConsultaShow(Sender: TObject);
    procedure edtConsultaCodKeyPress(Sender: TObject; var Key: Char);
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
    procedure edtConsultaCodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgConsultaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConsultaCodChange(Sender: TObject);
    procedure cdsIDGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure edtCodCliButtonClick(Sender: TObject);
    procedure edtCodCliChange(Sender: TObject);
    procedure edtCodCliExit(Sender: TObject);
    procedure cdsORIGEM_MERCADORIAGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsTIPO_ITEMGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure edtComandaExit(Sender: TObject);
    procedure btFecharComandaClick(Sender: TObject);

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
  fmSGV_COMANDAS: TfmSGV_COMANDAS;
const
  sCodProg : string = 'SGV002';

implementation

uses uFuncoesDB, uFuncoes, uFuncoesTelas;

{$R *.dfm}

function SGV002(sOpUsuario, sOpLocal, sOpFiltros, sOpDBSel: pchar; cOpBlueField, cOpNormal : TColor; iEmpresa, iOp: integer; bOpModal: boolean = false): pchar;
begin
  Result := '';
  with TfmSGV_COMANDAS.Create(Application) do
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
    edtCliente.Text := Separa_String(sOpFiltros,1);
    //desabilitar em telas com muitos dados
    btConsultaClick(btConsulta);

    if bModal then
    begin

      if iOp = 1 then
      begin
       try
        if (bInc)
        then cds.Insert;
       except
       end;
       pgc.ActivePage := tsCadastro;
       //edtComanda.SetFocus;
       HabilitaControles;
      end;

      ShowModal;
      if ModalResult = mrOk
      then result := pchar(sRetorno);
      Release;
    end
    else Show;

  end;
end;

procedure TfmSGV_COMANDAS.btTransportaClick(Sender: TObject);
begin
  if bModal then
  begin
    sRetorno := cdsID.AsString+';'
               +cdsCOMANDA.AsString+';'
               +cdsNOME.AsString+';'
               ;

    ModalResult := mrOk;
  end;
end;

procedure TfmSGV_COMANDAS.FormCreate(Sender: TObject);
begin
  bDBAberto := false;

  btConsulta.Glyph.LoadFromResourceName(HInstance,'CONS');
  edtCodCli.Glyph.LoadFromResourceName(HInstance,'CONS');
  btTransporta.Glyph.LoadFromResourceName(HInstance,'DIR');
  btImprime.Glyph.LoadFromResourceName(HInstance,'PRINT');
  btInclui.Glyph.LoadFromResourceName(HInstance,'INC');
  btSalva.Glyph.LoadFromResourceName(HInstance,'SALVA');
  btDesiste.Glyph.LoadFromResourceName(HInstance,'DESIST');
  btExclui.Glyph.LoadFromResourceName(HInstance,'EXC');
  btSai.Glyph.LoadFromResourceName(HInstance,'SAI');
  btEditar.Glyph.LoadFromResourceName(HInstance,'EDIT');

  pgc.ActivePage := tsConsulta;

end;

procedure TfmSGV_COMANDAS.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if bDBAberto
  then bDBAberto := not FechaDataModule(dtmCon);

  if not bModal then
  begin
    fmSGV_COMANDAS := nil;
    Action := caFree;
  end;
end;

procedure TfmSGV_COMANDAS.HabilitaControles;
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

procedure TfmSGV_COMANDAS.btConsultaClick(Sender: TObject);
begin
  if not bDBAberto
  then
  begin
    dtmCon := TdtmConexao.Create(fmSGV_COMANDAS);
    bDBAberto := AbreDataModule(dtmCon, sPath_Local, sBancoDeDados);
  end;

  if not bDBAberto then exit;
  with qr do
  begin
    SQLConnection := dtmCon.SQLDB;
    if active then close;
    SQL.Clear;
    SQL.Add(' select c.*, p.nome NOME_CLIENTE ');
    SQL.Add(' from SGV_COMANDAS c ');
    SQL.Add(' left join sgc_participantes p on p.id = c.id_cliente ');
    SQL.Add(' where c.ID > 0 ');

    if StrToIntDef(edtConsComanda.Text,0) <> 0
    then SQL.Add(' and c.comanda = '+trim(edtConsComanda.Text));
    if trim(edtConsultaNOME.Text) <> ''
    then SQL.Add(' and c.nome like ''%'+trim(edtConsultaNOME.Text)+'%'' ');

    if ckbAbertasCons.Checked
    then SQL.Add(' and coalesce(c.fechada,''N'') = ''N'' ')
    else SQL.Add(' and coalesce(c.fechada,''N'') = ''S'' ');
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

procedure TfmSGV_COMANDAS.cdsAfterPost(DataSet: TDataSet);
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

procedure TfmSGV_COMANDAS.cdsBeforePost(DataSet: TDataSet);
begin
  cdsIDALTERADO.AsString := cdsIDALT.AsString;

end;

procedure TfmSGV_COMANDAS.cdsIDGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
if cds.State in [dsInsert]
  then Text := 'Autom?tico'
  else Text := cdsID.AsString;
end;

procedure TfmSGV_COMANDAS.cdsAfterEdit(DataSet: TDataSet);
begin
  cdsUSU_ALTERA.AsString := sUsuario;
  cdsDT_ALTERA.AsDateTime := now;
  HabilitaControles;
end;

procedure TfmSGV_COMANDAS.cdsAfterInsert(DataSet: TDataSet);
begin
  cdsUSU_INCLUI.AsString := sUsuario;
  HabilitaControles;
end;

procedure TfmSGV_COMANDAS.dspUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise exception.Create(E.Message);
end;

procedure TfmSGV_COMANDAS.BeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
                                 DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
                                 var Applied: Boolean);
{var
  Campo : TField;
  SQLStmt, Tabela : String;
  CustomSQLDataSet : TCustomSQLDataSet;^}
begin
{n?o tem autoincremento nos CODIGO
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
procedure TfmSGV_COMANDAS.dbgConsultaDblClick(Sender: TObject);
begin
  if bModal
  and not cds.IsEmpty
  then btTransportaClick(self);
  btIncluiClick(btEditar);
end;

procedure TfmSGV_COMANDAS.cdsNewRecord(DataSet: TDataSet);
begin
  cdsID.ReadOnly := false;
  HabilitaControles;

end;

procedure TfmSGV_COMANDAS.cdsORIGEM_MERCADORIAGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
  begin
    if Sender.Value = '0' then
      Text := '0 - NACIONAL, EXCETO AS INDICADAS NOS C?DIGOS 3, 4, 5 E 8';
    if Sender.Value = '1' then
      Text := '1 - ESTRANGEIRA - IMPORTA??O DIRETA, EXCETO A INDICADA NO C?DIGO 6';
    if Sender.Value = '2' then
      Text := '2 - ESTRANGEIRA - ADQUIRIDA NO MERCADO INTERNO, EXCETO A INDICADA NO C?DIGO 7';
    if Sender.Value = '3' then
      Text := '3 - NACIONAL, MERCADORIA OU BEM COM CONTE?DO DE IMPORTA??O SUPERIOR A 40% E INFERIOR OU IGUAL A 70%';
    if Sender.Value = '4' then
      Text := '4 - NACIONAL, CUJA PRODU??O TENHA SIDO FEITA EM CONFORMIDADE COM OS PROCESSOS PRODUTIVOS B?SICOS DE QUE TRATAM O DECRETO-LEI N? 288/67, E AS LEIS N?S 8.248/91, 8.387/91, 10.176/01 E 11.484/07';
    if Sender.Value = '5' then
      Text := '5 - NACIONAL, MERCADORIA OU BEM COM CONTE?DO DE IMPORTA??O INFERIOR OU IGUAL A 40%';
    if Sender.Value = '6' then
      Text := '6 - ESTRANGEIRA - IMPORTA??O DIRETA, SEM SIMILAR NACIONAL, CONSTANTE EM LISTA DE RESOLU??O CAMEX';
    if Sender.Value = '7' then
      Text := '7 - ESTRANGEIRA - ADQUIRIDA NO MERCADO INTERNO, SEM SIMILAR NACIONAL, CONSTANTE EM LISTA DE RESOLU??O CAMEX';
    if Sender.Value = '8' then
      Text := '8 - NACIONAL, MERCADORIA OU BEM COM CONTE?DO DE IMPORTA??O SUPERIOR A 70% (SETENTA POR CENTO). (AJUSTE SINIEF 15/2013 VIG.01/08/2013)';

  end;
end;

procedure TfmSGV_COMANDAS.cdsTIPO_ITEMGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if not Sender.IsNull then
  begin
    if Sender.Value = '00' then
      Text := '00 - MERCADORIA PARA REVENDA';
    if Sender.Value = '01' then
      Text := '01 - MAT?RIA-PRIMA';
    if Sender.Value = '02' then
      Text := '02 - EMBALAGEM';
    if Sender.Value = '03' then
      Text := '03 - PRODUTO EM PROCESSO';
    if Sender.Value = '04' then
      Text := '04 - PRODUTO ACABADO';
    if Sender.Value = '05' then
      Text := '05 - SUBPRODUTO';
    if Sender.Value = '06' then
      Text := '06 - PRODUTO INTERMEDI?RIO';
    if Sender.Value = '07' then
      Text := '07 - MATERIAL DE USO E CONSUMO';
    if Sender.Value = '08' then
      Text := '08 - ATIVO IMOBILIZADO';
    if Sender.Value = '09' then
      Text := '09 - SERVI?OS';
    if Sender.Value = '10' then
      Text := '10 - OUTROS INSUMOS';
    if Sender.Value = '99' then
      Text := '99 - OUTRAS';
  end;
end;

procedure TfmSGV_COMANDAS.cdsAfterCancel(DataSet: TDataSet);
begin
  cdsID.ReadOnly := true;
  HabilitaControles;
end;

procedure TfmSGV_COMANDAS.cdsAfterDelete(DataSet: TDataSet);
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

procedure TfmSGV_COMANDAS.btSalvaClick(Sender: TObject);
begin
  if Pode_Salvar
  then cds.Post;
end;

procedure TfmSGV_COMANDAS.btImprimeClick(Sender: TObject);
begin
 if (not cds.Active) or cds.IsEmpty then exit;

  with RelVisual do
  begin
    TituloRelatorio := Caption;

    Cabecalho1Esquerda := sEmpresa;
    Cabecalho2Centro := '';
//    if (edtConsulta.Text <> '') or (edtConsultaNOME.Text <> '') then
//    Cabecalho3Esquerda := ('Filtrando por: '+edtConsulta.Text+' Descri??o: '+edtConsultaNOME.Text);

    Cabecalhos.Clear;

    Limpa_Campos;
    DefinicaoCampos.Add('D2;20;E;;ID;ID');
    DefinicaoCampos.Add('D0;100;E;;DESCRICAO;Descri??o');
    DefinicaoCampos.Add('D0;40;E;;TIPO_ES;Tipo');
    DefinicaoCampos.Add('D0;40;E;;CALCULA_CUSTO;Calc.Custo');
    Execute;
  end;



  end;

procedure TfmSGV_COMANDAS.btIncluiClick(Sender: TObject);
begin
  if not cds.Active then exit;
  if not bCad then Exit;
  if (TBitBtn(sender).Tag = 0)
  and cds.IsEmpty then exit;
  if (TBitBtn(sender).Tag = 1)
  then if (bInc)
       then cds.Insert
       else exit;
  pgc.ActivePage := tsCadastro;
  edtComanda.SetFocus;
  HabilitaControles;

end;

procedure TfmSGV_COMANDAS.btDesisteClick(Sender: TObject);
begin
  if cds.State in [dsInsert, dsEdit]
  then cds.Cancel;
  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGV_COMANDAS.btExcluiClick(Sender: TObject);
begin
  if MessageBox(Handle, pchar('Confirma a exclus?o deste registro ?'), 'Excluir', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = id_no
  then Exit;
  cds.delete;
  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGV_COMANDAS.btSaiClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSGV_COMANDAS.tsConsultaShow(Sender: TObject);
begin
  if cds.State in [dsInsert, dsEdit]
  then cds.Cancel;

  if  (not cds.IsEmpty)
  and (dbgConsulta.CanFocus)
  then dbgConsulta.SetFocus
  else if edtConsComanda.CanFocus
       then edtConsComanda.SetFocus;
end;

procedure TfmSGV_COMANDAS.edtCodCliButtonClick(Sender: TObject);
var
  s : string;
begin
  if cds.Active
  and (not (cds.State in [dsInsert, dsEdit]))
  then cds.Edit;

  s := AbreTela('SGC015','SGC.BPL',sUsuario,sPath_Local,edtCodCli.Text+';'+edtNomeCli.Text+';', sBancoDeDados,cCorBluefield,cCorNormal,iEmp, 0,true);
  if (trim(s) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsID_CLIENTE.AsString := Separa_String(s,1);
    cdsNOME_CLIENTE.AsString := Separa_String(s,2);
    cdsSOCIO.AsString := Separa_String(s,4);
    cdsNOME.AsString := Separa_String(cdsNOME_CLIENTE.AsString,1,' ');
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;


procedure TfmSGV_COMANDAS.edtCodCliChange(Sender: TObject);
begin
  if edtCodCli.Focused then edtNomeCli.Clear;
end;

procedure TfmSGV_COMANDAS.edtCodCliExit(Sender: TObject);
begin
  if (trim(edtCodCli.Text) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    with dtmCon.qrApoio do
    begin
      if active then close;
      SQL.Clear;
      SQL.Add(' select nome, socio from sgc_participantes where id = '''+trim(edtCodCli.Text)+'''  ');
      Open;
      cdsNOME_CLIENTE.AsString := FieldByName('nome').AsString;
      cdsSOCIO.AsString := FieldByName('socio').AsString;
      cdsNOME.AsString := Separa_String(cdsNOME_CLIENTE.AsString,1,' ');
      close;
    end;
  end;
end;

procedure TfmSGV_COMANDAS.edtConsultaCodChange(Sender: TObject);
begin
if cds.Active then cds.Close;

end;

procedure TfmSGV_COMANDAS.edtConsultaCodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_down then dbgConsulta.SetFocus;
end;


procedure TfmSGV_COMANDAS.edtConsultaCodKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = chr(vk_return) then btConsultaClick(self);
end;

procedure TfmSGV_COMANDAS.dbgConsultaKeyPress(Sender: TObject;
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

procedure TfmSGV_COMANDAS.
dbgConsultaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_f9 then edtComanda.SetFocus;
end;

procedure TfmSGV_COMANDAS.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(vk_escape) then
  begin
    if pgc.ActivePage = tsCadastro
    then btDesisteClick(self)
    else if bModal
         then btSaiClick(self);
  end;
end;

procedure TfmSGV_COMANDAS.Direitos;
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
    dtmCon := TdtmConexao.Create(fmSGV_COMANDAS);
    bDBAberto := AbreDataModule(dtmCon, sPath_Local, sBancoDeDados);
  end;


  s := DireitosUsuario(sUsuario,sCodProg,dtmCon.qrApoio);
  if trim(s) <> '' then
  begin
    bCad := Separa_String(s,1) = 'S';
    bInc := Separa_String(s,2) = 'S';
    bAlt := false;//Separa_String(s,3) = 'S';
    bExc := Separa_String(s,4) = 'S';
  end;

  btExclui.Visible := bExc;
  btInclui.Enabled := bCad and bInc;
  btEditar.Enabled := bCad;
//  tsCadastro.TabVisible := bCad;
  btTransporta.Visible := bModal;

  if not bExc
  then dsp.Options := dsp.Options + [poDisableDeletes];
  if not bInc
  then dsp.Options := dsp.Options + [poDisableInserts];
  if not bAlt
  then dsp.Options := dsp.Options + [poDisableEdits];
end;

(******************************************************************************)

function TfmSGV_COMANDAS.Pode_Salvar: boolean;
var s, q : string;
begin
  result := false;

  if cdsCOMANDA.AsInteger = 0 then
  begin
    MessageBox(Handle, pchar('Informe a comanda.'), 'Aviso', MB_ICONWARNING);
    edtComanda.SetFocus;
    Exit;
  end;

  if (trim(edtComanda.Text) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    q := ' select nome from SGV_COMANDAS where COMANDA = '''+trim(edtComanda.Text)+''' and coalesce(fechada,''N'') = ''N'' ';
    if (cds.State in [dsEdit])
    then q := q+ 'and ID <> '+cdsID.AsString;

    s := Query(q,sPath_Local,'nome');

    if s <> '' then
    begin
      MessageBox(Handle, pchar('Comanda '+edtComanda.Text+' j? est? aberta!'+#13+s), 'Aviso', MB_ICONWARNING);
      exit;
    end;
  end;

  if trim(cdsNOME.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe o nome.'), 'Aviso', MB_ICONWARNING);
    edtCliente.SetFocus;
    Exit;
  end;


  result := true;
end;

(******************************************************************************)

procedure TfmSGV_COMANDAS.edtComandaExit(Sender: TObject);
var s : string;
begin
  if (trim(edtComanda.Text) <> '')
  and (cds.State in [dsInsert])//, dsEdit
  then
  begin
    s := Query(' select nome from SGV_COMANDAS where COMANDA = '''+trim(edtComanda.Text)+''' and coalesce(fechada,''N'') = ''N'' ',sPath_Local,'nome');
    //and ID <> '+cdsID.AsString

    if s <> '' then
    begin
      MessageBox(Handle, pchar('Comanda '+edtComanda.Text+' est? aberta!'+#13+s), 'Aviso', MB_ICONWARNING);
      exit;
    end;
  end;
end;

procedure TfmSGV_COMANDAS.btFecharComandaClick(Sender: TObject);
var
  td : TTransactionDesc;
  x : extended;
  s : string;
begin
  if StrToIntDef(edtConsComanda.Text,0) = 0 then
  begin
    MessageBox(Handle, pchar('Informe a comanda.'), 'Aviso', MB_ICONWARNING);
    edtConsComanda.SetFocus;
    exit;
  end;

  if cds.IsEmpty then
  begin
    MessageBox(Handle, pchar('Comanda n?o encontrada.'), 'Aviso', MB_ICONWARNING);
    edtConsComanda.SetFocus;
    exit;
  end;


  x := 0;
  cds.First;
  s := 'Comanda '+cdsCOMANDA.AsString+' '+cdsNOME.AsString;
  {while not cds.Eof do
  begin
    x := x + cdsTOTAL.AsFloat;
    cds.Next;
  end;
   }
  if
  MessageBox(Handle, pchar(s+#13+#13
                          //+'Valor total: R$ '+FormatFloat('#,##0.00',x)+#13
                         // +#13
                         // +'Forma de pagamento: Dinheiro'+#13
                         // +#13
                          +'Confirma fechar a comanda?'
                          ), 'Fechar comanda', MB_YESNO+MB_ICONQUESTION) = id_no
  then exit;


  //amarrar o ID da comanda em aberto aqui para n?o dar confus?o!
  with dtmCon.qrApoio do
  try
    td.TransactionID := Cardinal(FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    td.IsolationLevel := xilREADCOMMITTED;
    SQLConnection.StartTransaction(td);

    if active then close;
    SQL.Clear;

    //trigger em SGV_COMANDAS fecha o SGV_COMANDAS
    SQL.Add(' update SGV_COMANDAS set FECHADA = ''S'', TOTAL = :x, usu_altera = :u, dt_altera = ''now''  ');
    SQL.Add(' where comanda = :c and coalesce(fechada,''N'') = ''N'' ');
    ParamByName('x').AsFloat := x;
    ParamByName('u').AsString := sUsuario;
    ParamByName('c').AsInteger := StrToIntDef(edtConsComanda.Text,0);
    ExecSQL;

    SQLConnection.Commit(td);

  except
    on e : Exception do
    begin
      SQLConnection.Rollback(td);
      MessageBox(Handle, pChar('Mensagem do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      exit;
    end;
  end;

  MessageBox(Handle, pchar('Comanda encerrada.'), 'Aviso', MB_ICONWARNING);
  edtConsComanda.Clear;
  btConsultaClick(self);
end;
//exports tem que ser a ultima coisa antes do end.
exports
  SGV002;

end.

