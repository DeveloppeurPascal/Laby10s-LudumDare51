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
/// File last update : 2025-03-29T16:28:12.000+01:00
/// Signature : 43b4022cce1cd4cc53e0f237210490dc022e479d
/// ***************************************************************************
/// </summary>

unit uSceneOptions;
// TODO : à compléter
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
  _ScenesAncestor;

type
  TOptionsScene = class(T__SceneAncestor)
  private
  public
  end;

implementation

{$R *.fmx}

uses
  System.Messaging,
  uScene,
  uConsts,
  uUIElements,
  USVGInputPrompts,
  uDMHelpBarManager;

initialization

TMessageManager.DefaultManager.SubscribeToMessage(TSceneFactory,
  procedure(const Sender: TObject; const Msg: TMessage)
  var
    NewScene: TOptionsScene;
  begin
    if (Msg is TSceneFactory) and
      ((Msg as TSceneFactory).SceneType = TSceneType.Options) then
    begin
      NewScene := TOptionsScene.Create(application.mainform);
      NewScene.Parent := application.mainform;
      tscene.RegisterScene(TSceneType.Options, NewScene);
    end;
  end);

end.
