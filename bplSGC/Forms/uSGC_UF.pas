unit uSGC_UF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, bfdbGrid, DB, DBClient, Provider, FMTBcd,
  SqlExpr, ExtCtrls, DBCtrls, Mask, udtmConexao, ComCtrls,
  Buttons, bfEdit,  bfdbEdit, DBGrids, RelVisualBlue, dbxpress;

type
  TfmSGC_UF = class(TForm)
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
    qrUF: TStringField;
    qrNOME: TStringField;
    qrUSU_INCLUI: TStringField;
    qrUSU_ALTERA: TStringField;
    qrDT_ALTERA: TSQLTimeStampField;
    qrIDALT: TStringField;
    qrIDALTERADO: TStringField;
    cdsNOME: TStringField;
    cdsUSU_INCLUI: TStringField;
    cdsUSU_ALTERA: TStringField;
    cdsDT_ALTERA: TSQLTimeStampField;
    cdsIDALT: TStringField;
    cdsIDALTERADO: TStringField;
    Label1: TLabel;
    bfdbEdit1: TbfdbEdit;
    Label2: TLabel;
    bfdbEdit2: TbfdbEdit;
    btTransporta: TBitBtn;
    btImprime: TBitBtn;
    qrCOD_UF: TIntegerField;
    cdsCOD_UF: TIntegerField;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    cdsUF: TStringField;
    RelVisual: TRelVisualBlue;
    ckbInativoCons: TCheckBox;
    qrINATIVO: TStringField;
    cdsINATIVO: TStringField;
    ckbInativo: TDBCheckBox;

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
  fmSGC_UF: TfmSGC_UF;
const
  sCodProg : string = 'SGC003';

implementation

uses uFuncoesDB, uFuncoes;

{$R *.dfm}

function SGC003(sOpUsuario, sOpLocal, sOpFiltros, sOpDBSel: pchar; cOpBlueField, cOpNormal : TColor; iEmpresa, iOp: integer; bOpModal: boolean = false): pchar;
begin
  Result := '';
  with TfmSGC_UF.Create(Application) do
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

procedure TfmSGC_UF.btTransportaClick(Sender: TObject);
begin
  if bModal then
  begin
    sRetorno := cdsUF.AsString+';'
               +cdsNOME.AsString+';'
               ;

    ModalResult := mrOk;
  end;
end;

procedure TfmSGC_UF.FormCreate(Sender: TObject);
begin
  bDBAberto := false;

  btConsulta.Glyph.LoadFromResourceName(HInstance,'CONS');
  btTransporta.Glyph.LoadFromResourceName(HInstance,'DIR');
  btImprime.Glyph.LoadFromResourceName(HInstance,'PRINT');
  btInclui.Glyph.LoadFromResourceName(HInstance,'INC');
  btSalva.Glyph.LoadFromResourceName(HInstance,'SALVA');
  btDesiste.Glyph.LoadFromResourceName(HInstance,'DESIST');
  btExclui.Glyph.LoadFromResourceName(HInstance,'EXC');
  btSai.Glyph.LoadFromResourceName(HInstance,'SAI');
  btEditar.Glyph.LoadFromResourceName(HInstance,'EDIT');

  if cdsINATIVO.AsString = 'S' then
  ckbInativo.Checked;

  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGC_UF.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if bDBAberto
  then bDBAberto := not FechaDataModule(dtmCon);

  if not bModal then
  begin
    fmSGC_UF := nil;
    Action := caFree;
  end;  
end;

procedure TfmSGC_UF.HabilitaControles;
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

