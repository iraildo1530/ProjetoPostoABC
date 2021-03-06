unit uCTanques;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Vcl.StdCtrls, Data.DB, uMTanque;

type
  TCTanques = class
  private
    FFDCon       : TFDConnection;
    FFDQTanques  : TFDQuery;
    FDSTanques   : TDataSource;

    oModelTanque : TTanque;

    procedure SetFDCon(const Value: TFDConnection);
    procedure SetFDQTanques(const Value: TFDQuery);
    procedure SetDSTanques(const Value: TDataSource);
  public
    function CarregarListaComboBox(const ComboBoxTemp: TComboBox): TComboBox;

    property FDCon : TFDConnection read FFDCon write SetFDCon;
    property FDQTanques : TFDQuery read FFDQTanques write SetFDQTanques;
    property DSTanques : TDataSource read FDSTanques write SetDSTanques;

    constructor Create(oConexao: TFDConnection);
    destructor Destroy; override;
  end;

implementation

{ TCTanques }

function TCTanques.CarregarListaComboBox(
  const ComboBoxTemp: TComboBox): TComboBox;
begin
  if FDQTanques.IsEmpty then
  begin
    raise Exception.Create('Nenhum registro encontrado!');
    Abort;
  end;

  try
    ComboBoxTemp.Items.Clear;

    FDQTanques.First;
    if FDQTanques.RecordCount > 0 then
    begin
      while not FDQTanques.Eof do
      begin
        ComboBoxTemp.Items.AddObject(FDQTanques.FieldByName('NOME').AsString, TObject(FDQTanques.FieldByName('IDTANQUE').AsInteger));

        FDQTanques.Next;
      end;
    end;

    ComboBoxTemp.ItemIndex := 0;
  finally
    Result := ComboBoxTemp;
  end;
end;

constructor TCTanques.Create(oConexao: TFDConnection);
begin
  oModelTanque := TTanque.Create(oConexao);

  with oModelTanque do
  begin
    CarregarDados;
    SetFDQTanques(GetFDQTanques);
    SetDSTanques(GetDSTanques);
  end;
end;

destructor TCTanques.Destroy;
begin
  oModelTanque.Destroy;
  FreeAndNil(FFDCon);
  FreeAndNil(FFDQTanques);
  FreeAndNil(FDSTanques);
  inherited;
end;

procedure TCTanques.SetDSTanques(const Value: TDataSource);
begin
  FDSTanques := Value;
end;

procedure TCTanques.SetFDCon(const Value: TFDConnection);
begin
  FFDCon := Value;
end;

procedure TCTanques.SetFDQTanques(const Value: TFDQuery);
begin
  FFDQTanques := Value;
end;

end.
