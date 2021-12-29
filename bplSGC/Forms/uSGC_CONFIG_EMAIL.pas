unit uSGC_CONFIG_EMAIL;

interface                               

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DB, DBClient, Provider, FMTBcd,
  SqlExpr, ExtCtrls, DBCtrls, Mask, udtmConexao, ComCtrls,
  Buttons, bfEdit,  bfdbEdit, DBGrids, bfdbGrid, bfdbEditButton,
  RelVisualBlue, bfdbComboBox, dbxpress;

type
  TfmSGC_CONFIG_EMAIL = class(TForm)
    cds: TClientDataSet;
    dsp: TDataSetProvider;
    ds: TDataSource;
    pgc: TPageControl;
    tsCadastro: TTabSheet;
    tsConsulta: TTabSheet;
    GroupBox1: TGroupBox;
    btConsulta: TBitBtn;
    btSalva: TBitBtn;
    btDesiste: TBitBtn;
    GroupBox2: TGroupBox;
    btSai: TBitBtn;
    dbgConsulta: TbfdbGrid;
    btInclui: TBitBtn;
    btEditar: TBitBtn;
    edtConsulta: TbfEdit;
    btTransporta: TBitBtn;
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
    cdsCNPJ: TStringField;
    btImprime: TBitBtn;
    RelVisual: TRelVisualBlue;
    edtCNPJCons: TbfEdit;
    qr: TSQLQuery;
    qrID: TIntegerField;
    Label1: TLabel;
    Label2: TLabel;
    edtSERV_SMTP: TbfdbEdit;
    Label4: TLabel;
    edtPortSMTP: TbfdbEdit;
    Label5: TLabel;
    edtedtSERV_POP3: TbfdbEdit;
    Label6: TLabel;
    edtPort_POP3: TbfdbEdit;
    Label7: TLabel;
    edtUsuario: TbfdbEdit;
    Label8: TLabel;
    edtSenha: TbfdbEdit;
    Label9: TLabel;
    edtConfSenha: TbfdbEdit;
    Label10: TLabel;
    Label11: TLabel;
    cbxMAIL_AUTENTICACAO: TbfdbComboBox;
    cbxMAIL_SSL: TbfdbComboBox;
    edtEmail: TbfdbEdit;
    edtCadEmpresa: TbfdbEdit;
    edtCadCNPJ: TbfdbEdit;
    ckbInativoCons: TCheckBox;
    ckbInativo: TDBCheckBox;
    qrNOME: TStringField;
    qrUSU_INCLUI: TStringField;
    qrDT_INCLUI: TSQLTimeStampField;
    qrUSU_ALTERA: TStringField;
    qrDT_ALTERA: TSQLTimeStampField;
    qrIDALT: TStringField;
    qrIDALTERADO: TStringField;
    qrCNPJ: TStringField;
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
    qrFAX: TStringField;
    qrMAIL: TStringField;
    qrTIPO_EMP: TIntegerField;
    qrCOD_CIDADE: TIntegerField;
    qrMAIL_EMAIL: TStringField;
    qrMAIL_SERV_SMTP: TStringField;
    qrMAIL_PORTA_SMTP: TStringField;
    qrMAIL_SERV_POP3: TStringField;
    qrMAIL_PORTA_POP3: TStringField;
    qrMAIL_USUARIO: TStringField;
    qrMAIL_SENHA: TStringField;
    qrMAIL_CONF_SENHA: TStringField;
    qrMAIL_AUTENTICACAO: TStringField;
    qrMAIL_SSL: TStringField;
    qrINATIVO: TStringField;
    qrNOME_CIDADE: TStringField;
    cdsCOD_CONTROLE: TIntegerField;
    cdsINSC_EST: TStringField;
    cdsINSC_MUN: TStringField;
    cdsUF: TStringField;
    cdsENDERECO: TStringField;
    cdsNUMERO: TStringField;
    cdsCOMPLEMENTO: TStringField;
    cdsBAIRRO: TStringField;
    cdsCEP: TIntegerField;
    cdsFONE: TStringField;
    cdsFAX: TStringField;
    cdsMAIL: TStringField;
    cdsTIPO_EMP: TIntegerField;
    cdsCOD_CIDADE: TIntegerField;
    cdsMAIL_EMAIL: TStringField;
    cdsMAIL_SERV_SMTP: TStringField;
    cdsMAIL_PORTA_SMTP: TStringField;
    cdsMAIL_SERV_POP3: TStringField;
    cdsMAIL_PORTA_POP3: TStringField;
    cdsMAIL_USUARIO: TStringField;
    cdsMAIL_SENHA: TStringField;
    cdsMAIL_CONF_SENHA: TStringField;
    cdsMAIL_AUTENTICACAO: TStringField;
    cdsMAIL_SSL: TStringField;
    cdsINATIVO: TStringField;
    cdsNOME_CIDADE: TStringField;

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
    procedure cdsIDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsCNPJGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btConsultaModuloClick(Sender: TObject);
    procedure btImprimeClick(Sender: TObject);
    procedure edtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgConsultaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConsultaChange(Sender: TObject);

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
  fmSGC_CONFIG_EMAIL: TfmSGC_CONFIG_EMAIL;
