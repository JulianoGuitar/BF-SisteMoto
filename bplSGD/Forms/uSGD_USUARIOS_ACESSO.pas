unit uSGD_USUARIOS_ACESSO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, bfdbGrid, DB, DBClient, Provider, FMTBcd,
  SqlExpr, ExtCtrls, DBCtrls, Mask, udtmConexao, ComCtrls,
  Buttons, bfEdit, bfdbComboBox, bfdbEdit, DBGrids, RelVisualBlue,
  bfdbEditButton;

type
  TfmSGD_USUARIOS_ACESSO = class(TForm)
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
    Label1: TLabel;
    edtAcesso: TbfdbEdit;
    Label3: TLabel;
    edtModuloNome: TbfdbEdit;
    Label5: TLabel;
    edtGrupoNome: TbfdbEdit;
    cbxCadastro: TbfdbComboBox;
    btTransporta: TBitBtn;
    qrUSUARIO: TStringField;
    qrACESSO: TStringField;
    qrCAD: TStringField;
    qrINC: TStringField;
    qrALT: TStringField;
    qrEXC: TStringField;
    qrUSU_INCLUI: TStringField;
    qrDT_INCLUI: TSQLTimeStampField;
    qrUSU_ALTERA: TStringField;
    qrDT_ALTERA: TSQLTimeStampField;
    qrIDALT: TStringField;
    qrIDALTERADO: TStringField;
    qrMODULO: TStringField;
    qrGRUPOMENU: TIntegerField;
    qrACESSO_NOME: TStringField;
    qrMODULO_NOME: TStringField;
    qrGRUPO_NOME: TStringField;
    cdsUSUARIO: TStringField;
    cdsACESSO: TStringField;
    cdsCAD: TStringField;
    cdsINC: TStringField;
    cdsALT: TStringField;
    cdsEXC: TStringField;
    cdsUSU_INCLUI: TStringField;
    cdsDT_INCLUI: TSQLTimeStampField;
    cdsUSU_ALTERA: TStringField;
    cdsDT_ALTERA: TSQLTimeStampField;
    cdsIDALT: TStringField;
    cdsIDALTERADO: TStringField;
    cdsMODULO: TStringField;
    cdsGRUPOMENU: TIntegerField;
    cdsACESSO_NOME: TStringField;
    cdsMODULO_NOME: TStringField;
    cdsGRUPO_NOME: TStringField;
    Label4: TLabel;
    edtUsuario: TbfdbEdit;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cbxInclusao: TbfdbComboBox;
    cbxAlteracao: TbfdbComboBox;
    cbxExclusao: TbfdbComboBox;
    btImprime: TBitBtn;
    RelVisual: TRelVisualBlue;
    edtModuloCod: TbfdbEditButton;
    edtGrupoCod: TbfdbEditButton;
    qrApoio: TSQLQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    SQLTimeStampField1: TSQLTimeStampField;
    StringField8: TStringField;
    SQLTimeStampField2: TSQLTimeStampField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    IntegerField1: TIntegerField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    edtConsAcesso: TbfEdit;
    edtConsDescricao: TbfEdit;
    edtConsModulo: TbfEdit;

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
    procedure edtModuloCodChange(Sender: TObject);
    procedure btConsultaModuloClick(Sender: TObject);
    procedure bfdbEdit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btTransportaClick(Sender: TObject);
    procedure btImprimeClick(Sender: TObject);
    procedure edtModuloCodExit(Sender: TObject);
    procedure edtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgConsultaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtModuloCodButtonClick(Sender: TObject);
    procedure edtGrupoCodButtonClick(Sender: TObject);
    procedure edtGrupoCodChange(Sender: TObject);
    procedure edtGrupoCodExit(Sender: TObject);
    procedure edtAcessoExit(Sender: TObject);
    procedure edtAcessoChange(Sender: TObject);
    procedure edtConsultaClick(Sender: TObject);

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
  fmSGD_USUARIOS_ACESSO: TfmSGD_USUARIOS_ACESSO;
const
  sCodProg : string = 'SGD010';

implementation

uses uFuncoesDB, uFuncoes, uFuncoesTelas;

{$R *.dfm}

function SGD010(sOpUsuario, sOpLocal, sOpFiltros, sOpDBSel: pchar; cOpBlueField, cOpNormal : TColor; iEmpresa, iOp: integer; bOpModal: boolean = false): pchar;
begin
  Result := '';
  with TfmSGD_USUARIOS_ACESSO.Create(Application) do
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

procedure TfmSGD_USUARIOS_ACESSO.btTransportaClick(Sender: TObject);
begin
  if bModal then
  begin
    sRetorno := cdsACESSO.AsString+';'
               +cdsMODULO.AsString+';'
               +cdsGRUPOMENU.AsString+';'
               ;

    ModalResult := mrOk;
  end;
