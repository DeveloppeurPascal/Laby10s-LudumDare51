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
/// File last update : 2025-03-29T19:01:52.000+01:00
/// Signature : b6109695a80156306fb93dfb1f01766309f03706
/// ***************************************************************************
/// </summary>

program Laby10s;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  fMain in '..\lib-externes\Gamolf-FMX-Game-Starter-Kit\src\fMain.pas' {frmMain},
  Olf.FMX.AboutDialog in '..\lib-externes\AboutDialog-Delphi-Component\src\Olf.FMX.AboutDialog.pas',
  Olf.FMX.AboutDialogForm in '..\lib-externes\AboutDialog-Delphi-Component\src\Olf.FMX.AboutDialogForm.pas' {OlfAboutDialogForm},
  u_urlOpen in '..\lib-externes\librairies\src\u_urlOpen.pas',
  uConsts in 'uConsts.pas',
  Olf.RTL.Language in '..\lib-externes\librairies\src\Olf.RTL.Language.pas',
  Olf.RTL.CryptDecrypt in '..\lib-externes\librairies\src\Olf.RTL.CryptDecrypt.pas',
  Olf.RTL.Params in '..\lib-externes\librairies\src\Olf.RTL.Params.pas',
  Olf.Skia.SVGToBitmap in '..\lib-externes\librairies\src\Olf.Skia.SVGToBitmap.pas',
  uDMAboutBox in '..\lib-externes\Gamolf-FMX-Game-Starter-Kit\src\uDMAboutBox.pas' {AboutBox: TDataModule},
  uDMAboutBoxLogoStorrage in 'uDMAboutBoxLogoStorrage.pas' {dmAboutBoxLogo: TDataModule},
  uTxtAboutLicense in 'uTxtAboutLicense.pas',
  uTxtAboutDescription in 'uTxtAboutDescription.pas',
  Gamolf.FMX.HelpBar in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.FMX.HelpBar.pas',
  Gamolf.FMX.Joystick in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.FMX.Joystick.pas',
  Gamolf.FMX.MusicLoop in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.FMX.MusicLoop.pas',
  Gamolf.RTL.GamepadDetected in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.RTL.GamepadDetected.pas',
  Gamolf.RTL.Joystick.DirectInput.Win in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.RTL.Joystick.DirectInput.Win.pas',
  Gamolf.RTL.Joystick.Helpers in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.RTL.Joystick.Helpers.pas',
  Gamolf.RTL.Joystick.Mac in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.RTL.Joystick.Mac.pas',
  Gamolf.RTL.Joystick in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.RTL.Joystick.pas',
  Gamolf.RTL.Scores in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.RTL.Scores.pas',
  Gamolf.RTL.UIElements in '..\lib-externes\Delphi-Game-Engine\src\Gamolf.RTL.UIElements.pas',
  iOSapi.GameController in '..\lib-externes\Delphi-Game-Engine\src\iOSapi.GameController.pas',
  Macapi.GameController in '..\lib-externes\Delphi-Game-Engine\src\Macapi.GameController.pas',
  uTranslate in '..\lib-externes\Gamolf-FMX-Game-Starter-Kit\src\uTranslate.pas',
  uConfig in '..\lib-externes\Gamolf-FMX-Game-Starter-Kit\src\uConfig.pas',
  _ScenesAncestor in '..\lib-externes\Gamolf-FMX-Game-Starter-Kit\src\_ScenesAncestor.pas' {__SceneAncestor: TFrame},
  uScene in '..\lib-externes\Gamolf-FMX-Game-Starter-Kit\src\uScene.pas',
  uUIElements in '..\lib-externes\Gamolf-FMX-Game-Starter-Kit\src\uUIElements.pas',
  uGameData in '..\lib-externes\Gamolf-FMX-Game-Starter-Kit\src\uGameData.pas',
  Olf.RTL.Streams in '..\lib-externes\librairies\src\Olf.RTL.Streams.pas',
  Olf.RTL.Maths.Conversions in '..\lib-externes\librairies\src\Olf.RTL.Maths.Conversions.pas',
  uBackgroundMusic in '..\lib-externes\Gamolf-FMX-Game-Starter-Kit\src\uBackgroundMusic.pas',
  uSoundEffects in 'uSoundEffects.pas',
  USVGInputPrompts in '..\lib-externes\Gamolf-FMX-Game-Starter-Kit\assets\kenney_nl\InputPrompts\USVGInputPrompts.pas',
  uDMGameControllerCenter in '..\lib-externes\Gamolf-FMX-Game-Starter-Kit\src\uDMGameControllerCenter.pas' {DMGameControllerCenter: TDataModule},
  uSVGBitmapManager_InputPrompts in 'uSVGBitmapManager_InputPrompts.pas',
  uDMHelpBarManager in '..\lib-externes\Gamolf-FMX-Game-Starter-Kit\src\uDMHelpBarManager.pas' {HelpBarManager: TDataModule},
  _ButtonsAncestor in '..\lib-externes\Gamolf-FMX-Game-Starter-Kit\src\_ButtonsAncestor.pas' {__ButtonAncestor: TFrame},
  uSceneBackground in 'uSceneBackground.pas' {SceneBackground: TFrame},
  uDMBackgroundImage in '..\_PRIVATE\assets\AdobeStock\background-jeu\uDMBackgroundImage.pas' {dmBackgroundImage: TDataModule},
  uSceneHome in 'uSceneHome.pas' {HomeScene: TFrame},
  uSceneGame in 'uSceneGame.pas' {GameScene: TFrame},
  uSceneGameOverLost in 'uSceneGameOverLost.pas' {GameOverLostScene: TFrame},
  uSceneGameOverWin in 'uSceneGameOverWin.pas' {GameOverWinScene: TFrame},
  uSceneHallOfFame in 'uSceneHallOfFame.pas' {HallOfFameScene: TFrame},
  uSceneCredits in 'uSceneCredits.pas' {CreditsScene: TFrame},
  uSceneOptions in 'uSceneOptions.pas' {OptionsScene: TFrame},
  uDMTitleLettersImage in '..\_PRIVATE\assets\AdobeStock\logo-et-titre-du-jeu\Laby10s\uDMTitleLettersImage.pas' {dmTitleLettersImage: TDataModule},
  udmchiffresscore in '..\_PRIVATE\assets\AdobeStock\score-et-niveau\chiffres-score\udmchiffresscore.pas' {dmchiffresscore: TDataModule},
  cTitleImage in 'cTitleImage.pas' {TitleImage: TFrame},
  Olf.FMX.TextImageFrame in '..\lib-externes\librairies\src\Olf.FMX.TextImageFrame.pas' {OlfFMXTextImageFrame: TFrame},
  udmFonteGameOver in '..\_PRIVATE\assets\AdobeStock\textes-boutons-et-titres\FonteGameOver\udmFonteGameOver.pas' {dmFonteGameOver: TDataModule},
  udmFonteMugshot in '..\_PRIVATE\assets\AdobeStock\textes-boutons-et-titres\FonteMugshot\udmFonteMugshot.pas' {dmFonteMugshot: TDataModule},
  USVGStarAnimation in '..\_PRIVATE\assets\AdobeStock\animation-etoile\AdobeStock_105526629\StarAnimation\USVGStarAnimation.pas',
  USVGBackgroundImages in '..\_PRIVATE\assets\AdobeStock\bloc-and-dialog-background\AdobeStock_243823548\BackgroundImages\USVGBackgroundImages.pas',
  USVGButton in '..\_PRIVATE\assets\AdobeStock\bouton-texte\AdobeStock_434484212\Button\USVGButton.pas',
  udmchiffrescompteur in '..\_PRIVATE\assets\AdobeStock\compteur\chiffres-compteur\udmchiffrescompteur.pas' {dmchiffrescompteur: TDataModule},
  USVGPlayer in '..\_PRIVATE\assets\AdobeStock\player\AdobeStock_243661299\Player\USVGPlayer.pas',
  cDialogImage in 'cDialogImage.pas' {DialogImage: TFrame},
  cButtonText in 'cButtonText.pas' {ButtonText: TFrame};

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDMGameControllerCenter, DMGameControllerCenter);
  Application.CreateForm(TdmBackgroundImage, dmBackgroundImage);
  Application.CreateForm(Tdmchiffrescompteur, dmchiffrescompteur);
  Application.CreateForm(TdmTitleLettersImage, dmTitleLettersImage);
  Application.CreateForm(Tdmchiffresscore, dmchiffresscore);
  Application.CreateForm(TdmFonteGameOver, dmFonteGameOver);
  Application.CreateForm(TdmFonteMugshot, dmFonteMugshot);
  Application.CreateForm(Tdmchiffrescompteur, dmchiffrescompteur);
  Application.Run;
end.
