unit uSGV_VENDAS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, bfdbGrid, DB, DBClient, Provider, FMTBcd,
  SqlExpr, ExtCtrls, DBCtrls, Mask, udtmConexao, ComCtrls,
  Buttons, bfEdit, bfdbEdit, DBGrids, bfdbMemo, RelVisualBlue, bfdbComboBox,
  bfdbEditButton, DBXPRESS, bfComboBox;

type
  TfmSGV_VENDAS = class(TForm)
    cds: TClientDataSet;
    dsp: TDataSetProvider;
    qr: TSQLQuery;
    ds: TDataSource;
    pgc: TPageControl;
    tsCadastro: TTabSheet;
    tsConsulta: TTabSheet;
    GroupBox1: TGroupBox;
    btExclui: TBitBtn;
    GroupBox2: TGroupBox;
    btSai: TBitBtn;
    dbgConsulta: TbfdbGrid;
    btEditar: TBitBtn;
    edtConsultaCod: TbfEdit;
    Label2: TLabel;
    edtCliente: TbfdbEdit;
    btTransporta: TBitBtn;
    RelVisual: TRelVisualBlue;
    edtConsultaNOME: TbfEdit;
    Label3: TLabel;
    edtComanda: TbfdbEdit;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtNomeFamilia: TbfdbEdit;
    edtNomeProd: TbfdbEdit;
    edtCodProd: TbfdbEditButton;
    edtCodFamilia: TbfdbEditButton;
    Label1: TLabel;
    edtOBS: TbfdbMemo;
    edtConsComanda: TbfEdit;
    Label10: TLabel;
    edtCustoRep: TbfdbEdit;
    qrID: TIntegerField;
    qrUSU_INCLUI: TStringField;
    qrDT_INCLUI: TSQLTimeStampField;
    qrUSU_ALTERA: TStringField;
    qrDT_ALTERA: TSQLTimeStampField;
    qrIDALT: TStringField;
    qrIDALTERADO: TStringField;
    qrCOMANDA: TIntegerField;
    qrCOD_PROD: TStringField;
    qrOBS: TStringField;
    qrID_FAMILIA: TIntegerField;
    qrVALOR: TFMTBCDField;
    qrQUANTIDADE: TFMTBCDField;
    qrTOTAL: TFMTBCDField;
    qrFECHADA: TStringField;
    qrNOME_PROD: TStringField;
    qrUNIDADE: TStringField;
    qrNOME_FAMILIA: TStringField;
    qrCOMANDA_NOME: TStringField;
    cdsID: TIntegerField;
    cdsUSU_INCLUI: TStringField;
    cdsDT_INCLUI: TSQLTimeStampField;
    cdsUSU_ALTERA: TStringField;
    cdsDT_ALTERA: TSQLTimeStampField;
    cdsIDALT: TStringField;
    cdsIDALTERADO: TStringField;
    cdsCOMANDA: TIntegerField;
    cdsCOD_PROD: TStringField;
    cdsOBS: TStringField;
    cdsID_FAMILIA: TIntegerField;
    cdsVALOR: TFMTBCDField;
    cdsQUANTIDADE: TFMTBCDField;
    cdsTOTAL: TFMTBCDField;
    cdsFECHADA: TStringField;
    cdsNOME_PROD: TStringField;
    cdsUNIDADE: TStringField;
    cdsNOME_FAMILIA: TStringField;
    cdsCOMANDA_NOME: TStringField;
    edtConsultaProduto: TbfEdit;
    edtConsultaParceiro: TbfEdit;
    Label5: TLabel;
    bfdbEdit1: TbfdbEdit;
    Label8: TLabel;
    bfdbEdit2: TbfdbEdit;
    Panel1: TPanel;
    btAbreComanda: TBitBtn;
    btFecharComanda: TBitBtn;
    btInclui: TBitBtn;
    btConsulta: TBitBtn;
    btImprime: TBitBtn;
    btSalva: TBitBtn;
    btDesiste: TBitBtn;
    qrTAG: TStringField;
    cdsTAG: TStringField;
    Label9: TLabel;
    DBEdit1: TbfDBEdit;
    qrIMPRESSO: TStringField;
    cdsIMPRESSO: TStringField;
    cbxComandaCons: TComboBox;
    btFechaTurno: TBitBtn;

    procedure Direitos;
    function Pode_Salvar: boolean;

    procedure AbrirComanda(iOp:integer);
    procedure BuscaProduto(sOp:string);
    function TurnoAberto: boolean;
    function TurnoFechado: boolean;
    procedure AbreTurno;
    function ComandasAbertas: boolean;

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
    procedure edtCodProdButtonClick(Sender: TObject);
    procedure edtCodProdChange(Sender: TObject);
    procedure edtCodProdExit(Sender: TObject);
    procedure edtCodFamiliaButtonClick(Sender: TObject);
    procedure edtCodFamiliaChange(Sender: TObject);
    procedure edtCodFamiliaExit(Sender: TObject);
    procedure cdsORIGEM_MERCADORIAGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsTIPO_ITEMGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure edtComandaExit(Sender: TObject);
    procedure cdsQUANTIDADEChange(Sender: TField);
    procedure btFecharComandaClick(Sender: TObject);
    procedure btAbreComandaClick(Sender: TObject);
    procedure btFechaTurnoClick(Sender: TObject);

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
  fmSGV_VENDAS: TfmSGV_VENDAS;
