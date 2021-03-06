unit uSGC_ENDERECOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, bfdbGrid, DB, DBClient, Provider, FMTBcd,
  SqlExpr, ExtCtrls, DBCtrls, Mask, udtmConexao, ComCtrls,
  Buttons, bfEdit, bfdbEdit, DBGrids, bfdbMemo, RelVisualBlue, bfdbComboBox,
  bfdbEditButton, dbxpress;

type
  TfmSGC_ENDERECOS = class(TForm)
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
    qrDT_INCLUI: TSQLTimeStampField;
    cdsID: TIntegerField;
    cdsDT_INCLUI: TSQLTimeStampField;
    ckbInativoCons: TCheckBox;
    qrINATIVO: TStringField;
    cdsINATIVO: TStringField;
    ckbInativo: TDBCheckBox;
    qrID_PARTICIPANTE: TIntegerField;
    qrTIPO_ENDERECO: TStringField;
    qrNOME_ENDERECO: TStringField;
    qrENDERECO: TStringField;
    qrNUMERO: TStringField;
    qrCOMPLEMENTO: TStringField;
    qrBAIRRO: TStringField;
    qrCEP: TIntegerField;
    cdsID_PARTICIPANTE: TIntegerField;
    cdsTIPO_ENDERECO: TStringField;
    cdsNOME_ENDERECO: TStringField;
    cdsENDERECO: TStringField;
    cdsNUMERO: TStringField;
    cdsCOMPLEMENTO: TStringField;
    cdsBAIRRO: TStringField;
    cdsCEP: TIntegerField;
    Label1: TLabel;
    Label2: TLabel;
    edtDescricao: TbfdbEdit;
    cbxTipoEndereco: TbfdbComboBox;
    Label3: TLabel;
    edtEndereco: TbfdbEdit;
    Label4: TLabel;
    edtNumero: TbfdbEdit;
    Label5: TLabel;
    edtComplemento: TbfdbEdit;
    Label6: TLabel;
    edtBairro: TbfdbEdit;
    Label7: TLabel;
    edtCEP: TbfdbEdit;
    edtCodParticipante: TbfdbEditButton;
    cdsNOME_PARTICIPANTE: TStringField;
    qrNOME_PARTICIPANTE: TStringField;
    edtNomeParticipante: TbfdbEdit;
    Label8: TLabel;
    cdsCOD_CIDADE: TIntegerField;
    cdsUF: TStringField;
    qrCOD_CIDADE: TIntegerField;
    qrUF: TStringField;
    qrNOME_CIDADE: TStringField;
    cdsNOME_CIDADE: TStringField;
    edtCodCidade: TbfdbEditButton;
    edtNomeCidade: TbfdbEdit;
    Label9: TLabel;
    Label10: TLabel;
    edtUF: TbfdbEdit;
    edtConsCidade: TbfEdit;
    edtConsUF: TbfEdit;
    qrApoio: TSQLQuery;

    procedure Direitos;
    function Pode_Salvar: boolean;
    function ExisteCobranca: boolean;

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
    procedure edtCodParticipanteButtonClick(Sender: TObject);
    procedure edtCodParticipanteChange(Sender: TObject);
    procedure edtCodParticipanteExit(Sender: TObject);
    procedure cdsTIPO_ENDERECOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure edtCodCidadeButtonClick(Sender: TObject);
    procedure edtCodCidadeChange(Sender: TObject);
    procedure edtCodCidadeExit(Sender: TObject);

  private
    procedure HabilitaControles;
    { Private declarations }
  public
    cCorBluefield, cCorNormal : tColor;
    sRetorno,
    sEmpresa,
    sUsuario, sPath_Local, sBancoDeDados, sidParticipante, sNomeParticipante: string;
    bDBAberto, bModal,
    bCad, bInc, bAlt, bExc : boolean;
    dtmCon : TdtmConexao;
    //id : string;
    iEmp, id : integer;
    { Public declarations }
  end;

var
  fmSGC_ENDERECOS: TfmSGC_ENDERECOS;
const
  sCodProg : string = 'SGC016';

implementation

uses uFuncoesDB, uFuncoes, uFuncoesTelas;

{$R *.dfm}

