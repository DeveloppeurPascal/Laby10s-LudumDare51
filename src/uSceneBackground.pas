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
/// File last update : 2025-03-29T16:06:20.000+01:00
/// Signature : 2c3407fdb9069fb996e5c33d7d73567813fd3a7d
/// ***************************************************************************
/// </summary>

unit uSceneBackground;

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
  FMX.Objects,
  FMX.ImgList;

type
  TSceneBackground = class(T__SceneAncestor)
    Glyph1: TGlyph;
    procedure FrameResized(Sender: TObject);
  private
  protected
    procedure SetBackgroundImage;
  public
    procedure ShowScene; override;
  end;

implementation

{$R *.fmx}

uses
  uDMBackgroundImage;

procedure TSceneBackground.FrameResized(Sender: TObject);
begin
  SetBackgroundImage;
end;

procedure TSceneBackground.SetBackgroundImage;
var
  w, h: single;
begin
  Glyph1.Images := dmBackgroundImage.imagelist1;
  if width > height then
  begin
    // Landscape (1920x1080)
    Glyph1.ImageIndex := 1;
    w := 1920;
    h := 1080;
  end
  else
  begin
    // Portrait (1080*1920)
    Glyph1.ImageIndex := 0;
    w := 1080;
    h := 1920;
  end;
  Glyph1.width := width;
  Glyph1.height := width * h / w;
  if Glyph1.height < height then
  begin
    Glyph1.height := height;
    Glyph1.width := height * w / h;
  end;
end;

procedure TSceneBackground.ShowScene;
begin
  inherited;
  SetBackgroundImage;
  SendToBack;
end;

end.
