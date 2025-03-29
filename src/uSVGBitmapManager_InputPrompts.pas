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
/// File last update : 2025-03-29T17:52:52.000+01:00
/// Signature : e6f7ec193a89596d947f6f4c2c316510da13b6d9
/// ***************************************************************************
/// </summary>

unit uSVGBitmapManager_InputPrompts;

interface

uses
  FMX.Graphics,
  USVGInputPrompts,
  USVGBackgroundImages,
  USVGButton,
  USVGPlayer,
  USVGStarAnimation;

/// <summary>
/// Returns a bitmap from a SVG image
/// </summary>
function getBitmapFromSVG(const Index: TSVGInputPromptsIndex;
  const width, height: single; const BitmapScale: single): tbitmap; overload;
function getBitmapFromSVG(const Index: TSVGStarAnimationIndex;
  const width, height: single; const BitmapScale: single): tbitmap; overload;
function getBitmapFromSVG(const Index: TSVGPlayerIndex;
  const width, height: single; const BitmapScale: single): tbitmap; overload;
function getBitmapFromSVG(const Index: TSVGButtonIndex;
  const width, height: single; const BitmapScale: single): tbitmap; overload;
function getBitmapFromSVG(const Index: TSVGBackgroundImagesIndex;
  const width, height: single; const BitmapScale: single): tbitmap; overload;

implementation

uses
  Olf.Skia.SVGToBitmap;

function getBitmapFromSVG(const Index: TSVGInputPromptsIndex;
  const width, height: single; const BitmapScale: single): tbitmap; overload;
begin
  result := TOlfSVGBitmapList.Bitmap(ord(Index) + TSVGInputPrompts.Tag,
    round(width), round(height), BitmapScale);
end;

function getBitmapFromSVG(const Index: TSVGStarAnimationIndex;
  const width, height: single; const BitmapScale: single): tbitmap; overload;
begin
  result := TOlfSVGBitmapList.Bitmap(ord(Index) + TSVGStarAnimation.Tag,
    round(width), round(height), BitmapScale);
end;

function getBitmapFromSVG(const Index: TSVGPlayerIndex;
  const width, height: single; const BitmapScale: single): tbitmap; overload;
begin
  result := TOlfSVGBitmapList.Bitmap(ord(Index) + TSVGPlayer.Tag, round(width),
    round(height), BitmapScale);
end;

function getBitmapFromSVG(const Index: TSVGButtonIndex;
  const width, height: single; const BitmapScale: single): tbitmap; overload;
begin
  result := TOlfSVGBitmapList.Bitmap(ord(Index) + TSVGButton.Tag, round(width),
    round(height), BitmapScale);
end;

function getBitmapFromSVG(const Index: TSVGBackgroundImagesIndex;
  const width, height: single; const BitmapScale: single): tbitmap; overload;
begin
  result := TOlfSVGBitmapList.Bitmap(ord(Index) + TSVGBackgroundImages.Tag,
    round(width), round(height), BitmapScale);
end;

procedure RegisterSVGImages;
begin
  TSVGInputPrompts.Tag := TOlfSVGBitmapList.AddItem(SVGInputPrompts);
  TSVGStarAnimation.Tag := TOlfSVGBitmapList.AddItem(SVGStarAnimation);
  TSVGPlayer.Tag := TOlfSVGBitmapList.AddItem(SVGPlayer);
  TSVGButton.Tag := TOlfSVGBitmapList.AddItem(SVGButton);
  TSVGBackgroundImages.Tag := TOlfSVGBitmapList.AddItem(SVGBackgroundImages);
end;

initialization

RegisterSVGImages;

end.
