unit uMTanque;

interface

uses FireDAC.Comp.Client, System.SysUtils, Data.DB, uMConexao;

type
  TTanque = class
    private
      FFDQTanques : TFDQuery;
      FDSTanques  : TDataSource;

      oDadosQry   : TDadosQry;

      procedure SetFDQTanques(const Value: TFDQuery);
      procedure SetDSTanques(const Value: TDataSource);
    public
      procedure CarregarDados;

      function GetFDQTanques : TFDQuery;
      function GetDSTanques : TDataSource;

      property FDQTanques : TFDQuery read GetFDQTanques write SetFDQTanques;
      property DSTanques : TDataSource read GetDSTanques write SetDSTanques;

      constructor Create(const oConexao: TFDConnection);
      destructor Destroy; override;
    end;

const
  _SQL_All_Default = 'Select * from TANQUES';

implementation

{ TTanque }

procedure TTanque.CarregarDados;
begin
  FFDQTanques := oDadosQry.CarregarDados(FDQTanques, 'FDQTanques', _SQL_All_Default, True);
end;

constructor TTanque.Create(const oConexao: TFDConnection);
begin
  FFDQTanques := TFDQuery.Create(nil);
  FDSTanques  := TDataSource.Create(nil);
  oDadosQry  := TDadosQry.Create;

  //Configura Conex?o da Query Tanques
  FDQTanques.Connection := oConexao;

  //Configura Dataset do DataSource Tanques
  DSTanques.DataSet := FDQTanques;
end;

destructor TTanque.Destroy;
begin
  FreeAndNil(oDadosQry);
  FreeAndNil(FFDQTanques);
  FreeAndNil(FDSTanques);
  inherited;
end;

function TTanque.GetDSTanques: TDataSource;
begin
  Result := FDSTanques;
end;

function TTanque.GetFDQTanques: TFDQuery;
begin
  Result := FFDQTanques;
end;

procedure TTanque.SetDSTanques(const Value: TDataSource);
begin
  FDSTanques := Value;
end;

procedure TTanque.SetFDQTanques(const Value: TFDQuery);
begin
  FFDQTanques := Value;
end;

end.
