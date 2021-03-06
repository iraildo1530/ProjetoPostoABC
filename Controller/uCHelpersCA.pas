unit uCHelpersCA;

interface

uses
  vcl.stdCtrls, Vcl.ComCtrls, SysUtils, vcl.DBGrids, vcl.Mask, Data.DB;

type
  TEditDocumento = class Helper for TDateTimePicker
	  public
      function isDataFimMaiorQueIni(DataIni: TDate): Boolean;
  end;

  TEditMasck = class Helper for TMaskEdit
    public
     procedure TratarMascaraNumero;
  end;

implementation

{ TEditDocumento }

procedure TEditMasck.TratarMascaraNumero;
begin
  Self.Text := FormatCurr('###,###,##0.00',StrToCurr(Self.Text));
end;

{ TEditDocumento }

function TEditDocumento.isDataFimMaiorQueIni(DataIni: TDate): Boolean;
begin
  if Self.Date < DataIni then
  begin
    Result := False;
    raise Exception.Create('Data Final deve ser maior que a Data Inicial!');
  end
  else Result := True;
end;

end.