function SGC016(sOpUsuario, sOpLocal, sOpFiltros, sOpDBSel: pchar; cOpBlueField, cOpNormal : TColor; iEmpresa, iOp: integer; bOpModal: boolean = false): pchar;
begin
  Result := '';
  with TfmSGC_ENDERECOS.Create(Application) do
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
    edtConsultaNOME.Text := Separa_String(sOpFiltros,2);
    edtConsCidade.Text := Separa_String(sOpFiltros,3);
    sidParticipante := edtConsulta.Text;
    sNomeParticipante := edtConsultaNOME.Text;
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

procedure TfmSGC_ENDERECOS.btTransportaClick(Sender: TObject);
begin
  if bModal then
  begin
    sRetorno := cdsID.AsString+';'
               +cdsNOME_ENDERECO.AsString+';'
               ;

    ModalResult := mrOk;
  end;
end;

function TfmSGC_ENDERECOS.ExisteCobranca: boolean;
begin
  result := false;
  if cbxTipoEndereco.ItemIndex = 0 then
  begin
    with qrApoio do
    begin
      SQLConnection := dtmCon.SQLDB;
      if active then close;
      SQL.Clear;
      SQL.Add('select * from SGC_ENDERECOS');
      SQL.Add('where ID <> '+IntToStr(cdsID.AsInteger)+' ');
      SQL.Add('and ID_PARTICIPANTE = '+IntToStr(cdsID_PARTICIPANTE.AsInteger)+' ');
      SQL.Add('and INATIVO = ''N'' ');
      SQL.Add('and TIPO_ENDERECO = ''01'' ');
      open;
      if not IsEmpty then
      begin
        MessageBox(Handle, pchar('J? existe um Endere?o de Cobran?a cadastrado para este participante'), 'Aviso', MB_ICONWARNING);
        cbxTipoEndereco.SetFocus;
        close;
        result := true;
        exit;
      end;
      close;
    end;
  end;
end;

procedure TfmSGC_ENDERECOS.FormCreate(Sender: TObject);
begin
  bDBAberto := false;

  btConsulta.Glyph.LoadFromResourceName(HInstance,'CONS');
  edtCodCidade.Glyph.LoadFromResourceName(HInstance,'CONS');
  edtCodParticipante.Glyph.LoadFromResourceName(HInstance,'CONS');
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

end;

procedure TfmSGC_ENDERECOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if bDBAberto
  then bDBAberto := not FechaDataModule(dtmCon);

  if not bModal then
  begin
    fmSGC_ENDERECOS := nil;
    Action := caFree;
  end;
end;

procedure TfmSGC_ENDERECOS.HabilitaControles;
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

procedure TfmSGC_ENDERECOS.edtCodCidadeButtonClick(Sender: TObject);
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

procedure TfmSGC_ENDERECOS.edtCodCidadeChange(Sender: TObject);
begin
  if edtCodCidade.Focused then edtNomeCidade.Clear;
end;

