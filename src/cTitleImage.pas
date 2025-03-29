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
/// File last update : 2025-03-29T18:21:32.000+01:00
/// Signature : 05a252a2012aefe27887e336c2044204bfe0574d
/// ***************************************************************************
/// </summary>

unit cTitleImage;

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
  Olf.FMX.TextImageFrame,
  FMX.Effects;

type
  TTitleImage = class(TFrame)
    TitleText: TOlfFMXTextImageFrame;
    ShadowEffect1: TShadowEffect;
    procedure FrameResized(Sender: TObject);
  private
  public
    function GetImageIndexOfUnknowChar(Sender: TOlfFMXTextImageFrame;
      AChar: char): integer;
    procedure AfterConstruction; override;
  end;

implementation

{$R *.fmx}

uses
  uDMTitleLettersImage,
  uConsts;

procedure TTitleImage.AfterConstruction;
begin
  inherited;
  TitleText.Font := dmTitleLettersImage.ImageList;
  TitleText.OnGetImageIndexOfUnknowChar := GetImageIndexOfUnknowChar;
  TitleText.height := height;
  tthread.forcequeue(nil,
    procedure
    begin
      TitleText.Text := CAboutGameTitle;
    end);

end;

procedure TTitleImage.FrameResized(Sender: TObject);
begin
  if (TitleText.height <> height) then
  begin
    TitleText.height := height;
    TitleText.Text := TitleText.Text;

    while (TitleText.width > width) and (TitleText.height > 10) do
    begin
      TitleText.height := TitleText.height - 2;
      TitleText.Text := TitleText.Text;
    end;
  end;
end;

function TTitleImage.GetImageIndexOfUnknowChar(Sender: TOlfFMXTextImageFrame;
AChar: char): integer;
begin
  result := -1;
  if (result < 0) and CharInSet(AChar, ['a' .. 'z']) then
    result := Sender.getImageIndexOfChar('_' + AChar);
  if (result < 0) and CharInSet(AChar, ['a' .. 'z']) then
    result := Sender.getImageIndexOfChar(chr(ord('A') + ord(AChar) - ord('a')));
end;

end.
