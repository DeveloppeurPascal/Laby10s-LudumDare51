/// <summary>
/// ***************************************************************************
///
/// Laby 10s
///
/// Copyright 2022-2025 Patrick PREMARTIN under AGPL 3.0 license.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
/// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
/// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///
/// ***************************************************************************
///
/// Author(s) :
/// Patrick PREMARTIN
///
/// Site :
/// https://laby10s.gamolf.fr/
///
/// Project site :
/// https://github.com/DeveloppeurPascal/Laby10s-LudumDare51
///
/// ***************************************************************************
/// File last update : 2025-03-29T19:51:24.000+01:00
/// Signature : e54d1297bc79a348d748f2521ae9ace9e6498e99
/// ***************************************************************************
/// </summary>

unit uSceneHome;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  _ScenesAncestor,
  cTitleImage,
  cDialogImage,
  FMX.Layouts,
  _ButtonsAncestor,
  cButtonText;

type
  THomeScene = class(T__SceneAncestor)
    TitleImage1: TTitleImage;
    VertScrollBox1: TVertScrollBox;
    FlowLayout1: TFlowLayout;
    btnPlay: TButtonText;
    btnScores: TButtonText;
    btnOptions: TButtonText;
    btnCredits: TButtonText;
    btnQuit: TButtonText;
    procedure btnCreditsClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure btnQuitClick(Sender: TObject);
    procedure btnScoresClick(Sender: TObject);
    procedure VertScrollBox1Resized(Sender: TObject);
  private
    procedure CalcMenuLayoutHeight;
  public
    procedure ShowScene; override;
    procedure HideScene; override;
    procedure TranslateTexts(const Language: string); override;
  end;

implementation

{$R *.fmx}

uses
  System.Messaging,
  uScene,
  uConsts,
  uUIElements,
  USVGInputPrompts,
  uDMHelpBarManager,
  uGameData;

procedure THomeScene.btnCreditsClick(Sender: TObject);
begin
  tscene.Current := tscenetype.Credits;
end;

procedure THomeScene.btnOptionsClick(Sender: TObject);
begin
  tscene.Current := tscenetype.options;
end;

procedure THomeScene.btnPlayClick(Sender: TObject);
begin
  tgamedata.DefaultGameData.StartANewGame;
  tscene.Current := tscenetype.Game;
end;

procedure THomeScene.btnQuitClick(Sender: TObject);
begin
  tscene.Current := tscenetype.exit;
end;

procedure THomeScene.btnScoresClick(Sender: TObject);
begin
  tscene.Current := tscenetype.HallOfFame;
end;

procedure THomeScene.CalcMenuLayoutHeight;
var
  h: single;
  c: tcontrol;
begin
  h := 0;
  for c in FlowLayout1.Controls do
    if c.visible and (h < c.Position.y + c.height + c.Margins.Bottom) then
      h := c.Position.y + c.height + c.Margins.Bottom;
  if h < VertScrollBox1.height then
    h := VertScrollBox1.height;
  FlowLayout1.height := h;
end;

procedure THomeScene.HideScene;
begin
  inherited;
  TUIItemsList.Current.RemoveLayout;
end;

procedure THomeScene.ShowScene;
begin
  inherited;
  TUIItemsList.Current.NewLayout;

  TUIItemsList.Current.AddControl(btnPlay, nil, btnScores, btnScores,
    nil, true);
  TUIItemsList.Current.AddControl(btnScores, btnPlay, btnOptions,
    btnOptions, btnPlay);
  TUIItemsList.Current.AddControl(btnOptions, btnScores, btnCredits, btnCredits,
    btnScores);
{$IF Defined(IOS) or Defined(ANDROID)}
  TUIItemsList.Current.AddControl(btnCredits, btnOptions, nil, nil, btnOptions);
  btnQuit.visible := false;
{$ELSE}
  TUIItemsList.Current.AddControl(btnCredits, btnOptions, btnQuit, btnQuit,
    btnOptions);
  TUIItemsList.Current.AddControl(btnQuit, btnCredits, nil, nil, btnCredits,
    false, true);
{$ENDIF}

  CalcMenuLayoutHeight;

  // TODO : afficher une help bar éventuelle
end;

procedure THomeScene.TranslateTexts(const Language: string);
begin
  inherited;
  if Language = 'fr' then
  begin
    btnPlay.text := 'Jouer';
    btnScores.text := 'Scores';
    btnOptions.text := 'Options';
    btnCredits.text := 'Crédits';
    btnQuit.text := 'Quitter';
  end
  else
  begin
    btnPlay.text := 'Play';
    btnScores.text := 'Scores';
    btnOptions.text := 'Options';
    btnCredits.text := 'Credits';
    btnQuit.text := 'Quit';
  end;
end;

procedure THomeScene.VertScrollBox1Resized(Sender: TObject);
begin
  CalcMenuLayoutHeight;
end;

initialization

TMessageManager.DefaultManager.SubscribeToMessage(TSceneFactory,
  procedure(const Sender: TObject; const Msg: TMessage)
  var
    NewScene: THomeScene;
  begin
    if (Msg is TSceneFactory) and
      ((Msg as TSceneFactory).SceneType = tscenetype.Home) then
    begin
      NewScene := THomeScene.Create(application.mainform);
      NewScene.Parent := application.mainform;
      tscene.RegisterScene(tscenetype.Home, NewScene);
    end;
  end);

end.