procedure TfmSGC_ENDERECOS.edtCodCidadeExit(Sender: TObject);
begin
//  ChangeExit(DBEdit3);
  if (trim(edtCodCidade.Text) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsNOME_CIDADE.AsString := Query(' select * from sgc_CIDADES where ID = '''+trim(edtCodCidade.Text)+'''  ',sPath_Local,'NOME');
  end;
end;

procedure TfmSGC_ENDERECOS.btConsultaClick(Sender: TObject);
begin
  if not bDBAberto
  then
  begin
    dtmCon := TdtmConexao.Create(fmSGC_ENDERECOS);
    bDBAberto := AbreDataModule(dtmCon, sPath_Local, sBancoDeDados);
  end;

  if not bDBAberto then exit;
  with qr do
  begin
    SQLConnection := dtmCon.SQLDB;
    if active then close;
    SQL.Clear;
    SQL.Add(' select e.*, p.nome NOME_PARTICIPANTE, c.NOME NOME_CIDADE from SGC_ENDERECOS e');
    SQL.Add(' left join SGC_PARTICIPANTES p on p.ID = e.ID_PARTICIPANTE');
    SQL.Add(' left join SGC_CIDADES c on c.ID = e.cod_cidade');
    SQL.Add(' where e.ID > 0 ');
    if trim(edtConsulta.Text) <> ''
    then SQL.Add(' and e.ID_PARTICIPANTE = '+trim(edtConsulta.Text)+' ');
    if trim(edtConsultaNOME.Text) <> ''
    then SQL.Add(' and UPPER (p.NOME) like ''%'+trim(edtConsultaNOME.Text)+'%'' ');
    if AnsiUpperCase(trim(edtConsCidade.Text)) <> ''
    then SQL.Add(' and UPPER(c.NOME) like ''%'+trim(edtConsCidade.Text)+'%'' ');
    if  AnsiUpperCase(trim(edtConsUF.Text)) <> ''
    then SQL.Add(' and e.UF = '''+trim(edtConsUF.Text)+''' ');

    if ckbInativoCons.Checked then
    SQL.Add(' and e.INATIVO = ''S'' ')
    else
    SQL.Add(' and e.INATIVO <> ''S'' ');

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

procedure TfmSGC_ENDERECOS.cdsAfterPost(DataSet: TDataSet);
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

procedure TfmSGC_ENDERECOS.cdsBeforePost(DataSet: TDataSet);
begin
  cdsIDALTERADO.AsString := cdsIDALT.AsString;
  if ckbInativo.Checked then
  cdsINATIVO.AsString := 'S';
end;

procedure TfmSGC_ENDERECOS.cdsAfterEdit(DataSet: TDataSet);
begin
  cdsUSU_ALTERA.AsString := sUsuario;
  cdsDT_ALTERA.AsDateTime := now;
  HabilitaControles;
end;

procedure TfmSGC_ENDERECOS.cdsAfterInsert(DataSet: TDataSet);
begin
  cdsUSU_INCLUI.AsString := sUsuario;
  HabilitaControles;
end;

procedure TfmSGC_ENDERECOS.dspUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise exception.Create(E.Message);
end;

procedure TfmSGC_ENDERECOS.BeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
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
procedure TfmSGC_ENDERECOS.dbgConsultaDblClick(Sender: TObject);
begin
  if bModal
  and not cds.IsEmpty
  then btTransportaClick(self);
  btIncluiClick(btEditar);
end;

procedure TfmSGC_ENDERECOS.cdsNewRecord(DataSet: TDataSet);
begin
  cdsID.ReadOnly := false;
  HabilitaControles;

  if (sidParticipante <> '') and (sNomeParticipante <> '')  then
  begin
    cdsID_PARTICIPANTE.AsString :=  sidParticipante;
    cdsNOME_PARTICIPANTE.AsString := sNomeParticipante;
    //cbxTipoEndereco.SetFocus;
  end;
end;

procedure TfmSGC_ENDERECOS.cdsTIPO_ENDERECOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
  begin
    if Sender.Value = '01' then
      Text := '01 - COBRAN?A';
    if Sender.Value = '02' then
      Text := '02 - ENTREGA';
  end;
end;

procedure TfmSGC_ENDERECOS.cdsAfterCancel(DataSet: TDataSet);
begin
  cdsID.ReadOnly := true;
  HabilitaControles;
end;

procedure TfmSGC_ENDERECOS.cdsAfterDelete(DataSet: TDataSet);
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

procedure TfmSGC_ENDERECOS.btSalvaClick(Sender: TObject);
begin
  if Pode_Salvar
  then cds.Post;
end;

procedure TfmSGC_ENDERECOS.btImprimeClick(Sender: TObject);
begin
 if (not cds.Active) or cds.IsEmpty then exit;

  with RelVisual do
  begin
    TituloRelatorio := Caption;

    Cabecalho1Esquerda := sEmpresa;
    Cabecalho2Centro := '';
    if (edtConsulta.Text <> '') or (edtConsultaNOME.Text <> '') then
    Cabecalho3Esquerda := ('Filtrando por: '+edtConsulta.Text+' Descri??o: '+edtConsultaNOME.Text);

    Cabecalhos.Clear;

    Limpa_Campos;
    DefinicaoCampos.Add('D2;20;E;;ID;ID');
    DefinicaoCampos.Add('D0;100;E;;NOME_ENDERECO;Descri??o');
    DefinicaoCampos.Add('D0;100;E;;ENDERECO;Endere?o');
    Execute;
  end;



  end;

procedure TfmSGC_ENDERECOS.btIncluiClick(Sender: TObject);
begin
  if not cds.Active then exit;
  if not bCad then Exit;
  if (TBitBtn(sender).Tag = 1)
  then if (bInc)
       then cds.Insert
       else exit;
  pgc.ActivePage := tsCadastro;
  edtCodParticipante.SetFocus;
  HabilitaControles;
  if cdsINATIVO.AsString <> 'S' then
  ckbInativo.Checked := false;
end;

procedure TfmSGC_ENDERECOS.btDesisteClick(Sender: TObject);
begin
  if cds.State in [dsInsert, dsEdit]
  then cds.Cancel;
  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGC_ENDERECOS.btExcluiClick(Sender: TObject);
begin
  if MessageBox(Handle, pchar('Confirma a exclus?o deste registro ?'), 'Excluir', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = id_no
  then Exit;
  cds.delete;
  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGC_ENDERECOS.btSaiClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSGC_ENDERECOS.tsConsultaShow(Sender: TObject);
begin
  if cds.State in [dsInsert, dsEdit]
  then cds.Cancel;

  if  (not cds.IsEmpty)
  and (dbgConsulta.CanFocus)
  then dbgConsulta.SetFocus
  else if edtConsulta.CanFocus
       then edtConsulta.SetFocus;
end;

procedure TfmSGC_ENDERECOS.edtCodParticipanteButtonClick(Sender: TObject);
var
  s : string;
begin
  if cds.Active
  and (not (cds.State in [dsInsert, dsEdit]))
  then cds.Edit;

  s := AbreTela('SGC015','SGC.BPL',sUsuario,sPath_Local,edtCodParticipante.Text+';', sBancoDeDados,cCorBluefield,cCorNormal,iEmp, 0,true);
  if (trim(s) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsID_PARTICIPANTE.AsString := Separa_String(s,1);
    cdsNOME_PARTICIPANTE.AsString := Separa_String(s,2);

    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfmSGC_ENDERECOS.edtCodParticipanteChange(Sender: TObject);
begin
  if edtCodParticipante.Focused then edtNomeParticipante.Clear;
end;

procedure TfmSGC_ENDERECOS.edtCodParticipanteExit(Sender: TObject);
begin
//  ChangeExit(DBEdit3);
  if (trim(edtCodParticipante.Text) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsNOME_PARTICIPANTE.AsString := Query(' select * from sgc_PARTICIPANTES where ID = '''+trim(edtCodParticipante.Text)+'''  ',sPath_Local,'NOME');
  end;
end;

procedure TfmSGC_ENDERECOS.edtConsultaChange(Sender: TObject);
begin
if cds.Active then cds.Close;

end;

procedure TfmSGC_ENDERECOS.edtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_down then dbgConsulta.SetFocus;
end;


procedure TfmSGC_ENDERECOS.edtConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = chr(vk_return) then btConsultaClick(self);
end;

procedure TfmSGC_ENDERECOS.dbgConsultaKeyPress(Sender: TObject;
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

procedure TfmSGC_ENDERECOS.
dbgConsultaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_f9 then edtConsulta.SetFocus;
end;

procedure TfmSGC_ENDERECOS.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(vk_escape) then
  begin
    if pgc.ActivePage = tsCadastro
    then btDesisteClick(self)
    else if bModal
         then btSaiClick(self);
  end;
end;

procedure TfmSGC_ENDERECOS.Direitos;
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
    dtmCon := TdtmConexao.Create(fmSGC_ENDERECOS);
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

function TfmSGC_ENDERECOS.Pode_Salvar: boolean;
begin
  result := false;

  if  Trim(cdsID_PARTICIPANTE.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe o Participante.'), 'Aviso', MB_ICONWARNING);
    edtCodParticipante.SetFocus;
    Exit;
  end;

  if trim(cdsTIPO_ENDERECO.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe o Tipo.'), 'Aviso', MB_ICONWARNING);
    cbxTipoEndereco.SetFocus;
    Exit;
  end;

  if ExisteCobranca then exit;

  if trim(cdsNOME_ENDERECO.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe a descri??o.'), 'Aviso', MB_ICONWARNING);
    edtDescricao.SetFocus;
    Exit;
  end;

  if trim(cdsENDERECO.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe o Endereco.'), 'Aviso', MB_ICONWARNING);
    edtEndereco.SetFocus;
    Exit;
  end;

  if trim(cdsNUMERO.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe o N?mero.'), 'Aviso', MB_ICONWARNING);
    edtNumero.SetFocus;
    Exit;
  end;

  if trim(cdsBAIRRO.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe o Bairro.'), 'Aviso', MB_ICONWARNING);
    edtBairro.SetFocus;
    Exit;
  end;

  if trim(IntToStr(cdsCEP.AsInteger)) = '' then
  begin
    MessageBox(Handle, pchar('Informe o CEP.'), 'Aviso', MB_ICONWARNING);
    edtCEP.SetFocus;
    Exit;
  end;

  

  result := true;
end;

(******************************************************************************)
//exports tem que ser a ultima coisa antes do end.
exports
  SGC016;

end.
