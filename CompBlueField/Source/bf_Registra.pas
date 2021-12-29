unit bf_Registra;
(******************************************************************************)
(*     © 2018 Jµ£¡åñø¸Ð¸®ø§å ¸ þ®ø¥¡§µå£                                      *)
(******************************************************************************)

interface

procedure Register;

implementation

uses Classes, bfEdit, bfNumEdit, bfComboBox, bfdbEdit, bfdbGrid, bfMemo, bfdbMemo, bfdbComboBox
    , bfdbEditButton
    {, EditKeyJul, EditNumKeyJul, CurrEditJul,
     DateEditJulSRX, DateDlgJul, MaskEditJul, TimeEditJul,
     BitBtnJul, CheckBoxJul, CheckListBoxJul, DateTimeJul,
     ListBoxJul, StringGridJul,}
     , RelVisualBlue;

procedure Register;
begin
  RegisterComponents('BlueField', [TbfEdit, TbfNumEdit, TbfComboBox, TbfdbEdit, TbfdbGrid, TbfMemo
                                 , TbfdbMemo, TbfdbComboBox, TbfdbEditButton, TRelVisualBlue]);
                                   {, TEditKeyJul, TEditNumKeyJul,
                                    , TCurrEditJul, TDateEditJulSRX, TDateDlgJul
                                    , TMaskEditJul, TTimeEditJul, TBitBtnJul, TCheckBoxJul
                                    , TCheckListBoxJul, TDateTimeJul
                                    , TListBoxJul, TStringGridJul}
                                    //, TRelVisual]);
end;

end.
