object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Controle de Abastecimentos'
  ClientHeight = 398
  ClientWidth = 513
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 58
    Width = 160
    Height = 16
    Caption = 'Controle de Abastecimentos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LNomePosto: TLabel
    Left = 8
    Top = 8
    Width = 182
    Height = 33
    Caption = 'Nome do Posto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid: TDBGrid
    Left = 8
    Top = 80
    Width = 497
    Height = 226
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object BTNovo: TButton
    Left = 321
    Top = 49
    Width = 89
    Height = 25
    Caption = 'Novo'
    TabOrder = 1
    OnClick = BTNovoClick
  end
  object GBNovoAbastecimento: TGroupBox
    Tag = 1
    Left = 8
    Top = 80
    Width = 497
    Height = 102
    Caption = 'Novo Abastecimento'
    TabOrder = 5
    Visible = False
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 108
      Height = 13
      Caption = 'Bomba de Combust'#237'vel'
    end
    object Label3: TLabel
      Left = 303
      Top = 24
      Width = 63
      Height = 13
      Caption = 'Quant. Litros'
    end
    object Label4: TLabel
      Left = 398
      Top = 24
      Width = 51
      Height = 13
      Caption = 'Valor Total'
    end
    object Label5: TLabel
      Left = 208
      Top = 24
      Width = 63
      Height = 13
      Caption = 'Valor do Litro'
    end
    object CMBBombaCombustivel: TComboBox
      Left = 8
      Top = 40
      Width = 194
      Height = 21
      TabOrder = 0
      Text = 'CMBBombaCombustivel'
      OnChange = CMBBombaCombustivelChange
    end
    object MEQuantLitros: TMaskEdit
      Left = 303
      Top = 40
      Width = 89
      Height = 21
      TabOrder = 2
      Text = ''
      OnExit = MEQuantLitrosExit
    end
    object MEValorTotal: TMaskEdit
      Left = 398
      Top = 40
      Width = 89
      Height = 21
      TabOrder = 3
      Text = ''
      OnExit = MEValorTotalExit
    end
    object MEValorLitro: TMaskEdit
      Left = 208
      Top = 40
      Width = 89
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 1
      Text = ''
    end
    object BTSalvar: TButton
      Left = 398
      Top = 67
      Width = 89
      Height = 25
      Caption = 'Salvar'
      ModalResult = 6
      TabOrder = 4
      OnClick = BTSalvarClick
    end
    object BTCancelar: TButton
      Left = 303
      Top = 67
      Width = 89
      Height = 25
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 5
      OnClick = BTCancelarClick
    end
  end
  object BTExcluir: TButton
    Left = 416
    Top = 49
    Width = 89
    Height = 25
    Caption = 'Excluir'
    ModalResult = 8
    TabOrder = 2
    OnClick = BTExcluirClick
  end
  object BTAtualizar: TButton
    Left = 226
    Top = 49
    Width = 89
    Height = 25
    Caption = 'Atualizar'
    TabOrder = 0
    OnClick = BTAtualizarClick
  end
  object GBBotoes: TGroupBox
    Tag = 2
    Left = 0
    Top = 312
    Width = 513
    Height = 86
    Align = alBottom
    TabOrder = 4
    ExplicitTop = 320
    object Label6: TLabel
      Left = 8
      Top = 7
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label7: TLabel
      Left = 96
      Top = 7
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object BTRelDiario: TButton
      Tag = 2
      Left = 336
      Top = 50
      Width = 169
      Height = 25
      Caption = 'Relat'#243'rio Di'#225'rio'
      TabOrder = 0
      OnClick = BTRelDiarioClick
    end
    object BTRelPeriodo: TButton
      Tag = 2
      Left = 8
      Top = 50
      Width = 170
      Height = 25
      Caption = 'Relat'#243'rio por Per'#237'odo'
      TabOrder = 3
      OnClick = BTRelPeriodoClick
    end
    object DTPDataIni: TDateTimePicker
      Left = 8
      Top = 23
      Width = 81
      Height = 21
      Date = 44631.000000000000000000
      Time = 0.624743819447758100
      TabOrder = 1
    end
    object DTPDataFim: TDateTimePicker
      Left = 96
      Top = 23
      Width = 81
      Height = 21
      Date = 44631.000000000000000000
      Time = 0.624743819447758100
      TabOrder = 2
    end
  end
end
