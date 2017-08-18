object mainApplicationForm: TmainApplicationForm
  Left = 0
  Top = 0
  Caption = 'get Delphi feeds from API'
  ClientHeight = 460
  ClientWidth = 810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnGetRequest: TButton
    Left = 0
    Top = 0
    Width = 810
    Height = 25
    Align = alTop
    Caption = 'clic to send a GET request'
    TabOrder = 0
    OnClick = btnGetRequestClick
    ExplicitLeft = 8
    ExplicitTop = 9
    ExplicitWidth = 75
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 25
    Width = 810
    Height = 435
    ActivePage = tsDataWanted
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 368
    ExplicitTop = 40
    ExplicitWidth = 289
    ExplicitHeight = 193
    object tsResponse: TTabSheet
      Caption = 'Response'
      ExplicitWidth = 281
      ExplicitHeight = 165
      object MemoResponse: TMemo
        Left = 0
        Top = 0
        Width = 802
        Height = 407
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
        ExplicitLeft = -273
        ExplicitTop = -84
        ExplicitWidth = 554
        ExplicitHeight = 249
      end
    end
    object tsDataWanted: TTabSheet
      Caption = 'Datas i want'
      ImageIndex = 1
      ExplicitWidth = 281
      ExplicitHeight = 165
      object MemoDatasIWant: TMemo
        Left = 0
        Top = 0
        Width = 802
        Height = 407
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 32
    Top = 64
  end
  object XMLDocument1: TXMLDocument
    Left = 40
    Top = 120
    DOMVendorDesc = 'MSXML'
  end
end
