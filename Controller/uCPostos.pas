unit uCPostos;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB, uMPosto;

type
  TCPostos = class
  private
    FFDCon      : TFDConnection;
    FFDQPostos  : TFDQuery;
    FDSPostos   : TDataSource;
    FnIDPosto   : Integer;
    FcNome      : String;

    oModelPosto : TPosto;

    procedure SetFDCon(const Value: TFDConnection);
    procedure SetFDQPostos(const Value: TFDQuery);
    procedure SetDSPostos(const Value: TDataSource);

    procedure SetIDPosto(const Value: Integer);
    procedure SetNOME(const Value: String);
  public
    procedure AtualizarInfoPosto;

    property FDCon : TFDConnection read FFDCon write SetFDCon;
    property FDQPostos : TFDQuery read FFDQPostos write SetFDQPostos;
    property DSPostos : TDataSource read FDSPostos write SetDSPostos;

    property IDPosto : Integer read FnIDPosto write SetIDPosto;
    property Nome : String read FcNome write SetNome;

    constructor Create(oConexao: TFDConnection);
    destructor Destroy; override;
  end;

implementation

{ TCPostos }

procedure TCPostos.AtualizarInfoPosto;
begin
  FDQPostos.DisableControls;

  if (not(FDQPostos.IsEmpty)) then
  begin
    SetIDPosto(FDQPostos.FieldByName('IDPOSTO').AsInteger);
    SetNOME(FDQPostos.FieldByName('NOME').AsString);
  end
  else raise Exception.Create('Posto n?o encontrado!');

  FDQPostos.EnableControls;
end;

constructor TCPostos.Create(oConexao: TFDConnection);
begin
  SetFDCon(oConexao);
  oModelPosto := TPosto.Create(oConexao);

  with oModelPosto do
  begin
    CarregarDados;
    SetFDQPostos(GetFDQPostos);
    SetDSPostos(GetDSPostos);
  end;

  AtualizarInfoPosto;
end;

destructor TCPostos.Destroy;
begin
  oModelPosto.Destroy;
  FreeAndNil(FFDCon);
  FreeAndNil(FFDQPostos);
  FreeAndNil(FDSPostos);
  inherited;
end;

procedure TCPostos.SetDSPostos(const Value: TDataSource);
begin
  FDSPostos := Value;
end;

procedure TCPostos.SetFDCon(const Value: TFDConnection);
begin
  FFDCon := Value;
end;

procedure TCPostos.SetFDQPostos(const Value: TFDQuery);
begin
  FFDQPostos := Value;
end;

procedure TCPostos.SetIDPosto(const Value: Integer);
begin
  FnIDPosto := Value;
end;

procedure TCPostos.SetNOME(const Value: String);
begin
  FcNome := Value;
end;

end.
