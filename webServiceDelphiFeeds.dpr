program webServiceDelphiFeeds;

uses
  Forms,
  uWebServiceMainFormApplication in 'uWebServiceMainFormApplication.pas' {mainApplicationForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TmainApplicationForm, mainApplicationForm);
  Application.Run;
end.