const
  sCodProg : string = 'SGV001';

implementation

uses uFuncoesDB, uFuncoes, uFuncoesTelas;

{$R *.dfm}


function SGV001(sOpUsuario, sOpLocal, sOpFiltros, sOpDBSel: pchar; cOpBlueField, cOpNormal : TColor; iEmpresa, iOp: integer; bOpModal: boolean = false): pchar;
begin
  Result := '';
  with TfmSGV_VENDAS.Create(Application) do
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
      ShowModal;
      if ModalResult = mrOk
      then result := pchar(sRetorno);
      Release;
    end
    else Show;

  end;
end;



procedure TfmSGV_VENDAS.btTransportaClick(Sender: TObject);
begin
  if bModal then
  begin
    sRetorno := cdsID.AsString+';'
               +cdsCOMANDA_NOME.AsString+';'
               ;

    ModalResult := mrOk;
  end;
end;

procedure TfmSGV_VENDAS.FormCreate(Sender: TObject);
begin
  bDBAberto := false;
    
  edtCodProd.Glyph.LoadFromResourceName(HInstance,'CONS');
  edtCodFamilia.Glyph.LoadFromResourceName(HInstance,'CONS');
  //btTransporta.Glyph.LoadFromResourceName(HInstance,'DIR');
  //btImprime.Glyph.LoadFromResourceName(HInstance,'PRINT');

  //btSalva.Glyph.LoadFromResourceName(HInstance,'SALVA');
  //btDesiste.Glyph.LoadFromResourceName(HInstance,'DESIST');
  //btExclui.Glyph.LoadFromResourceName(HInstance,'EXC');
  //btSai.Glyph.LoadFromResourceName(HInstance,'SAI');
  //btEditar.Glyph.LoadFromResourceName(HInstance,'EDIT');

  //btInclui.Glyph.LoadFromResourceName(HInstance,'INC');
  //btConsulta.Glyph.LoadFromResourceName(HInstance,'CONS');

  pgc.ActivePage := tsConsulta;

end;

procedure TfmSGV_VENDAS.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if bDBAberto
  then bDBAberto := not FechaDataModule(dtmCon);

  if not bModal then
  begin
    fmSGV_VENDAS := nil;
    Action := caFree;
  end;
end;

procedure TfmSGV_VENDAS.HabilitaControles;
begin
  btDesiste.Visible := pgc.ActivePage = tsCadastro;
  btInclui.Visible := pgc.ActivePage = tsConsulta;

  btInclui.Enabled     := bInc and ( not(cds.State in [dsInsert, dsEdit]));
  btSalva.Enabled   := ((cds.State in [dsInsert]) and bInc)
                    or ((cds.State in [dsEdit]) and bAlt)
                    ;
  //BtnEditar.Enabled   := (DSPadrao.DataSet.State in [dsBrowse]);
  btExclui.Enabled  := bExc and (cds.State in [dsBrowse, dsEdit]);
 // btDesiste.Enabled := (cds.State in [dsInsert, dsEdit]);
//  BtnPesquisa.Enabled := not (DSPadrao.DataSet.State in [dsInsert, dsEdit]);
end;