const
  sCodProg : string = 'SGC007';

implementation

uses uFuncoesDB, uFuncoes, uFuncoesTelas;

{$R *.dfm}

function SGC007(sOpUsuario, sOpLocal, sOpFiltros, sOpDBSel: pchar; cOpBlueField, cOpNormal : TColor; iEmpresa, iOp: integer; bOpModal: boolean = false): pchar;
begin
  Result := '';
  with TfmSGC_CONFIG_EMAIL.Create(Application) do
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

procedure TfmSGC_CONFIG_EMAIL.btTransportaClick(Sender: TObject);
begin
  if bModal then
  begin
    sRetorno := cdsID.AsString+';'
               +cdsNOME.AsString+';'
               ;

    ModalResult := mrOk;
  end;
end;

procedure TfmSGC_CONFIG_EMAIL.FormCreate(Sender: TObject);
begin
  bDBAberto := false;
  btConsulta.Glyph.LoadFromResourceName(HInstance,'CONS');
  btTransporta.Glyph.LoadFromResourceName(HInstance,'DIR');
  btImprime.Glyph.LoadFromResourceName(HInstance,'PRINT');
  btInclui.Glyph.LoadFromResourceName(HInstance,'INC');
  btSalva.Glyph.LoadFromResourceName(HInstance,'SALVA');
  btDesiste.Glyph.LoadFromResourceName(HInstance,'DESIST');

  btSai.Glyph.LoadFromResourceName(HInstance,'SAI');
  btEditar.Glyph.LoadFromResourceName(HInstance,'EDIT');


  cbxMAIL_AUTENTICACAO.ItemIndex := 0;
  cbxMAIL_SSL.ItemIndex := 0;

  if cdsINATIVO.AsString = 'S' then
  ckbInativo.Checked;

  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGC_CONFIG_EMAIL.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if bDBAberto
  then bDBAberto := not FechaDataModule(dtmCon);

  if not bModal then
  begin
    fmSGC_CONFIG_EMAIL := nil;
    Action := caFree;
  end;  
end;

procedure TfmSGC_CONFIG_EMAIL.HabilitaControles;
begin
  btInclui.Enabled     := bInc and ( (cds.State in []));
  btSalva.Enabled   := ((cds.State in [dsInsert]) and bInc)
                    or ((cds.State in [dsEdit]) and bAlt)
                    ;
  //BtnEditar.Enabled   := (DSPadrao.DataSet.State in [dsBrowse]);
  //btExclui.Enabled  := bExc and (cds.State in [dsBrowse, dsEdit]);
 // btDesiste.Enabled := (cds.State in [dsInsert, dsEdit]);
//  BtnPesquisa.Enabled := not (DSPadrao.DataSet.State in [dsInsert, dsEdit]);
end;