end;

procedure TfmSGD_USUARIOS_ACESSO.FormCreate(Sender: TObject);
begin
  bDBAberto := false;

  btConsulta.Glyph.LoadFromResourceName(HInstance,'CONS');
  edtModuloCod.Glyph.LoadFromResourceName(HInstance,'CONS');
  edtGrupoCod.Glyph.LoadFromResourceName(HInstance,'CONS');
  btImprime.Glyph.LoadFromResourceName(HInstance,'PRINT');
  btInclui.Glyph.LoadFromResourceName(HInstance,'INC');
  btSalva.Glyph.LoadFromResourceName(HInstance,'SALVA');
  btDesiste.Glyph.LoadFromResourceName(HInstance,'DESIST');
  btExclui.Glyph.LoadFromResourceName(HInstance,'EXC');
  btSai.Glyph.LoadFromResourceName(HInstance,'SAI');
  btEditar.Glyph.LoadFromResourceName(HInstance,'EDIT');

  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGD_USUARIOS_ACESSO.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if bDBAberto
  then bDBAberto := not FechaDataModule(dtmCon);

  if not bModal then
  begin
    fmSGD_USUARIOS_ACESSO := nil;
    Action := caFree;
  end;
end;

procedure TfmSGD_USUARIOS_ACESSO.HabilitaControles;
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

