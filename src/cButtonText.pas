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
/// File last update : 2025-03-29T20:06:26.000+01:00
/// Signature : 34465d1a24b314c021e03c7312befd350c22034d
/// ***************************************************************************
/// </summary>

unit cButtonText;

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
  _ButtonsAncestor,
  Olf.FMX.TextImageFrame,
  FMX.Effects,
  FMX.Filter.Effects,
  FMX.Objects;

type
  TButtonText = class(T__ButtonAncestor)
    Image1: TImage;
    SepiaEffect1: TSepiaEffect;
    OlfFMXTextImageFrame1: TOlfFMXTextImageFrame;
    SepiaEffect2: TSepiaEffect;
  private
    function GetImageIndexOfUnknowChar(Sender: TOlfFMXTextImageFrame;
      AChar: char): integer;
  public
    procedure Repaint; override;
    procedure AfterConstruction; override;
  end;

implementation

{$R *.fmx}

uses
  USVGButton,
  uSVGBitmapManager_InputPrompts,
  udmFonteMugshot;

{ TButtonText }

procedure TButtonText.AfterConstruction;
begin
  inherited;
  OlfFMXTextImageFrame1.Font := dmFonteMugshot.ImageList;
  OlfFMXTextImageFrame1.OnGetImageIndexOfUnknowChar :=
    GetImageIndexOfUnknowChar;
end;

function TButtonText.GetImageIndexOfUnknowChar(Sender: TOlfFMXTextImageFrame;
  AChar: char): integer;
begin
  result := -1;
  if (result < 0) and CharInSet(AChar, ['a' .. 'z']) then
    result := Sender.getImageIndexOfChar('_' + AChar);
  if (result < 0) and CharInSet(AChar, ['a' .. 'z']) then
    result := Sender.getImageIndexOfChar(chr(ord('A') + ord(AChar) - ord('a')));
  if (result < 0) and (AChar = '?') then
    result := Sender.getImageIndexOfChar('interrogation');
  if (result < 0) and (AChar = '$') then
    result := Sender.getImageIndexOfChar('dollar');
  if (result < 0) and (AChar = '!') then
    result := Sender.getImageIndexOfChar('exclamation');
  if (result < 0) and (AChar = '&') then
    result := Sender.getImageIndexOfChar('et');
  if (result < 0) and (AChar = '%') then
    result := Sender.getImageIndexOfChar('pourcent');
  if (result < 0) and (AChar = '''') then
    result := Sender.getImageIndexOfChar('apostrophe');
  if (result < 0) and (AChar = ',') then
    result := Sender.getImageIndexOfChar('virgule');
  if (result < 0) and (AChar = '=') then
    result := Sender.getImageIndexOfChar('egale');
  if (result < 0) and (AChar = '-') then
    result := Sender.getImageIndexOfChar('moins');
  if (result < 0) and (AChar = '+') then
    result := Sender.getImageIndexOfChar('plus');
  if (result < 0) and (AChar = 'à') then
    result := Sender.getImageIndexOfChar('_agrave');
  if (result < 0) and (AChar = 'à') then
    result := GetImageIndexOfUnknowChar(Sender, 'a');
  if (result < 0) and (AChar = 'é') then
    result := Sender.getImageIndexOfChar('_eaigu');
  if (result < 0) and (AChar = 'è') then
    result := Sender.getImageIndexOfChar('_egrave');
  if (result < 0) and (AChar = 'ê') then
    result := Sender.getImageIndexOfChar('_ecirconflexe');
  if (result < 0) and (AChar = 'ë') then
    result := Sender.getImageIndexOfChar('_etrema');
  if (result < 0) and CharInSet(AChar, ['é', 'è', 'ê', 'ë']) then
    result := GetImageIndexOfUnknowChar(Sender, 'e');
  if (result < 0) and (AChar = 'ô') then
    result := Sender.getImageIndexOfChar('_ocirconflexe');
  if (result < 0) and (AChar = 'ö') then
    result := Sender.getImageIndexOfChar('_otrema');
  if (result < 0) and CharInSet(AChar, ['ô', 'ö']) then
    result := GetImageIndexOfUnknowChar(Sender, 'o');
  if (result < 0) and (AChar = 'î') then
    result := Sender.getImageIndexOfChar('_icirconflexe');
  if (result < 0) and (AChar = 'ï') then
    result := Sender.getImageIndexOfChar('_itrema');
  if (result < 0) and CharInSet(AChar, ['î', 'ï']) then
    result := GetImageIndexOfUnknowChar(Sender, 'i');
  if (result < 0) and (AChar = 'û') then
    result := Sender.getImageIndexOfChar('_ucirconflexe');
  if (result < 0) and (AChar = 'ü') then
    result := Sender.getImageIndexOfChar('_utrema');
  if (result < 0) and (AChar = 'ù') then
    result := Sender.getImageIndexOfChar('_ugrave');
  // if (result < 0) and (AChar = '') then // TODO : ajouter u aigu
  // result := Sender.getImageIndexOfChar('_uaigu');
  if (result < 0) and CharInSet(AChar, ['û', 'ü', 'ù']) then
    // TODO : ajouter u aigu
    result := GetImageIndexOfUnknowChar(Sender, 'u');
  if (result < 0) and (AChar = 'oe') then
    result := Sender.getImageIndexOfChar('_oe');
  // TODO : récupérer "oe" en minuscules
  if (result < 0) and (AChar = 'OE') then
    result := Sender.getImageIndexOfChar('OE');
  // TODO : récupérer "oe" en majuscules
  // if (result < 0) and (AChar = '...') then
  // TODO : récupérer points de suspensions en 1 caractère
  // result := Sender.getImageIndexOfChar('suspension'); // TODO
  if (result < 0) and (AChar = '.') then
    result := Sender.getImageIndexOfChar('point');
  if (result < 0) and (AChar = ':') then
    result := Sender.getImageIndexOfChar('deuxpoint');
  if (result < 0) and (AChar = ':') then
    result := Sender.getImageIndexOfChar('deux-point');
  if (result < 0) and (AChar = ';') then
    result := Sender.getImageIndexOfChar('pointvirgule');
  if (result < 0) and (AChar = ';') then
    result := Sender.getImageIndexOfChar('point-virgule');
  if (result < 0) and CharInSet(AChar, ['.', ',', ';', ':', '!', '''']) then
    result := GetImageIndexOfUnknowChar(Sender, ' ');
end;

procedure TButtonText.Repaint;
begin
  Image1.Bitmap.Assign(getBitmapFromSVG(TSVGButtonIndex.ButtonTextBackground,
    Image1.width, Image1.height, Image1.Bitmap.BitmapScale));

  OlfFMXTextImageFrame1.BeginUpdate;
  try
    if IsFocused then
      OlfFMXTextImageFrame1.height := 53
    else
      OlfFMXTextImageFrame1.height := 43;
    OlfFMXTextImageFrame1.Text := Text;
  finally
    OlfFMXTextImageFrame1.EndUpdate;
  end;
  SepiaEffect2.Enabled := not IsFocused;

  SepiaEffect1.Enabled := IsDown;
end;

end.
