unit uSGD_Acessos;

interface                               

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, bfdbGrid, DB, DBClient, Provider, FMTBcd,
  SqlExpr, ExtCtrls, DBCtrls, Mask, udtmConexao, ComCtrls,
  Buttons, bfEdit, bfdbEdit, bfdbComboBox, DBGrids, bfdbEditButton,
  RelVisualBlue, bfdbMemo;

type
  TfmSGD_AcessoS = class(TForm)
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
    qrACESSO: TStringField;
    qrNOME: TStringField;
    qrMODULO: TStringField;
    qrGRUPOMENU: TIntegerField;
    qrUSU_INCLUI: TStringField;
    qrUSU_ALTERA: TStringField;
    qrDT_ALTERA: TSQLTimeStampField;
    qrIDALT: TStringField;
    qrIDALTERADO: TStringField;
    qrMOSTRAMENU: TStringField;
    qrMODULO_NOME: TStringField;
    qrGRUPO_NOME: TStringField;
    cdsACESSO: TStringField;
    cdsNOME: TStringField;
    cdsMODULO: TStringField;
    cdsGRUPOMENU: TIntegerField;
    cdsUSU_INCLUI: TStringField;
    cdsUSU_ALTERA: TStringField;
    cdsDT_ALTERA: TSQLTimeStampField;
    cdsIDALT: TStringField;
    cdsIDALTERADO: TStringField;
    cdsMOSTRAMENU: TStringField;
    cdsMODULO_NOME: TStringField;
    cdsGRUPO_NOME: TStringField;
    Label1: TLabel;
    DBEdit1: tbfdbEdit;
    Label2: TLabel;
    DBEdit2: tbfdbEdit;
    Label3: TLabel;
    DBEdit3: TbfdbEditButton;
    DBEdit4: tbfdbEdit;
    Label5: TLabel;
    DBEdit5: TbfdbEditButton;
    DBEdit6: tbfdbEdit;
    Label7: TLabel;
    bfdbComboBox1: TbfdbComboBox;
    btTransporta: TBitBtn;
    btImprime: TBitBtn;
    RelVisual: TRelVisualBlue;
    cdsOBS: TStringField;
    qrOBS: TStringField;
    Label4: TLabel;
    bfdbMemo1: TbfdbMemo;
    edtConsultaOBS: TbfEdit;
    Label6: TLabel;
    edtConsultaNome: TbfEdit;

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

    {procedure ChangeEnter(Sender: TObject);
    procedure ChangeExit(Sender: TObject);
    }
    procedure BeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspUpdateError(Sender: TObject; DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind; var Response: TResolverResponse);
    procedure cdsAfterPost(DataSet: TDataSet);
    procedure cdsBeforePost(DataSet: TDataSet);
    procedure cdsAfterEdit(DataSet: TDataSet);
    procedure cdsAfterInsert(DataSet: TDataSet);
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure cdsAfterCancel(DataSet: TDataSet);
    procedure cdsAfterDelete(DataSet: TDataSet);
    procedure DBEdit3Change(Sender: TObject);
    procedure btTransportaClick(Sender: TObject);
    procedure btImprimeClick(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit3ButtonClick(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit5Change(Sender: TObject);
    procedure DBEdit5ButtonClick(Sender: TObject);
    procedure edtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
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
    id : string;
    iEmp : integer;
    { Public declarations }
  end;

var
  fmSGD_AcessoS: TfmSGD_AcessoS;
const
  sCodProg : string = 'SGD003';

implementation

uses uFuncoesDB, uFuncoes, uFuncoesTelas;

{$R *.dfm}

function SGD003(sOpUsuario, sOpLocal, sOpFiltros, sOpDBSel: pchar; cOpBlueField, cOpNormal : TColor; iEmpresa, iOp: integer; bOpModal: boolean = false): pchar;
begin
  Result := '';
  with TfmSGD_AcessoS.Create(Application) do
  begin;
    bModal := bOpModal;

    if bModal then
    begin
      FormStyle := fsStayOnTop;
      Visible := false;
      BorderStyle := bsDialog;
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

procedure TfmSGD_AcessoS.btTransportaClick(Sender: TObject);
begin
  if bModal then
  begin
    sRetorno := cdsACESSO.AsString+';'
               +cdsNOME.AsString+';'
               +cdsMODULO.AsString+';'
               +cdsGRUPOMENU.AsString+';'
               +cdsMOSTRAMENU.AsString+';'
               ;

    ModalResult := mrOk;
  end;
end;

procedure TfmSGD_AcessoS.FormCreate(Sender: TObject);
begin
  bDBAberto := false;

  btConsulta.Glyph.LoadFromResourceName(HInstance,'CONS');
  DBEdit3.Glyph.LoadFromResourceName(HInstance,'CONS');
  DBEdit5.Glyph.LoadFromResourceName(HInstance,'CONS');
  btImprime.Glyph.LoadFromResourceName(HInstance,'PRINT');
  btInclui.Glyph.LoadFromResourceName(HInstance,'INC');
  btSalva.Glyph.LoadFromResourceName(HInstance,'SALVA');
  btDesiste.Glyph.LoadFromResourceName(HInstance,'DESIST');
  btExclui.Glyph.LoadFromResourceName(HInstance,'EXC');
  btSai.Glyph.LoadFromResourceName(HInstance,'SAI');
  btEditar.Glyph.LoadFromResourceName(HInstance,'EDIT');

  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGD_AcessoS.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if bDBAberto
  then bDBAberto := not FechaDataModule(dtmCon);

  if not bModal then
  begin
    fmSGD_AcessoS := nil;
    Action := caFree;
  end;
end;

procedure TfmSGD_AcessoS.HabilitaControles;
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
{
procedure TfmSGD_AcessoS.ChangeEnter(Sender: TObject);
begin
  if Sender is tbfdbEdit
  then tbfdbEdit(Sender).Color := cCorBluefield//$00E6FED8
  else if Sender is TDBLookupComboBox
  then TDBLookupComboBox(Sender).Color := cCorBluefield//$00E6FED8
  else if Sender is TbfdbComboBox
  then TbfdbComboBox(Sender).Color := cCorBluefield//$00E6FED8
  else if Sender is TDBMemo
  then TDBMemo(Sender).Color := cCorBluefield
  else if Sender is TbfdbGrid
  then TbfdbGrid(Sender).Color := cCorBluefield
  else if Sender is TMemo
  then TMemo(Sender).Color := cCorBluefield;//$00E6FED8;
end;

procedure TfmSGD_AcessoS.ChangeExit(Sender: TObject);
begin
  if Sender is tbfdbEdit
  then tbfdbEdit(Sender).Color := cCorNormal
  else if Sender is TDBLookupComboBox
  then TDBLookupComboBox(Sender).Color := cCorNormal
  else if Sender is TbfdbComboBox
  then TbfdbComboBox(Sender).Color := cCorNormal
  else if Sender is TDBMemo
  then TDBMemo(Sender).Color := cCorNormal
  else if Sender is TbfdbGrid
  then TbfdbGrid(Sender).Color := cCorNormal
  else if Sender is TMemo
  then TMemo(Sender).Color := cCorNormal;
end;
}


procedure TfmSGD_AcessoS.btConsultaClick(Sender: TObject);
var
s,sObs : string;
iNumero_Espaco : integer;
begin
  if not bDBAberto
  then
  begin
    dtmCon := TdtmConexao.Create(fmSGD_AcessoS);
    bDBAberto := AbreDataModule(dtmCon, sPath_Local, sBancoDeDados);
  end;

  if not bDBAberto then exit;
  with qr do
  begin
    SQLConnection := dtmCon.SQLDB;
    if active then close;
    SQL.Clear;
    SQL.Add(' select a.*, m.nome MODULO_NOME, g.nome GRUPO_NOME ');
    SQL.Add(' from SGD_ACESSOS a ');
    SQL.Add(' left join sgd_modulos m on m.modulo = a.modulo ');
    SQL.Add(' left join sgd_grupomenu g on g.id = a.grupomenu ');
    SQL.Add(' where a.acesso > ''0'' ');
    if trim(edtConsulta.Text) <> ''
    then SQL.Add(' and a.Acesso = '''+trim(edtConsulta.Text)+''' ');
    if trim(edtConsultaNome.Text) <> ''
    then SQL.Add(' and UPPER (a.NOME) like ''%'+trim(AnsiUpperCase(edtConsultaNome.Text))+'%'' ');
    //if edtConsultaOBS.Text <> ''
    //then SQL.Add('and  a.OBS like ('''+sObs+''') ');


    //sObs := StringReplace(edtConsultaOBS.Text,' ',' ''%',[rfReplaceAll, rfIgnoreCase]);
    //ShowMessage(sObs)




  end;

  if cds.Active
  then cds.Close;

  dbgConsulta.DataSource := ds;
  cds.Open;

  if not cds.IsEmpty then dbgConsulta.SetFocus;

  HabilitaControles;
end;

procedure TfmSGD_AcessoS.cdsAfterPost(DataSet: TDataSet);
var
  td : TTransactionDesc;
begin
  td.TransactionID := Cardinal(FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  td.IsolationLevel := xilREADCOMMITTED;
  qr.SQLConnection.StartTransaction(td);
  try
    id := cdsAcesso.AsString;
    cds.ApplyUpdates(-1);

    qr.SQLConnection.Commit(td);

    cdsAcesso.ReadOnly := true;
    cds.Refresh;

    HabilitaControles;

    cds.Locate('Acesso',id,[]);
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

procedure TfmSGD_AcessoS.cdsBeforePost(DataSet: TDataSet);
begin
  if cdsGRUPOMENU.AsInteger = 0
  then cdsGRUPOMENU.Clear;
  cdsIDALTERADO.AsString := cdsIDALT.AsString;
end;

procedure TfmSGD_AcessoS.cdsAfterEdit(DataSet: TDataSet);
begin
  cdsUSU_ALTERA.AsString := sUsuario;
  cdsDT_ALTERA.AsDateTime := now;
  HabilitaControles;
end;

procedure TfmSGD_AcessoS.cdsAfterInsert(DataSet: TDataSet);
begin
  cdsUSU_INCLUI.AsString := sUsuario;
  HabilitaControles;
end;

procedure TfmSGD_AcessoS.dspUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise exception.Create(E.Message);
end;

procedure TfmSGD_AcessoS.BeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
                                 DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
                                 var Applied: Boolean);
{var
  Campo : TField;
  SQLStmt, Tabela : String;
  CustomSQLDataSet : TCustomSQLDataSet;^}
begin
{não tem autoincremento nos Acessos


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
procedure TfmSGD_AcessoS.dbgConsultaDblClick(Sender: TObject);
begin
  if bModal
  and not cds.IsEmpty
  then btTransportaClick(self);
  btIncluiClick(btEditar);
end;

procedure TfmSGD_AcessoS.cdsNewRecord(DataSet: TDataSet);
begin
  cdsAcesso.ReadOnly := false;
  HabilitaControles;
end;

procedure TfmSGD_AcessoS.cdsPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  raise Exception.Create(e.Message);
end;

procedure TfmSGD_AcessoS.cdsAfterCancel(DataSet: TDataSet);
begin
  cdsAcesso.ReadOnly := true;
  HabilitaControles;
end;

procedure TfmSGD_AcessoS.cdsAfterDelete(DataSet: TDataSet);
var
  td : TTransactionDesc;
begin
  td.TransactionID := Cardinal(FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  td.IsolationLevel := xilREADCOMMITTED;
  qr.SQLConnection.StartTransaction(td);
  try
//    id := cdsAcesso.AsString;
    cds.ApplyUpdates(-1);

    qr.SQLConnection.Commit(td);

    cdsAcesso.ReadOnly := true;
    cds.Refresh;

    HabilitaControles;
//    cds.Locate('Acesso',id,[]);
  except
    on e : Exception do
    begin
      qr.SQLConnection.Rollback(td);
      MessageBox(Handle, pChar('Mensagem do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      exit;
    end;
  end;
end;

procedure TfmSGD_AcessoS.btSalvaClick(Sender: TObject);
begin
  if Pode_Salvar
  then cds.Post;
end;

procedure TfmSGD_AcessoS.btImprimeClick(Sender: TObject);
begin
 if (not cds.Active) or cds.IsEmpty then exit;

  with RelVisual do
  begin
    TituloRelatorio := Caption;

    Cabecalho1Esquerda := sEmpresa;
    Cabecalho2Centro := '';
    if (edtConsulta.Text <> '') or (edtConsultaNome.Text <> '') then
    Cabecalho3Esquerda := ('Filtrando por: '+edtConsulta.Text+'  Descrição: '+edtConsultaNome.Text);

    Cabecalhos.Clear;

    Limpa_Campos;
    DefinicaoCampos.Add('D2;20;E;;ACESSO;Acesso');
    DefinicaoCampos.Add('D0;100;E;;NOME;Descrição');
    DefinicaoCampos.Add('D0;50;D;;MODULO;Módulo');
    Execute;
  end;



  end;

procedure TfmSGD_AcessoS.btIncluiClick(Sender: TObject);
begin
  if not cds.Active then exit;
  if not bCad then Exit;
  if (TBitBtn(sender).Tag = 1)
  then if (bInc)
       then cds.Insert
       else exit;
  pgc.ActivePage := tsCadastro;
  DBEdit1.SetFocus;
  HabilitaControles;
end;

procedure TfmSGD_AcessoS.btDesisteClick(Sender: TObject);
begin
  if cds.State in [dsInsert, dsEdit]
  then cds.Cancel;
  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGD_AcessoS.btExcluiClick(Sender: TObject);
begin
  if MessageBox(Handle, pchar('Confirma a exclusão deste registro ?'), 'Excluir', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = id_no
  then Exit;
  cds.delete;
  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGD_AcessoS.btSaiClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSGD_AcessoS.tsConsultaShow(Sender: TObject);
begin
  if cds.State in [dsInsert, dsEdit]
  then cds.Cancel;

  if cds.Active
  and dbgConsulta.CanFocus
  then dbgConsulta.SetFocus;
end;

procedure TfmSGD_AcessoS.edtConsultaChange(Sender: TObject);
begin
if cds.Active then cds.Close;

end;

procedure TfmSGD_AcessoS.edtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_down then dbgConsulta.SetFocus;

end;

procedure TfmSGD_AcessoS.edtConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = chr(vk_return) then btConsultaClick(self);
end;

procedure TfmSGD_AcessoS.dbgConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_f9 then edtConsulta.SetFocus;
end;

procedure TfmSGD_AcessoS.dbgConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = chr(vk_return) then
  begin
    dbgConsultaDblClick(self);
  end;
end;

procedure TfmSGD_AcessoS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = chr(vk_escape) then
  begin
    if pgc.ActivePage = tsCadastro
    then btDesisteClick(self)
    else if bModal
         then btSaiClick(self);
  end;
end;

procedure TfmSGD_AcessoS.Direitos;
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
    dtmCon := TdtmConexao.Create(fmSGD_AcessoS);
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

  if not bExc
  then dsp.Options := dsp.Options + [poDisableDeletes];
  if not bInc
  then dsp.Options := dsp.Options + [poDisableInserts];
  if not bAlt
  then dsp.Options := dsp.Options + [poDisableEdits];
end;

(******************************************************************************)

function TfmSGD_AcessoS.Pode_Salvar: boolean;
begin
  result := false;

  if trim(cdsACESSO.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe o código do acesso.'), 'Aviso', MB_ICONWARNING);
    DBEdit1.SetFocus;
    Exit;
  end;

  if trim(cdsNOME.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe a descrição.'), 'Aviso', MB_ICONWARNING);
    DBEdit2.SetFocus;
    Exit;
  end;

  if trim(cdsMODULO.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe o módulo.'), 'Aviso', MB_ICONWARNING);
    DBEdit3.SetFocus;
    Exit;
  end;

  result := true;
end;

(******************************************************************************)
//exports tem que ser a ultima coisa antes do end.
exports
  SGD003;

procedure TfmSGD_AcessoS.DBEdit3ButtonClick(Sender: TObject);
var
  s : string;
begin
  if cds.Active
  and (not (cds.State in [dsInsert, dsEdit]))
  then cds.Edit;
  s := AbreTela('SGD002','SGD.BPL',sUsuario,sPath_Local,DBEdit3.Text+';', sBancoDeDados,cCorBluefield,cCorNormal, iEmp,0,true);

  if (trim(s) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsMODULO.AsString := Separa_String(s,1);
    cdsMODULO_NOME.AsString := Separa_String(s,2);

    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfmSGD_AcessoS.DBEdit3Change(Sender: TObject);
begin
  if DBEdit3.Focused then DBEdit4.Clear;
end;

procedure TfmSGD_AcessoS.DBEdit3Exit(Sender: TObject);
begin
//  ChangeExit(DBEdit3);
  if (trim(DBEdit3.Text) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsMODULO_NOME.AsString := Query(' select * from sgd_Modulos where Modulo = '''+trim(DBEdit3.Text)+'''  ',sPath_Local,'NOME');
  end;
end;

procedure TfmSGD_AcessoS.DBEdit5ButtonClick(Sender: TObject);
var
  s : string;
begin
  if cds.Active
  and (not (cds.State in [dsInsert, dsEdit]))
  then cds.Edit;
  s := AbreTela('SGD004','SGD.BPL',sUsuario,sPath_Local,DBEdit5.Text+';', sBancoDeDados,cCorBluefield,cCorNormal,iEmp,0,true);
  if (trim(s) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsGRUPOMENU.AsString := Separa_String(s,1);
    cdsGRUPO_NOME.AsString := Separa_String(s,2);

    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfmSGD_AcessoS.DBEdit5Change(Sender: TObject);
begin
  if DBEdit5.Focused then DBEdit6.Clear;
end;

procedure TfmSGD_AcessoS.DBEdit5Exit(Sender: TObject);
begin
  if (trim(DBEdit5.Text) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsGRUPO_NOME.AsString := Query(' select * from sgd_GRUPOMENU where ID = '+trim(DBEdit5.Text),sPath_Local,'NOME');
  end;
end;

end.
