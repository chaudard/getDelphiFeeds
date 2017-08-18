unit uWebServiceMainFormApplication;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, xmldom, XMLIntf, msxmldom, XMLDoc, ComCtrls;

type
  TmainApplicationForm = class(TForm)
    IdHTTP1: TIdHTTP;
    btnGetRequest: TButton;
    XMLDocument1: TXMLDocument;
    PageControl1: TPageControl;
    tsResponse: TTabSheet;
    tsDataWanted: TTabSheet;
    MemoResponse: TMemo;
    MemoDatasIWant: TMemo;
    procedure btnGetRequestClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  mainApplicationForm: TmainApplicationForm;

implementation

{$R *.dfm}

procedure TmainApplicationForm.btnGetRequestClick(Sender: TObject);
var
  strXml, link, description: string;
  inodechannel: IXMLNode;
  inode: IXMLNode;
  isubnode: IXMLNode;
  cnt: integer;
begin
  memoResponse.Clear;
  MemoDatasIWant.Clear;
  strXml := IdHTTP1.Get('http://feeds.feedburner.com/delphifeeds');
  XMLDocument1.LoadFromXML(strXml);
  XMLDocument1.Active := true;
  memoResponse.Lines.Text := strXml;

  // XMLDocument1.DocumentElement = <rss>
  inodechannel := XMLDocument1.DocumentElement.ChildNodes.First;
  if (inodechannel <> nil) and (inodechannel.NodeName = 'channel') then
  begin
    inode := inodechannel.ChildNodes.First;
    while (inode <> nil) do
    begin
      if (inode.NodeName = 'item') then
      begin
        cnt := MemoDatasIWant.lines.count;
        isubnode := inode.ChildNodes.FindNode('title');
        if (isubnode <> nil) then
          MemoDatasIWant.Lines.Add('title : ' + isubnode.Text);
        isubnode := inode.ChildNodes.FindNode('link');
        if (isubnode <> nil) then
          MemoDatasIWant.Lines.Add('link : ' + isubnode.Text);
        isubnode := inode.ChildNodes.FindNode('pubDate');
        if (isubnode <> nil) then
          MemoDatasIWant.Lines.Add('pubDate : ' + isubnode.Text);
        isubnode := inode.ChildNodes.FindNode('author');
        if (isubnode <> nil) then
          MemoDatasIWant.Lines.Add('author : ' + isubnode.Text);
        isubnode := inode.ChildNodes.FindNode('description');
        if (isubnode <> nil) then
          MemoDatasIWant.Lines.Add('description : ' + isubnode.Text);
        if MemoDatasIWant.lines.count > cnt then
          MemoDatasIWant.Lines.Add('-------------------------------');
      end;
      inode := inode.NextSibling;
    end;
  end;
end;

end.