procedure TfmSGC_CONFIG_EMAIL.btConsultaClick(Sender: TObject);
begin
  if not bDBAberto
  then
  begin
    dtmCon := TdtmConexao.Create(fmSGC_CONFIG_EMAIL);
    bDBAberto := AbreDataModule(dtmCon, sPath_Local, sBancoDeDados);
  end;

  if not bDBAberto then exit;
  with qr do
  begin
    SQLConnection := dtmCon.SQLDB;
    if active then close;
    SQL.Clear;
    SQL.Add(' select e.* , c.nome nome_cidade from SGC_EMPRESAS e ');
    SQL.Add(' left join SGC_cidades c on c.id = e.cod_cidade ');
    SQL.Add(' where e.ID > 0');
    if trim(edtConsulta.Text) <> ''
    then SQL.Add(' and e.NOME like ''%'+trim(edtConsulta.Text)+'%'' ');
    if trim(edtCNPJCons.Text) <> ''
    then SQL.Add(' and e.CNPJ = '''+trim(edtCNPJCons.Text)+''' ');
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

procedure TfmSGC_CONFIG_EMAIL.cdsAfterPost(DataSet: TDataSet);
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

procedure TfmSGC_CONFIG_EMAIL.cdsBeforePost(DataSet: TDataSet);
begin
  cdsIDALTERADO.AsString := cdsIDALT.AsString;
  if ckbInativo.Checked then
  cdsINATIVO.AsString := 'S';
end;

procedure TfmSGC_CONFIG_EMAIL.cdsAfterEdit(DataSet: TDataSet);
begin
  cdsUSU_ALTERA.AsString := sUsuario;
  cdsDT_ALTERA.AsDateTime := now;
  HabilitaControles;
end;

procedure TfmSGC_CONFIG_EMAIL.cdsAfterInsert(DataSet: TDataSet);
begin
  cdsUSU_INCLUI.AsString := sUsuario;
  HabilitaControles;
end;

procedure TfmSGC_CONFIG_EMAIL.dspUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise exception.Create(E.Message);
end;

procedure TfmSGC_CONFIG_EMAIL.BeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
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
procedure TfmSGC_CONFIG_EMAIL.dbgConsultaDblClick(Sender: TObject);
begin
  if bModal
  and not cds.IsEmpty
  then btTransportaClick(self);
  btIncluiClick(btEditar);
end;


procedure TfmSGC_CONFIG_EMAIL.cdsNewRecord(DataSet: TDataSet);
begin
  //cdsID.ReadOnly := false;
  HabilitaControles;
end;

procedure TfmSGC_CONFIG_EMAIL.cdsAfterCancel(DataSet: TDataSet);
begin
  cdsID.ReadOnly := true;
  HabilitaControles;
end;

procedure TfmSGC_CONFIG_EMAIL.cdsAfterDelete(DataSet: TDataSet);
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

procedure TfmSGC_CONFIG_EMAIL.btSalvaClick(Sender: TObject);
begin
  if Pode_Salvar
  then cds.Post;
end;

procedure TfmSGC_CONFIG_EMAIL.btImprimeClick(Sender: TObject);
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

procedure TfmSGC_CONFIG_EMAIL.btIncluiClick(Sender: TObject);
begin
  if not cds.Active then exit;
  if not bCad then Exit;
  if (TBitBtn(sender).Tag = 1)
  then if (bInc)
       then cds.Insert
       else exit;
  pgc.ActivePage := tsCadastro;
  edtEmail.SetFocus;
  HabilitaControles;
  if cdsINATIVO.AsString <> 'S' then
  ckbInativo.Checked := false;
end;

procedure TfmSGC_CONFIG_EMAIL.btDesisteClick(Sender: TObject);
begin
  if cds.State in [dsInsert, dsEdit]
  then cds.Cancel;
  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGC_CONFIG_EMAIL.btExcluiClick(Sender: TObject);
begin
  if MessageBox(Handle, pchar('Confirma a exclusão deste registro ?'), 'Excluir', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = id_no
  then Exit;
  cds.delete;
  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGC_CONFIG_EMAIL.btSaiClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSGC_CONFIG_EMAIL.tsConsultaShow(Sender: TObject);
begin
  if cds.State in [dsInsert, dsEdit]
  then cds.Cancel;

  if  (not cds.IsEmpty)
  and (dbgConsulta.CanFocus)
  then dbgConsulta.SetFocus
  else if edtConsulta.CanFocus
       then edtConsulta.SetFocus;
end;

procedure TfmSGC_CONFIG_EMAIL.edtConsultaChange(Sender: TObject);
begin
if cds.Active then cds.Close;

end;

procedure TfmSGC_CONFIG_EMAIL.edtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_down then dbgConsulta.SetFocus;

end;

procedure TfmSGC_CONFIG_EMAIL.edtConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = chr(vk_return) then btConsultaClick(self);
end;

procedure TfmSGC_CONFIG_EMAIL.dbgConsultaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = chr(vk_return) then
  begin
    dbgConsultaDblClick(self);
  end;
end;

procedure TfmSGC_CONFIG_EMAIL.dbgConsultaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_f9 then edtConsulta.SetFocus;
end;

procedure TfmSGC_CONFIG_EMAIL.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = chr(vk_escape) then
  begin
    if btDesiste.Enabled
    then btDesisteClick(self)
    else if bModal
         then btSaiClick(self);
  end;
end;

procedure TfmSGC_CONFIG_EMAIL.Direitos;
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
    dtmCon := TdtmConexao.Create(fmSGC_CONFIG_EMAIL);
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

function TfmSGC_CONFIG_EMAIL.Pode_Salvar: boolean;
begin
  result := false;

  if trim(cdsmail_EMAIL.AsString) = '' then
  begin
    if MessageBox(Handle, pchar('O email não foi informado. Deseja salvar mesmo assim?'), 'Confirma', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = id_no
    then
    begin
      edtEmail.SetFocus;
      Exit;
    end;
  end;

  if trim(cdsmail_EMAIL.AsString) <> '' then
  begin

    if trim(cdsmail_SERV_SMTP.AsString) = '' then
    begin
      MessageBox(Handle, pchar('Digite o servidor'), 'Aviso', MB_ICONWARNING);
      edtSERV_SMTP.SetFocus;
      Exit;
    end;

    if trim(cdsmail_PORTA_SMTP.AsString) = '' then
    begin
      MessageBox(Handle, pchar('Digite a porta SMTP'), 'Aviso', MB_ICONWARNING);
      edtPortSMTP.SetFocus;
      Exit;
    end;

    if trim(cdsmail_USUARIO.AsString) = '' then
    begin
      MessageBox(Handle, pchar('Digite o Usuário.'), 'Aviso', MB_ICONWARNING);
      edtUsuario.SetFocus;
      Exit;
    end;

    if trim(cdsmail_SENHA.AsString) = '' then
    begin
      MessageBox(Handle, pchar('Digite a senha'), 'Aviso', MB_ICONWARNING);
      edtSenha.SetFocus;
      Exit;
    end;

    if trim(cdsmail_CONF_SENHA.AsString) <> trim(cdsmail_SENHA.AsString) then
    begin
      MessageBox(Handle, pchar('A senha digitada é diferente.'), 'Aviso', MB_ICONWARNING);
      edtSenha.SetFocus;
      Exit;
    end;
  end;

  

  result := true;
end;

(******************************************************************************)

procedure TfmSGC_CONFIG_EMAIL.cdsIDGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if cds.State in [dsInsert]
  then Text := 'Automático'
  else Text := cdsID.AsString;
end;

procedure TfmSGC_CONFIG_EMAIL.cdsCNPJGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if cds.State in [dsInsert,dsEdit]
  then Text := cdsCNPJ.AsString
  else Text := CgcCpfPic(cdsCNPJ.AsString);
end;

procedure TfmSGC_CONFIG_EMAIL.btConsultaModuloClick(Sender: TObject);
begin
end;
//exports tem que ser a ultima coisa antes do end.
exports
  SGC007;

end.
