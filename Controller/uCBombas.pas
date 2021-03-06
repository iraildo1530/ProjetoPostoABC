unit uCBombas;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Vcl.StdCtrls, Data.DB, uMBomba;

type
  TCBombas = class
  private
    FFDCon      : TFDConnection;
    FFDQBombas  : TFDQuery;
    FDSBombas   : TDataSource;

    oModelBomba : TBomba;

    procedure SetFDCon(const Value: TFDConnection);
    procedure SetFDQBombas(const Value: TFDQuery);
    procedure SetDSBombas(const Value: TDataSource);
  public
    function CarregarListaComboBox(const ComboBox: TComboBox): TComboBox;
    function GetValorLitro(IDBomba: Integer): Currency;

    property FDCon : TFDConnection read FFDCon write SetFDCon;
    property FDQBombas : TFDQuery read FFDQBombas write SetFDQBombas;
    property DSBombas : TDataSource read FDSBombas write SetDSBombas;

    constructor Create(oConexao: TFDConnection);
    destructor Destroy; override;
  end;

implementation

{ TCBombas }

function TCBombas.CarregarListaComboBox(const ComboBox: TComboBox): TComboBox;
begin
  if FDQBombas.IsEmpty then
    raise Exception.Create('Nenhum registro encontrado!');

  try
    if ComboBox.Items.Count > 0 then
      ComboBox.Items.Clear;

    FDQBombas.First;
    while not FDQBombas.Eof do
    begin
      ComboBox.Items.AddObject(FDQBombas.FieldByName('NOME').AsString,
                               TObject(FDQBombas.FieldByName('IDBOMBA').AsInteger));

      FDQBombas.Next;
    end;

    ComboBox.ItemIndex := 0;
  finally
    Result := ComboBox;
  end;
end;

constructor TCBombas.Create(oConexao: TFDConnection);
begin
  oModelBomba := TBomba.Create(oConexao);

  with oModelBomba do
  begin
    CarregarDados;
    SetFDQBombas(GetFDQBombas);
    SetDSBombas(GetDSBombas);
  end;
end;

destructor TCBombas.Destroy;
begin
  oModelBomba.Destroy;

  FreeAndNil(FFDCon);
  FreeAndNil(FFDQBombas);
  FreeAndNil(FDSBombas);
  inherited;
end;

function TCBombas.GetValorLitro(IDBomba: Integer): Currency;
begin
  FDQBombas.DisableControls;
  FDQBombas.Filter   := 'IDBOMBA = ' +IDBomba.ToString;
  FDQBombas.Filtered := True;

  if (not(FDQBombas.IsEmpty)) then
    Result := FDQBombas.FieldByName('VALORLITRO').AsCurrency
  else Result := 0;

  FDQBombas.Filtered := False;
  FDQBombas.Filter   := '';
  FDQBombas.EnableControls;
end;

procedure TCBombas.SetDSBombas(const Value: TDataSource);
begin
  FDSBombas := Value;
end;

procedure TCBombas.SetFDCon(const Value: TFDConnection);
begin
  FFDCon := Value;
end;

procedure TCBombas.SetFDQBombas(const Value: TFDQuery);
begin
  FFDQBombas := Value;
end;

end.
