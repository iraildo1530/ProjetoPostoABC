unit uMPosto;

interface

uses FireDAC.Comp.Client, System.SysUtils, Data.DB, uMConexao;

type
  TPosto = class
    private
      FFDQPostos : TFDQuery;
      FDSPostos  : TDataSource;

      oDadosQry  : TDadosQry;

      procedure SetFDQPostos(const Value: TFDQuery);
      procedure SetDSPostos(const Value: TDataSource);
    public
      procedure CarregarDados;

      function GetFDQPostos : TFDQuery;
      function GetDSPostos : TDataSource;

      property FDQPostos : TFDQuery read GetFDQPostos write SetFDQPostos;
      property DSPostos : TDataSource read GetDSPostos write SetDSPostos;

      constructor Create(const oConexao: TFDConnection);
      destructor Destroy; override;
    end;

const
  _SQL_All_Default = 'Select first 1 * from POSTO';

implementation

{ TPosto }

procedure TPosto.CarregarDados;
begin
  FFDQPostos := oDadosQry.CarregarDados(FDQPostos, 'FDQPostos', _SQL_All_Default, True);
end;

constructor TPosto.Create(const oConexao: TFDConnection);
begin
  FFDQPostos := TFDQuery.Create(nil);
  FDSPostos  := TDataSource.Create(nil);
  oDadosQry  := TDadosQry.Create;

  //Configura Conexão da Query Postos
  FDQPostos.Connection := oConexao;

  //Configura Dataset do DataSource Postos
  DSPostos.DataSet := FDQPostos;
end;

destructor TPosto.Destroy;
begin
  FreeAndNil(oDadosQry);
  FreeAndNil(FFDQPostos);
  FreeAndNil(FDSPostos);
  inherited;
end;

function TPosto.GetDSPostos: TDataSource;
begin
  Result := FDSPostos;
end;

function TPosto.GetFDQPostos: TFDQuery;
begin
  Result := FFDQPostos;
end;

procedure TPosto.SetDSPostos(const Value: TDataSource);
begin
  FDSPostos := Value;
end;

procedure TPosto.SetFDQPostos(const Value: TFDQuery);
begin
  FFDQPostos := Value;
end;

end.