procedure TfmSGD_USUARIOS_ACESSO.btConsultaClick(Sender: TObject);
begin
  if not bDBAberto
  then
  begin
    dtmCon := TdtmConexao.Create(fmSGD_USUARIOS_ACESSO);
    bDBAberto := AbreDataModule(dtmCon, sPath_Local, sBancoDeDados);
  end;

  if not bDBAberto then exit;
  with qr do
  begin
    SQLConnection := dtmCon.SQLDB;
    if active then close;
    SQL.Clear;
    SQL.Add(' select a.*, p.nome acesso_nome, m.nome MODULO_NOME, g.nome GRUPO_NOME ');
    SQL.Add(' from SGD_USUARIOS_ACESSO a ');
    SQL.Add(' left join sgd_modulos m on m.modulo = a.modulo ');
    SQL.Add(' left join sgd_grupomenu g on g.id = a.grupomenu ');
    SQL.Add(' left join sgd_acessos p on p.acesso = a.acesso ');
    SQL.Add(' where a.USUARIO > ''0'' ');
    if trim(edtConsulta.Text) <> ''
    then SQL.Add(' and a.usuario = '''+trim(edtConsulta.Text)+''' ');
    if trim(edtConsAcesso.Text) <> ''
    then SQL.Add(' and a.acesso = '''+trim(edtConsAcesso.Text)+''' ');
    if trim(edtConsDescricao.Text) <> ''
    then SQL.Add(' and UPPER(p.nome) like ''%'+trim(AnsiUpperCase(edtConsDescricao.Text))+'%'' ');
    if trim(edtConsModulo.Text) <> ''
    then SQL.Add(' and a.modulo = '''+trim(edtConsModulo.Text)+''' ');
  end;

  if cds.Active
  then cds.Close;

  dbgConsulta.DataSource := ds;
  cds.Open;

  if not cds.IsEmpty then dbgConsulta.SetFocus;

  HabilitaControles;
end;

procedure TfmSGD_USUARIOS_ACESSO.cdsAfterPost(DataSet: TDataSet);
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

procedure TfmSGD_USUARIOS_ACESSO.cdsBeforePost(DataSet: TDataSet);
begin
  if cdsGRUPOMENU.AsInteger = 0
  then cdsGRUPOMENU.Clear;
  cdsIDALTERADO.AsString := cdsIDALT.AsString;
end;

procedure TfmSGD_USUARIOS_ACESSO.cdsAfterEdit(DataSet: TDataSet);
begin
  cdsUSU_ALTERA.AsString := sUsuario;
  cdsDT_ALTERA.AsDateTime := now;
  HabilitaControles;
end;

procedure TfmSGD_USUARIOS_ACESSO.cdsAfterInsert(DataSet: TDataSet);
begin
  cdsUSU_INCLUI.AsString := sUsuario;
  HabilitaControles;
end;

procedure TfmSGD_USUARIOS_ACESSO.dspUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise exception.Create(E.Message);
end;

procedure TfmSGD_USUARIOS_ACESSO.BeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
                                 DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
                                 var Applied: Boolean);
{var
  Campo : TField;
  SQLStmt, Tabela : String;
  CustomSQLDataSet : TCustomSQLDataSet;^}
begin
{não tem autoincremento nos USUARIOS_ACESSO


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
procedure TfmSGD_USUARIOS_ACESSO.dbgConsultaDblClick(Sender: TObject);
begin
  if bModal
  and not cds.IsEmpty
  then btTransportaClick(self);
  btIncluiClick(btEditar);
end;

procedure TfmSGD_USUARIOS_ACESSO.cdsNewRecord(DataSet: TDataSet);
begin
  cdsAcesso.ReadOnly := false;
  HabilitaControles;
end;

procedure TfmSGD_USUARIOS_ACESSO.cdsAfterCancel(DataSet: TDataSet);
begin
  cdsAcesso.ReadOnly := true;
  HabilitaControles;
end;

procedure TfmSGD_USUARIOS_ACESSO.cdsAfterDelete(DataSet: TDataSet);
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

procedure TfmSGD_USUARIOS_ACESSO.btSalvaClick(Sender: TObject);
begin
  if Pode_Salvar
  then cds.Post;
end;

procedure TfmSGD_USUARIOS_ACESSO.btImprimeClick(Sender: TObject);
begin
 if (not cds.Active) or cds.IsEmpty then exit;

  with RelVisual do
  begin
    TituloRelatorio := Caption;

    Cabecalho1Esquerda := sEmpresa;
    Cabecalho2Centro := '';
    if edtConsulta.Text <> '' then
    Cabecalho3Esquerda := ('Filtrando por: '+edtConsulta.Text);

    Cabecalhos.Clear;

    Limpa_Campos;
    DefinicaoCampos.Add('D2;20;E;;USUARIO;Usuário');
    DefinicaoCampos.Add('D0;20;E;;ACESSO;Acesso');
    DefinicaoCampos.Add('D0;100;E;;ACESSO_NOME;Descrição');
    DefinicaoCampos.Add('D0;20;E;;MODULO;Módulo');
    Execute;
  end;



  end;

procedure TfmSGD_USUARIOS_ACESSO.btIncluiClick(Sender: TObject);
begin
  if not cds.Active then exit;
  if not bCad then Exit;
  if (TBitBtn(sender).Tag = 1)
  then if (bInc)
       then cds.Insert
       else exit;
  pgc.ActivePage := tsCadastro;
  edtUsuario.SetFocus;
  HabilitaControles;
end;

procedure TfmSGD_USUARIOS_ACESSO.btDesisteClick(Sender: TObject);
begin
  if cds.State in [dsInsert, dsEdit]
  then cds.Cancel;
  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGD_USUARIOS_ACESSO.btExcluiClick(Sender: TObject);
begin
  if MessageBox(Handle, pchar('Confirma a exclusão deste registro ?'), 'Excluir', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = id_no
  then Exit;
  cds.delete;
  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGD_USUARIOS_ACESSO.btSaiClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSGD_USUARIOS_ACESSO.tsConsultaShow(Sender: TObject);
begin
  if cds.State in [dsInsert, dsEdit]
  then cds.Cancel;

  if cds.Active
  and dbgConsulta.CanFocus
  then dbgConsulta.SetFocus;
end;

procedure TfmSGD_USUARIOS_ACESSO.edtAcessoChange(Sender: TObject);
begin
  if edtAcesso.Focused then
  begin
    edtModuloCod.Clear;
    edtModuloNome.Clear;
    edtGrupoCod.Clear;
    edtGrupoNome.Clear;
  end;
end;

procedure TfmSGD_USUARIOS_ACESSO.edtAcessoExit(Sender: TObject);
begin
  if (trim(edtAcesso.Text) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsMODULO.AsString := Query(' Select MODULO from SGD_ACESSOS where acesso = '''+trim(edtAcesso.Text)+'''  ',sPath_Local,'MODULO' );
    cdsGRUPOMENU.AsString := Query(' Select GRUPOMENU from SGD_ACESSOS where acesso = '''+trim(edtAcesso.Text)+'''  ',sPath_Local,'GRUPOMENU' );
    cdsCAD.AsString := Query(' select CAD from SGD_USUARIOS_ACESSO where acesso = '''+trim(edtAcesso.Text)+'''  ',sPath_Local,'CAD' );
    cdsALT.AsString := Query(' select ALT from SGD_USUARIOS_ACESSO where acesso = '''+trim(edtAcesso.Text)+'''  ',sPath_Local,'ALT' );
    cdsINC.AsString := Query(' select INC from SGD_USUARIOS_ACESSO where acesso = '''+trim(edtAcesso.Text)+'''  ',sPath_Local,'INC' );
    cdsEXC.AsString := Query(' select EXC from SGD_USUARIOS_ACESSO where acesso = '''+trim(edtAcesso.Text)+'''  ',sPath_Local,'EXC' );

    edtModuloCodExit(self);
    edtGrupoCodExit(self);
  end;
end;

procedure TfmSGD_USUARIOS_ACESSO.edtConsultaClick(Sender: TObject);
begin
if cds.Active then cds.Close;

end;

procedure TfmSGD_USUARIOS_ACESSO.edtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_down then dbgConsulta.SetFocus;
end;


procedure TfmSGD_USUARIOS_ACESSO.edtConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = chr(vk_return) then btConsultaClick(self);
end;

procedure TfmSGD_USUARIOS_ACESSO.
dbgConsultaKeyPress(Sender: TObject;
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

procedure TfmSGD_USUARIOS_ACESSO.
dbgConsultaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_f9 then edtConsulta.SetFocus;
end;

procedure TfmSGD_USUARIOS_ACESSO.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = chr(vk_escape) then
  begin
    if btDesiste.Enabled
    then btDesisteClick(self)
    else if bModal
         then btSaiClick(self);
  end;
end;

procedure TfmSGD_USUARIOS_ACESSO.Direitos;
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
    dtmCon := TdtmConexao.Create(fmSGD_USUARIOS_ACESSO);
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

function TfmSGD_USUARIOS_ACESSO.Pode_Salvar: boolean;
begin
  result := false;

  if trim(cdsUSUARIO.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe o usuário.'), 'Aviso', MB_ICONWARNING);
    edtUsuario.SetFocus;
    Exit;
  end;

  if trim(cdsACESSO.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe o código do acesso.'), 'Aviso', MB_ICONWARNING);
    edtAcesso.SetFocus;
    Exit;
  end;

  if trim(cdsMODULO.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe o módulo.'), 'Aviso', MB_ICONWARNING);
    edtModuloCod.SetFocus;
    Exit;
  end;

  result := true;
end;

(******************************************************************************)
//exports tem que ser a ultima coisa antes do end.
exports
  SGD010;

procedure TfmSGD_USUARIOS_ACESSO.edtModuloCodButtonClick(Sender: TObject);
var
  s : string;
begin
  if cds.Active
  and (not (cds.State in [dsInsert, dsEdit]))
  then cds.Edit;

  s := AbreTela('SGD002','SGD.BPL',sUsuario,sPath_Local,edtModuloCod.Text+';', sBancoDeDados,cCorBluefield,cCorNormal,iEmp, 0,true);
  if (trim(s) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsMODULO.AsString := Separa_String(s,1);
    cdsMODULO_NOME.AsString := Separa_String(s,2);

    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfmSGD_USUARIOS_ACESSO.edtModuloCodChange(Sender: TObject);
begin
  if edtModuloCod.Focused then edtModuloNome.Clear;
end;

procedure TfmSGD_USUARIOS_ACESSO.edtModuloCodExit(Sender: TObject);
begin
  if (trim(edtModuloCod.Text) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsMODULO_NOME.AsString := Query(' select * from sgd_Modulos where Modulo = '''+trim(edtModuloCod.Text)+'''  ',sPath_Local,'NOME');
  end;
end;

procedure TfmSGD_USUARIOS_ACESSO.btConsultaModuloClick(Sender: TObject);
var
  s : string;
begin
  s := AbreTela('SGD002','SGD.BPL',sUsuario,sPath_Local,edtModuloCod.Text+';', sBancoDeDados,cCorBluefield,cCorNormal,iEmp, 0,true);
  if (trim(s) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsMODULO.AsString := Separa_String(s,1);
    cdsMODULO_NOME.AsString := Separa_String(s,2);

    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfmSGD_USUARIOS_ACESSO.bfdbEdit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_f11 then btConsultaModuloClick(self);
end;


procedure TfmSGD_USUARIOS_ACESSO.edtGrupoCodButtonClick(Sender: TObject);
var
  s : string;
begin
  if cds.Active
  and (not (cds.State in [dsInsert, dsEdit]))
  then cds.Edit;

  s := AbreTela('SGD004','SGD.BPL',sUsuario,sPath_Local,edtGrupoCod.Text+';', sBancoDeDados,cCorBluefield,cCorNormal,iEmp, 0,true);
  if (trim(s) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsGRUPOMENU.AsString := Separa_String(s,1);
    cdsGRUPO_NOME.AsString := Separa_String(s,2);

    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfmSGD_USUARIOS_ACESSO.edtGrupoCodChange(Sender: TObject);
begin
  if edtGrupoCod.Focused then edtGrupoNome.Clear;
end;

procedure TfmSGD_USUARIOS_ACESSO.edtGrupoCodExit(Sender: TObject);
begin
  if (trim(edtGrupoCod.Text) <> '')
  and (cds.State in [dsInsert, dsEdit])
  then
  begin
    cdsGRUPO_NOME.AsString := Query(' select * from sgd_grupomenu where ID = '''+trim(edtGrupoCod.Text)+'''  ',sPath_Local,'NOME');
  end;
end;

end.
