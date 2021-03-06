unit uFechaComanda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBClient, DBCtrls, bfdbComboBox, Mask,
  bfdbEdit;

type
  TfmFechaComanda = class(TForm)
    btOK: TBitBtn;
    btCanc: TBitBtn;
    cds: TClientDataSet;
    cdsCOMANDA: TIntegerField;
    cdsCOMANDA_NOME: TStringField;
    cdsTOTAL: TFMTBCDField;
    cdsPAGO: TFMTBCDField;
    cdsTROCO: TFMTBCDField;
    cdsFORMA: TStringField;
    DBEdit1: tbfDbEdit;
    DataSource1: TDataSource;
    DBEdit2: tbfDbEdit;
    Label4: TLabel;
    DBEdit3: tbfDbEdit;
    Label5: TLabel;
    DBEdit4: tbfDbEdit;
    Label6: TLabel;
    DBEdit5: tbfDbEdit;
    bfdbComboBox1: TbfdbComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cdsCalcFields(DataSet: TDataSet);
    procedure btOKClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmFechaComanda: TfmFechaComanda;

implementation

{$R *.dfm}

procedure TfmFechaComanda.FormCreate(Sender: TObject);
begin
  btOK.Glyph.LoadFromResourceName(HInstance,'OK');
  btCanc.Glyph.LoadFromResourceName(HInstance,'DESIST');


end;



procedure TfmFechaComanda.cdsCalcFields(DataSet: TDataSet);
begin
 cdsTROCO.AsFloat := 0;
 if cdsPAGO.AsFloat > cdsTOTAL.AsFloat
 then cdsTROCO.AsFloat := cdsPAGO.AsFloat - cdsTOTAL.AsFloat;
end;

procedure TfmFechaComanda.btOKClick(Sender: TObject);
begin
  if cdsPAGO.AsFloat < cdsTOTAL.AsFloat then
  begin
    MessageBox(Handle, pchar('Valor pago menor que o total.'), 'Aviso', MB_ICONWARNING);
    DBEdit4.SetFocus;
    exit;
  end;

 // if MessageBox(Handle, pchar('Confirma fechar a comanda?'), 'Fechar comanda', MB_YESNO+MB_ICONQUESTION) = id_no
 // then exit;

 ModalResult := mrok;
end;

end.