procedure TfmSGC_UF.btConsultaClick(Sender: TObject);
begin
  if not bDBAberto
  then
  begin
    dtmCon := TdtmConexao.Create(fmSGC_UF);
    bDBAberto := AbreDataModule(dtmCon, sPath_Local, sBancoDeDados);
  end;

  if not bDBAberto then exit;
  with qr do
  begin
    SQLConnection := dtmCon.SQLDB;
    if active then close;
    SQL.Clear;
    SQL.Add(' select * from SGC_UF  ');
    SQL.Add(' where COD_UF >= 0 ');
    if trim(edtConsulta.Text) <> ''
    then SQL.Add(' and UF = '''+trim(edtConsulta.Text)+''' ');
    if ckbInativoCons.Checked then
    SQL.Add(' and INATIVO = ''S'' ')
    else
    SQL.Add(' and INATIVO <> ''S'' ');
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

procedure TfmSGC_UF.cdsAfterPost(DataSet: TDataSet);
var
  td : TTransactionDesc;
begin
  td.TransactionID := Cardinal(FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  td.IsolationLevel := xilREADCOMMITTED;
  qr.SQLConnection.StartTransaction(td);
  try
    id := cdsUF.AsString;
    cds.ApplyUpdates(-1);

    qr.SQLConnection.Commit(td);

    cdsUF.ReadOnly := true;
    cds.Refresh;

    HabilitaControles;

    cds.Locate('UF',id,[]);
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

procedure TfmSGC_UF.cdsBeforePost(DataSet: TDataSet);
begin
  cdsIDALTERADO.AsString := cdsIDALT.AsString;
  if ckbInativo.Checked then
  cdsINATIVO.AsString := 'S';
end;

procedure TfmSGC_UF.cdsAfterEdit(DataSet: TDataSet);
begin
  cdsUSU_ALTERA.AsString := sUsuario;
  cdsDT_ALTERA.AsDateTime := now;
  HabilitaControles;
end;

procedure TfmSGC_UF.cdsAfterInsert(DataSet: TDataSet);
begin
  cdsUSU_INCLUI.AsString := sUsuario;
  HabilitaControles;
end;

procedure TfmSGC_UF.dspUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise exception.Create(E.Message);
end;

procedure TfmSGC_UF.BeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
                                 DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
                                 var Applied: Boolean);
{var
  Campo : TField;
  SQLStmt, Tabela : String;
  CustomSQLDataSet : TCustomSQLDataSet;^}
begin
{n?o tem autoincremento nos UFs


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
procedure TfmSGC_UF.dbgConsultaDblClick(Sender: TObject);
begin
  if bModal
  and not cds.IsEmpty
  then btTransportaClick(self);
  btIncluiClick(btEditar);
end;

procedure TfmSGC_UF.cdsNewRecord(DataSet: TDataSet);
begin
  cdsUF.ReadOnly := false;
  HabilitaControles;
end;

procedure TfmSGC_UF.cdsAfterCancel(DataSet: TDataSet);
begin
  cdsUF.ReadOnly := true;
  HabilitaControles;
end;

procedure TfmSGC_UF.cdsAfterDelete(DataSet: TDataSet);
var
  td : TTransactionDesc;
begin
  td.TransactionID := Cardinal(FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  td.IsolationLevel := xilREADCOMMITTED;
  qr.SQLConnection.StartTransaction(td);
  try
//    id := cdsUF.AsString;
    cds.ApplyUpdates(-1);

    qr.SQLConnection.Commit(td);

    cdsUF.ReadOnly := true;
    cds.Refresh;

    HabilitaControles;
//    cds.Locate('UF',id,[]);
  except
    on e : Exception do
    begin
      qr.SQLConnection.Rollback(td);
      MessageBox(Handle, pChar('Mensagem do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      exit;
    end;
  end;
end;

procedure TfmSGC_UF.btSalvaClick(Sender: TObject);
begin
  if Pode_Salvar
  then cds.Post;
end;

procedure TfmSGC_UF.btImprimeClick(Sender: TObject);
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
    DefinicaoCampos.Add('D2;20;D;;COD_UF;C?d.UF');
    DefinicaoCampos.Add('D0;20;E;;UF;M?dulo');
    DefinicaoCampos.Add('D0;100;E;;NOME;Descri??o');
    Execute;
  end;



  end;

procedure TfmSGC_UF.btIncluiClick(Sender: TObject);
begin
  if not cds.Active then exit;
  if not bCad then Exit;
  if (TBitBtn(sender).Tag = 1)
  then if (bInc)
       then cds.Insert
       else exit;
  pgc.ActivePage := tsCadastro;
  bfdbEdit1.SetFocus;
  HabilitaControles;
  if cdsINATIVO.AsString <> 'S' then
  ckbInativo.Checked := false;
end;

procedure TfmSGC_UF.btDesisteClick(Sender: TObject);
begin
  if cds.State in [dsInsert, dsEdit]
  then cds.Cancel;
  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGC_UF.btExcluiClick(Sender: TObject);
begin
  if MessageBox(Handle, pchar('Confirma a exclus?o deste registro ?'), 'Excluir', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = id_no
  then Exit;
  cds.delete;
  pgc.ActivePage := tsConsulta;
end;

procedure TfmSGC_UF.btSaiClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSGC_UF.tsConsultaShow(Sender: TObject);
begin
  if cds.State in [dsInsert, dsEdit]
  then cds.Cancel;

  if  (not cds.IsEmpty)
  and (dbgConsulta.CanFocus)
  then dbgConsulta.SetFocus
  else if edtConsulta.CanFocus
       then edtConsulta.SetFocus;
end;

procedure TfmSGC_UF.edtConsultaChange(Sender: TObject);
begin
if cds.Active then cds.Close;

end;

procedure TfmSGC_UF.edtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_down then dbgConsulta.SetFocus;
end;


procedure TfmSGC_UF.edtConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = chr(vk_return) then btConsultaClick(self);
end;

procedure TfmSGC_UF.dbgConsultaKeyPress(Sender: TObject;
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

procedure TfmSGC_UF.
dbgConsultaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_f9 then edtConsulta.SetFocus;
end;

procedure TfmSGC_UF.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(vk_escape) then
  begin
    if pgc.ActivePage = tsCadastro
    then btDesisteClick(self)
    else if bModal
         then btSaiClick(self);
  end;
end;

procedure TfmSGC_UF.Direitos;
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
    dtmCon := TdtmConexao.Create(fmSGC_UF);
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

function TfmSGC_UF.Pode_Salvar: boolean;
begin
  result := false;

  if trim(cdsUF.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe o c?digo da UF.'), 'Aviso', MB_ICONWARNING);
    bfdbEdit1.SetFocus;
    Exit;
  end;

  if trim(cdsNOME.AsString) = '' then
  begin
    MessageBox(Handle, pchar('Informe a descri??o.'), 'Aviso', MB_ICONWARNING);
    bfdbEdit2.SetFocus;
    Exit;
  end;

  

  result := true;
end;

(******************************************************************************)
//exports tem que ser a ultima coisa antes do end.
exports
  SGC003;

end.
