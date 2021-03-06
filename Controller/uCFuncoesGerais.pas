unit uCFuncoesGerais;

interface

uses
  System.Classes, Vcl.StdCtrls, Vcl.Forms, Vcl.Mask, Vcl.DBGrids;

type TFuncoesGerais = class
  private
    FnTagStatus : Integer;
  public
    procedure LimparCampos(Form : TForm);

    procedure SetTagStatus(TagStatus: Integer; Form : TForm);
    function GetTagStatus: Integer;
end;

const
  _TSNovo = 1;

implementation

{ TFuncoesGerais }

function TFuncoesGerais.GetTagStatus: Integer;
begin
  Result := FnTagStatus
end;

procedure TFuncoesGerais.LimparCampos(Form : TForm);
var
  i: Integer;
begin
  //Contador que verifica todos os componentes do Form
  for i := 0 to Form.ComponentCount -1 do
  begin
    //Ativa GroupBox do Novo Abastecimento
    if (Form.Components[i] is TGroupBox) then
    begin
      if (Form.Components[i] as TGroupBox).Tag = 2 then
        (Form.Components[i] as TGroupBox).Visible := (FnTagStatus <> _TSNovo)
      else (Form.Components[i] as TGroupBox).Visible := (FnTagStatus = _TSNovo);
    end;

    //Desativa DBGrid quando est? inserindo um Novo Abastecimento
    if (Form.Components[i] is TDBGrid) then
      (Form.Components[i] as TDBGrid).Visible := (FnTagStatus <> _TSNovo);

    //Limpa todos os componentes TEdit
    if (Form.Components[i] is TEdit) then
      (Form.Components[i] as TEdit).Clear;

    //Limpa todos os componentes TMaskEdit
    if (Form.Components[i] is TMaskEdit) then
      (Form.Components[i] as TMaskEdit).Text := '0';
  end;
end;

procedure TFuncoesGerais.SetTagStatus(TagStatus: Integer; Form : TForm);
begin
  FnTagStatus := TagStatus;
  LimparCampos(Form);
end;

end.
