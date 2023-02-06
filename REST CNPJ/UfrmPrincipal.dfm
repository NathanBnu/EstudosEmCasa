object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 424
  ClientWidth = 609
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 32
    Width = 97
    Height = 16
    Caption = 'Pesquisar CNPJ'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtCNPJ: TEdit
    Left = 40
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 0
    TextHint = 'CNPJ'
  end
  object btnPesquisar: TButton
    Left = 40
    Top = 83
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 1
    OnClick = btnPesquisarClick
  end
  object Memo1: TMemo
    Left = 200
    Top = 31
    Width = 385
    Height = 370
    TabOrder = 2
  end
  object RESTClient1: TRESTClient
    BaseURL = 'HTTPS://www.receitaws.com.br/v1/cnpj'
    Params = <>
    Left = 64
    Top = 184
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    Left = 64
    Top = 240
  end
  object RESTResponse1: TRESTResponse
    Left = 64
    Top = 296
  end
end
