object FrmVRelAbastecimentos: TFrmVRelAbastecimentos
  Left = 0
  Top = 0
  Caption = 'FrmVRelAbastecimentos'
  ClientHeight = 701
  ClientWidth = 963
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 8
    Top = 0
    Width = 794
    Height = 1123
    DataSource = DSRel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = RLReport1BeforePrint
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 43
      BandType = btTitle
      object RLLabel1: TRLLabel
        Left = 3
        Top = 16
        Width = 129
        Height = 18
        Caption = 'Estabelecimento: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 134
        Top = 16
        Width = 141
        Height = 19
        Caption = 'Estabelecimento: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 642
        Top = 16
        Width = 39
        Height = 16
        Text = ''
      end
      object RLLabel3: TRLLabel
        Left = 531
        Top = 16
        Width = 109
        Height = 16
        Caption = 'Estabelecimento: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 42
        Width = 718
        Height = 1
        Align = faClientBottom
        Pen.Style = psInsideFrame
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 601
      Width = 718
      Height = 32
      BandType = btColumnFooter
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 633
      Width = 718
      Height = 40
      BandType = btFooter
      object RLSystemInfo2: TRLSystemInfo
        Left = 50
        Top = 6
        Width = 50
        Height = 16
        Alignment = taCenter
        Info = itPageNumber
        Text = ''
      end
      object RLLabel4: TRLLabel
        Left = 3
        Top = 6
        Width = 48
        Height = 16
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 97
        Top = 6
        Width = 18
        Height = 16
        Caption = 'de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 115
        Top = 6
        Width = 50
        Height = 16
        Alignment = taCenter
        Info = itLastPageNumber
        Text = ''
      end
      object RLDraw2: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 1
        Align = faClientTop
        Pen.Style = psInsideFrame
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 81
      Width = 718
      Height = 520
      object RLGGeral: TRLGroup
        Left = 0
        Top = 0
        Width = 718
        Height = 232
        DataFields = 'DTABASTECIMENTO'
        object RLBCHeaData: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 25
          BandType = btColumnHeader
          object RLLabel13: TRLLabel
            Left = 3
            Top = 6
            Width = 157
            Height = 16
            Caption = 'Abastecimentos do Dia: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBText1: TRLDBText
            Left = 155
            Top = 6
            Width = 130
            Height = 16
            DataField = 'DTABASTECIMENTO'
            DataSource = DSRel
            Text = ''
          end
        end
        object RLGDiario: TRLGroup
          Left = 0
          Top = 25
          Width = 718
          Height = 128
          DataFields = 'DTABASTECIMENTO;TANQUE'
          object RLBCHeaTanque: TRLBand
            Left = 0
            Top = 0
            Width = 718
            Height = 51
            BandType = btColumnHeader
            object RLLabel7: TRLLabel
              Left = 11
              Top = 30
              Width = 198
              Height = 16
              AutoSize = False
              Caption = 'Bomba'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel10: TRLLabel
              Left = 215
              Top = 30
              Width = 91
              Height = 16
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Valor Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel11: TRLLabel
              Left = 11
              Top = 6
              Width = 56
              Height = 16
              Caption = 'Tanque:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLDBText6: TRLDBText
              Left = 68
              Top = 6
              Width = 57
              Height = 16
              DataField = 'TANQUE'
              DataSource = DSRel
              Text = ''
            end
          end
          object RLBDetBomba: TRLBand
            Left = 0
            Top = 51
            Width = 718
            Height = 24
            object RLDBText2: TRLDBText
              Left = 11
              Top = 5
              Width = 198
              Height = 16
              AutoSize = False
              DataField = 'BOMBA'
              DataSource = DSRel
              Text = ''
            end
            object RLDBTValorAbastecimento: TRLDBText
              Left = 215
              Top = 5
              Width = 91
              Height = 16
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'VLRABASTECIMENTO'
              DataSource = DSRel
              DisplayMask = '###,###,##0.00'
              Text = ''
              BeforePrint = RLDBTValorAbastecimentoBeforePrint
            end
          end
          object RLBSumTanque: TRLBand
            Left = 0
            Top = 75
            Width = 718
            Height = 30
            BandType = btSummary
            BeforePrint = RLBSumTanqueBeforePrint
            object RLLabel8: TRLLabel
              Left = 74
              Top = 6
              Width = 135
              Height = 16
              Caption = 'Resumo do Tanque: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLResTanque: TRLLabel
              Left = 215
              Top = 6
              Width = 91
              Height = 16
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Resumo do Tanque: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLDraw4: TRLDraw
              Left = 0
              Top = 0
              Width = 306
              Height = 1
              Align = faLeftTop
              Pen.Style = psDot
            end
          end
        end
        object RLBSumDiario: TRLBand
          Left = 0
          Top = 153
          Width = 718
          Height = 40
          BandType = btSummary
          FriendlyName = 'TANQUE'
          BeforePrint = RLBSumDiarioBeforePrint
          object RLLabel12: TRLLabel
            Left = 101
            Top = 6
            Width = 108
            Height = 16
            Caption = 'Resumo do Dia: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLResDia: TRLLabel
            Left = 215
            Top = 6
            Width = 91
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDraw5: TRLDraw
            Left = 0
            Top = 39
            Width = 718
            Height = 1
            Align = faClientBottom
            Pen.Style = psDash
          end
        end
      end
      object RLSubDetail1: TRLSubDetail
        Left = 0
        Top = 232
        Width = 718
        Height = 185
        DataSource = DSSumario
        Positioning = btFooter
        object RLBand4: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 51
          BandType = btColumnHeader
          object RLLabel6: TRLLabel
            Left = 11
            Top = 30
            Width = 198
            Height = 16
            AutoSize = False
            Caption = 'Bomba'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel9: TRLLabel
            Left = 215
            Top = 30
            Width = 138
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Valor Abastecimento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel14: TRLLabel
            Left = 11
            Top = 6
            Width = 94
            Height = 16
            Caption = 'Resumo Geral'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLBand5: TRLBand
          Left = 0
          Top = 51
          Width = 718
          Height = 24
          object RLDBText4: TRLDBText
            Left = 11
            Top = 5
            Width = 198
            Height = 16
            AutoSize = False
            DataField = 'BOMBA'
            DataSource = DSSumario
            Text = ''
          end
          object RLDBText5: TRLDBText
            Left = 215
            Top = 5
            Width = 138
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VLRABASTECIMENTO'
            DataSource = DSSumario
            DisplayMask = '###,###,##0.00'
            Text = ''
            BeforePrint = RLDBText5BeforePrint
          end
        end
        object RLBand6: TRLBand
          Left = 0
          Top = 75
          Width = 718
          Height = 62
          BandType = btSummary
          BeforePrint = RLBand6BeforePrint
          object RLLResGeral: TRLLabel
            Left = 215
            Top = 6
            Width = 138
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Resumo do Tanque: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDraw3: TRLDraw
            Left = 0
            Top = 61
            Width = 718
            Height = 1
            Align = faBottom
            Pen.Style = psDot
          end
          object RLLabel15: TRLLabel
            Left = 130
            Top = 6
            Width = 79
            Height = 16
            Caption = 'Total Geral:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
  end
  object DSRel: TDataSource
    DataSet = FDQRel
    Left = 832
    Top = 96
  end
  object FDQRel: TFDQuery
    SQL.Strings = (
      'SELECT A.DTABASTECIMENTO,'
      '       T.NOME TANQUE,'
      '       B.NOME BOMBA,'
      '       SUM(COALESCE(A.VLRABASTECIMENTO,0)) VLRABASTECIMENTO'
      'FROM ABASTECIMENTO A'
      'INNER JOIN BOMBAS  B ON B.IDBOMBA = A.IDBOMBA'
      'INNER JOIN TANQUES T ON T.IDTANQUE = B.IDTANQUE'
      'WHERE (A.DTABASTECIMENTO BETWEEN :DATAINI AND :DATAFIM)'
      'GROUP BY A.DTABASTECIMENTO,'
      '         T.NOME,'
      '         B.NOME'
      'ORDER BY A.DTABASTECIMENTO')
    Left = 832
    Top = 40
    ParamData = <
      item
        Name = 'DATAINI'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATAFIM'
        DataType = ftDate
        ParamType = ptInput
      end>
    object FDQRelDTABASTECIMENTO: TDateField
      FieldName = 'DTABASTECIMENTO'
      Origin = 'DTABASTECIMENTO'
      Required = True
    end
    object FDQRelTANQUE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TANQUE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object FDQRelBOMBA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BOMBA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object FDQRelVLRABASTECIMENTO: TFMTBCDField
      FieldName = 'VLRABASTECIMENTO'
      Origin = 'VLRABASTECIMENTO'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object DSSumario: TDataSource
    DataSet = FDQSumario
    Left = 896
    Top = 96
  end
  object FDQSumario: TFDQuery
    SQL.Strings = (
      'SELECT T.NOME TANQUE,'
      '       B.NOME BOMBA,'
      '       SUM(COALESCE(A.VLRABASTECIMENTO,0)) VLRABASTECIMENTO'
      'FROM ABASTECIMENTO A'
      'INNER JOIN BOMBAS  B ON B.IDBOMBA = A.IDBOMBA'
      'INNER JOIN TANQUES T ON T.IDTANQUE = B.IDTANQUE'
      'WHERE (A.DTABASTECIMENTO BETWEEN :DATAINI AND :DATAFIM)'
      'GROUP BY T.NOME, B.NOME')
    Left = 896
    Top = 40
    ParamData = <
      item
        Name = 'DATAINI'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATAFIM'
        DataType = ftDate
        ParamType = ptInput
      end>
    object StringField1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TANQUE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object StringField2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BOMBA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object FMTBCDField1: TFMTBCDField
      FieldName = 'VLRABASTECIMENTO'
      Origin = 'VLRABASTECIMENTO'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
  end
end