procedure TfmSGV_VENDAS.btConsultaClick(Sender: TObject);
begin
  if not bDBAberto
  then
  begin
    dtmCon := TdtmConexao.Create(fmSGV_VENDAS);
    bDBAberto := AbreDataModule(dtmCon, sPath_Local, sBancoDeDados);
  end;

  if pgc.ActivePage = tsCadastro then btDesisteClick(self);

  if not bDBAberto then exit;
  with qr do
  begin
    SQLConnection := dtmCon.SQLDB;
    if active then close;
    SQL.Clear;
    SQL.Add(' select v.*, p.nome NOME_PROD, p.unidade, f.nome NOME_FAMILIA ');
    SQL.Add(' from SGV_VENDAS v ');
//    SQL.Add(' left join sgv_comandas c on c.comanda = v.comanda ');
    SQL.Add(' left join sgc_produtos p on p.cod_prod = v.cod_prod ');
    SQL.Add(' left join SGC_FAMILIA_PROD f on f.ID = v.ID_FAMILIA ');
    SQL.Add(' where p.ID > 0 ');

    if StrToIntDef(edtConsComanda.Text,0) <> 0
    then SQL.Add(' and v.comanda = '+trim(edtConsComanda.Text));
    if trim(edtConsultaNOME.Text) <> ''
    then SQL.Add(' and v.COMANDA_NOME like ''%'+trim(edtConsultaNOME.Text)+'%'' ');

    if trim(edtConsultaCod.Text) <> ''
    then SQL.Add(' and v.COD_PROD = '''+trim(edtConsultaCod.Text)+''' ');
    if trim(edtConsultaProduto.Text) <> ''
    then SQL.Add(' and p.nome = '''+trim(edtConsultaProduto.Text)+''' ');
    if trim(edtConsultaParceiro.Text) <> ''
    then SQL.Add(' and f.nome = '''+trim(edtConsultaParceiro.Text)+''' ');

    case cbxComandaCons.ItemIndex of
      0 : SQL.Add(' and coalesce(v.fechada,''N'') = ''N'' ');
      1 : SQL.Add(' and coalesce(v.fechada,''N'') = ''S'' ');
    end;
  end;

  if cds.Active
  then cds.Close;

  cds.IndexFieldNames := 'DT_INCLUI;COMANDA;COMANDA_NOME';

  dbgConsulta.DataSource := ds;
  cds.Open;

  if  (not bModal)
  and (not cds.IsEmpty)
  and (dbgConsulta.CanFocus)
  then dbgConsulta.SetFocus;

  HabilitaControles;
end;

procedure TfmSGV_VENDAS.cdsAfterPost(DataSet: TDataSet);
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

procedure TfmSGV_VENDAS.cdsBeforePost(DataSet: TDataSet);
begin
  cdsIDALTERADO.AsString := cdsIDALT.AsString;

end;

procedure TfmSGV_VENDAS.cdsIDGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
if cds.State in [dsInsert]
  then Text := 'Automático'
  else Text := cdsID.AsString;
end;

procedure TfmSGV_VENDAS.cdsAfterEdit(DataSet: TDataSet);
begin
  cdsUSU_ALTERA.AsString := sUsuario;
  cdsDT_ALTERA.AsDateTime := now;
  HabilitaControles;
end;

procedure TfmSGV_VENDAS.cdsAfterInsert(DataSet: TDataSet);
begin
  cdsUSU_INCLUI.AsString := sUsuario;
  HabilitaControles;
end;

procedure TfmSGV_VENDAS.dspUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise exception.Create(E.Message);
end;

procedure TfmSGV_VENDAS.BeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
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
procedure TfmSGV_VENDAS.dbgConsultaDblClick(Sender: TObject);
begin
{  if bModal
  and not cds.IsEmpty
  then btTransportaClick(self);
  btIncluiClick(btEditar);}
end;

procedure TfmSGV_VENDAS.cdsNewRecord(DataSet: TDataSet);
begin
  cdsID.ReadOnly := false;
  cdsIMPRESSO.AsString := 'N';
  HabilitaControles;

end;

procedure TfmSGV_VENDAS.cdsORIGEM_MERCADORIAGetText(Sender: TField;
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

procedure TfmSGV_VENDAS.cdsTIPO_ITEMGetText(Sender: TField; var Text: string;
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

procedure TfmSGV_VENDAS.cdsAfterCancel(DataSet: TDataSet);
begin
  cdsID.ReadOnly := true;
  HabilitaControles;
end;

procedure TfmSGV_VENDAS.cdsAfterDelete(DataSet: TDataSet);
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

procedure TfmSGV_VENDAS.btSalvaClick(Sender: TObject);
begin
  if Pode_Salvar
  then cds.Post;
  HabilitaControles;
end;

procedure TfmSGV_VENDAS.btImprimeClick(Sender: TObject);
begin

  if (not cds.Active) or cds.IsEmpty then exit;

  with RelVisual do
  begin
    TituloRelatorio := Caption;

    cds.IndexFieldNames := 'NOME_FAMILIA;DT_INCLUI;COMANDA;COMANDA_NOME';

    Cabecalho1Esquerda := 'SisteMoto '+sEmpresa;
    Cabecalho3Esquerda := cbxComandaCons.Text;

//    if (edtConsulta.Text <> '') or (edtConsultaNOME.Text <> '') then
//    Cabecalho3Esquerda := ('Filtrando por: '+edtConsulta.Text+' Descrição: '+edtConsultaNOME.Text);

    Cabecalhos.Clear;

    Limpa_Campos;

    DefinicaoCampos.Add('G1;100;E;;NOME_FAMILIA; ');

    DefinicaoCampos.Add('D0;40;E;dd/mm/yyyy hh:nn:ss;DT_INCLUI;Data/Hora');
    DefinicaoCampos.Add('D0;20;D;;COMANDA; ');
    DefinicaoCampos.Add('D0;52;E;;COMANDA_NOME;Comanda');
  //  DefinicaoCampos.Add('D0;15;D;;COD_PROD;Código');
    DefinicaoCampos.Add('D0;55;E;;NOME_PROD;Produto');

    DefinicaoCampos.Add('D1;15;D;##,##0;QUANTIDADE;Qtde.');

    DefinicaoCampos.Add('D0;22;D;##,##0.00;VALOR;Preço');
    DefinicaoCampos.Add('D1;22;D;##,##0.00;TOTAL;Total');

    DefinicaoCampos.Add('D0;200;D;;NOME_FAMILIA;Parceiro');


    Execute;
  end;



  end;

procedure TfmSGV_VENDAS.btIncluiClick(Sender: TObject);
begin
  if not cds.Active then btConsultaClick(self);
  if not cds.Active then exit;
  if not bCad then Exit;

  if (TBitBtn(sender).Tag = 0)
  and cds.IsEmpty then exit;
  if (TBitBtn(sender).Tag = 1)
  then if (bInc)
       then
       begin
         if TurnoAberto then
         begin
           MessageBox(Handle, pchar('Turno de ontem não foi fechado!'), 'Encerrar Turno', MB_ICONWARNING);
           exit;
         end;
         if TurnoFechado then
         begin
           if MessageBox(Handle, pchar('Turno ainda não foi aberto. Deseja abrir?'), 'Abrir Turno', MB_YESNO+MB_ICONQUESTION) = id_yes
           then AbreTurno
           else exit;
         end;

         cds.Insert;
         if StrToIntDef(edtConsComanda.Text,0) <> 0
         then cdsCOMANDA.AsInteger := StrToIntDef(edtConsComanda.Text,0);
       end
       else exit;
  pgc.ActivePage := tsCadastro;
  edtComanda.SetFocus;
  HabilitaControles;

end;

procedure TfmSGV_VENDAS.btDesisteClick(Sender: TObject);
begin
  if cds.State in [dsInsert, dsEdit]
  then cds.Cancel;
  pgc.ActivePage := tsConsulta;
  HabilitaControles;
end;

procedure TfmSGV_VENDAS.btExcluiClick(Sender: TObject);
begin
  if MessageBox(Handle, pchar('Confirma a exclusão deste registro ?'), 'Excluir', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = id_no
  then Exit;
  cds.delete;
  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGV_VENDAS.btSaiClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSGV_VENDAS.tsConsultaShow(Sender: TObject);
begin
  if cds.State in [dsInsert, dsEdit]
  then cds.Cancel;

  if  (not cds.IsEmpty)
  and (dbgConsulta.CanFocus)
  then dbgConsulta.SetFocus
  else if edtConsComanda.CanFocus
       then edtConsComanda.SetFocus;
end;

procedure TfmSGV_VENDAS.edtCodFamiliaButtonClick(Sender: TObject);
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

procedure TfmSGV_VENDAS.edtCodFamiliaChange(Sender: TObject);
begin
  if edtCodFamilia.Focused then edtNomeFamilia.Clear;
end;

procedure TfmSGV_VENDAS.edtCodFamiliaExit(Sender: TObject);
begin
  if (trim(edtCodFamilia.Text) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsNOME_FAMILIA.AsString := Query(' select * from sgc_FAMILIA_PROD where ID = '''+trim(edtCodFamilia.Text)+'''  ',sPath_Local,'NOME');
  end;
end;

procedure TfmSGV_VENDAS.edtCodProdButtonClick(Sender: TObject);
var
  s : string;
begin
  if cds.Active
  and (not (cds.State in [dsInsert, dsEdit]))
  then cds.Edit;

  s := AbreTela('SGC030','SGC.BPL',sUsuario,sPath_Local,edtCodProd.Text+';'+edtNomeProd.Text+';', sBancoDeDados,cCorBluefield,cCorNormal,iEmp, 0,true);
  if (trim(s) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsCOD_PROD.AsString := Separa_String(s,2);

    BuscaProduto(cdsCOD_PROD.AsString);

    {cdsNOME_PROD.AsString := Separa_String(s,3);
    cdsID_FAMILIA.AsString := Separa_String(s,4);
    cdsNOME_FAMILIA.AsString := Separa_String(s,5);
    cdsUNIDADE.AsString := Separa_String(s,6);
    x1 := StrToFloatDef(Separa_String(s,7),0);
    x2 := StrToFloatDef(Separa_String(s,8),0);
    x3 := StrToFloatDef(Separa_String(s,9),0);

    if bSocio
    then x := x2
    else x := x1;

    //if (x3 > 0) and (x3 < x) then x := x3; //promoção

    cdsVALOR.AsFloat := x;
    cdsQUANTIDADE.AsFloat := 1;
    cdsTOTAL.AsFloat := cdsVALOR.AsFloat;
    }
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;


procedure TfmSGV_VENDAS.edtCodProdChange(Sender: TObject);
begin
  if edtCodProd.Focused then edtNomeProd.Clear;
end;

procedure TfmSGV_VENDAS.edtCodProdExit(Sender: TObject);
begin
  if (trim(edtCodProd.Text) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    BuscaProduto(trim(edtCodProd.Text));
  end;
end;

procedure TfmSGV_VENDAS.edtConsultaCodChange(Sender: TObject);
begin
if cds.Active then cds.Close;

end;

procedure TfmSGV_VENDAS.edtConsultaCodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_down then dbgConsulta.SetFocus;
end;


procedure TfmSGV_VENDAS.edtConsultaCodKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = chr(vk_return) then btConsultaClick(self);
end;

procedure TfmSGV_VENDAS.dbgConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
{  if key = chr(vk_return) then
  begin
    if bModal
    and not cds.IsEmpty
    then btTransportaClick(self);
    btIncluiClick(btEditar);
  end;}
end;

procedure TfmSGV_VENDAS.
dbgConsultaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_f9 then edtComanda.SetFocus;
end;

procedure TfmSGV_VENDAS.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(vk_escape) then
  begin
    if pgc.ActivePage = tsCadastro
    then btDesisteClick(self)
    else if bModal
         then btSaiClick(self);
  end;
end;

procedure TfmSGV_VENDAS.Direitos;
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
    dtmCon := TdtmConexao.Create(fmSGV_VENDAS);
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

  btExclui.Visible := false;//bExc;
  btInclui.Enabled := bCad and bInc;
  btEditar.Enabled := false;//bCad;
//  tsCadastro.TabVisible := bCad;
  btTransporta.Visible := false;//bModal;

  if not bExc
  then dsp.Options := dsp.Options + [poDisableDeletes];
  if not bInc
  then dsp.Options := dsp.Options + [poDisableInserts];
  if not bAlt
  then dsp.Options := dsp.Options + [poDisableEdits];
end;

(******************************************************************************)

function TfmSGV_VENDAS.Pode_Salvar: boolean;
begin
  result := false;

  if cdsCOMANDA.AsInteger = 0 then
  begin
    MessageBox(Handle, pchar('Informe a comanda.'), 'Aviso', MB_ICONWARNING);
    edtComanda.SetFocus;
    Exit;
  end;

  if trim(cdsCOMANDA_NOME.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Comanda não está aberta.'), 'Aviso', MB_ICONWARNING);
    edtComanda.SetFocus;
    Exit;
  end;

  if trim(cdsCOD_PROD.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe o produto.'), 'Aviso', MB_ICONWARNING);
    edtCodProd.SetFocus;
    Exit;
  end;


  result := true;
end;

(******************************************************************************)

procedure TfmSGV_VENDAS.edtComandaExit(Sender: TObject);
begin
  if (StrToIntDef(edtComanda.Text,0) <> 0)
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsCOMANDA_NOME.AsString := Query(' select nome from SGV_COMANDAS where COMANDA = '''+trim(edtComanda.Text)+''' and coalesce(fechada,''N'') = ''N'' order by ID ',sPath_Local,'nome');

    if cdsCOMANDA_NOME.AsString = '' then
    begin
      MessageBox(Handle, pchar('Comanda não está aberta!'), 'Aviso', MB_ICONWARNING);
    end;
  end;
end;

procedure TfmSGV_VENDAS.cdsQUANTIDADEChange(Sender: TField);
begin
  cdsTOTAL.AsFloat := cdsQUANTIDADE.AsFloat * cdsVALOR.AsFloat;
end;


procedure TfmSGV_VENDAS.btFecharComandaClick(Sender: TObject);
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

  if cds.IsEmpty then btConsultaClick(self);

  if cds.IsEmpty then
  begin
    MessageBox(Handle, pchar('Comanda não encontrada.'), 'Aviso', MB_ICONWARNING);
    edtConsComanda.SetFocus;
    exit;
  end;

  x := 0;
  cds.First;
  s := 'Comanda '+cdsCOMANDA.AsString+' '+cdsCOMANDA_NOME.AsString;
  while not cds.Eof do
  begin
    x := x + cdsTOTAL.AsFloat;
    cds.Next;
  end;

  if
  MessageBox(Handle, pchar(s+#13+#13
                          +'Valor total: R$ '+FormatFloat('#,##0.00',x)+#13
                          +#13
                          +'Forma de pagamento: Dinheiro'+#13
                          +#13
                          +'Confirma fechar a comanda?'
                          ), 'Fechar comanda', MB_YESNO+MB_ICONQUESTION) = id_no
  then exit;


  //amarrar o ID da comanda em aberto aqui para não dar confusão!
  with dtmCon.qrApoio do
  try
    td.TransactionID := Cardinal(FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    td.IsolationLevel := xilREADCOMMITTED;
    SQLConnection.StartTransaction(td);

    if active then close;
    SQL.Clear;

    //trigger em SGV_COMANDAS fecha o SGV_VENDAS
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

  btImprimeClick(self);

  edtConsComanda.Clear;
  btConsultaClick(self);
end;

procedure TfmSGV_VENDAS.AbrirComanda(iOp:integer);
var s : string;
begin
  s := AbreTela('SGV002','SGV.BPL',sUsuario,sPath_Local,'', sBancoDeDados,cCorBluefield,cCorNormal,iEmp, 1,true);

  if (trim(s) <> '')
//  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    if pgc.ActivePage = tsCadastro then
    begin
      edtComanda.Text := Separa_String(s,2);
      edtComanda.SetFocus;
    end
    else
    begin
      edtConsComanda.Text := Separa_String(s,2);
      btConsultaClick(self);
    end;
  end;
end;

procedure TfmSGV_VENDAS.btAbreComandaClick(Sender: TObject);
begin
  AbrirComanda(1);
end;

procedure TfmSGV_VENDAS.BuscaProduto(sOp:string);
var x, x1, x2, x3 : extended;
    bSocio : boolean;
begin
  with dtmCon.qrApoio do
  begin
    if active then close;
    SQL.Clear;
    SQL.Add(' select p.*, f.nome NOME_FAMILIA from SGC_PRODUTOS p left join SGC_FAMILIA_PROD f on f.ID = p.ID_FAMILIA ');
    SQL.Add(' where p.cod_prod = :p ');
    ParamByName('p').AsString := sOp;
    Open;
    cdsNOME_PROD.AsString := FieldByName('nome').AsString;
    cdsID_FAMILIA.AsString := FieldByName('ID_FAMILIA').AsString;
    cdsNOME_FAMILIA.AsString := FieldByName('NOME_FAMILIA').AsString;
    cdsUNIDADE.AsString := FieldByName('UNIDADE').AsString;

    x1 := FieldByName('PRECO').AsFloat;
    x2 := FieldByName('PRECO_SOCIO').AsFloat;
    x3 := FieldByName('PRECO_ESPECIAL').AsFloat;
    close;

    bSocio := Query(' select SOCIO from SGV_COMANDAS where COMANDA = '''+trim(edtComanda.Text)+''' and coalesce(fechada,''N'') = ''N'' order by ID ',sPath_Local
             ,'SOCIO') = 'S';

    if bSocio
    and (x2 > 0)
    then x := x2
    else x := x1;

    //if (x3 > 0) and (x3 < x) then x := x3; //promoção

    cdsVALOR.AsFloat := x;
    cdsQUANTIDADE.AsFloat := 1;
    cdsTOTAL.AsFloat := cdsVALOR.AsFloat;

  end;
end;

function TfmSGV_VENDAS.TurnoAberto: boolean;
begin
  result := false;

  with dtmCon.qrApoio do
  begin
    if active then close;
    SQL.Clear;
    SQL.Add(' select * from SGV_TURNOS where coalesce(fechado,''N'') = ''N'' and dt_inclui < :dt ');
    ParamByName('dt').AsDateTime := date;
    Open;
    result := not IsEmpty;
    close;
  end;
end;

function TfmSGV_VENDAS.TurnoFechado: boolean;
begin
  result := false;

  with dtmCon.qrApoio do
  begin
    if active then close;
    SQL.Clear;
    SQL.Add(' select * from SGV_TURNOS where coalesce(fechado,''N'') = ''N''  ');
    Open;
    result := IsEmpty;
    close;
  end;
end;

procedure TfmSGV_VENDAS.AbreTurno;
var
  td : TTransactionDesc;
begin

  with dtmCon.qrApoio do
  try
    td.TransactionID := Cardinal(FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    td.IsolationLevel := xilREADCOMMITTED;
    SQLConnection.StartTransaction(td);

    if active then close;
    SQL.Clear;

    //trigger em SGV_COMANDAS fecha o SGV_VENDAS
    SQL.Add(' INSERT INTO SGV_TURNOS (USU_INCLUI) VALUES (:u)  ');
    ParamByName('u').AsString := sUsuario;
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

end;

exports
  SGV001;

procedure TfmSGV_VENDAS.btFechaTurnoClick(Sender: TObject);
var
  td : TTransactionDesc;
  x : extended;
  s : string;
begin
  if TurnoFechado then
  begin
    MessageBox(Handle, pchar('Não existe turno aberto.'), 'Aviso', MB_ICONWARNING);
    exit;
  end;

  if ComandasAbertas then
  begin
    MessageBox(Handle, pchar('Existem comandas abertas.'), 'Aviso', MB_ICONWARNING);
    exit;
  end;

  if MessageBox(Handle, pchar('Confirma fechar o turno?'), 'Fechar Turno', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = id_no
  then exit;

  with dtmCon.qrApoio do
  try
    td.TransactionID := Cardinal(FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    td.IsolationLevel := xilREADCOMMITTED;
    SQLConnection.StartTransaction(td);

    if active then close;
    SQL.Clear;


    SQL.Add(' update SGV_TURNOS set FECHADO = ''S'', usu_altera = :u, dt_altera = ''now''  ');
    SQL.Add(' where coalesce(fechado,''N'') = ''N'' ');
    ParamByName('u').AsString := sUsuario;
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

  MessageBox(Handle, pchar('Turno fechado.'), 'Aviso', MB_ICONWARNING);

  btImprimeClick(self);

  btConsultaClick(self);
end;

function TfmSGV_VENDAS.ComandasAbertas: boolean;
begin
  result := false;

  with dtmCon.qrApoio do
  begin
    if active then close;
    SQL.Clear;
    SQL.Add(' select * from SGV_VENDAS where coalesce(FECHADA,''N'') = ''N''  ');
    Open;
    result := not IsEmpty;
    close;
  end;
end;

end.


