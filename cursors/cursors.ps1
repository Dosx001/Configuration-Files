$RegConnect = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]"CurrentUser", "$env:COMPUTERNAME")
$RegCursors = $RegConnect.OpenSubKey("Control Panel\Cursors", $true)

$PWD = $pwd.Path + "\cur\"

$RegCursors.SetValue("","Red")
$RegCursors.SetValue("AppStarting",$PWD + "wait_red.cur")
$RegCursors.SetValue("Arrow",$PWD + "arrow_red.cur")
$RegCursors.SetValue("Crosshair",$PWD + "cross_red.cur")
$RegCursors.SetValue("Hand",$PWD + "aero_link_red.cur")
$RegCursors.SetValue("Help",$PWD + "help_red.cur")
$RegCursors.SetValue("IBeam",$PWD + "beam_red.cur")
$RegCursors.SetValue("No",$PWD + "no_red.cur")
$RegCursors.SetValue("NWPen",$PWD + "pen_red.cur")
$RegCursors.SetValue("Person",$PWD + "person_red.cur")
$RegCursors.SetValue("Pin",$PWD + "pin_red.cur")
$RegCursors.SetValue("SizeAll",$PWD + "move_red.cur")
$RegCursors.SetValue("SizeNESW",$PWD + "size1_red.cur")
$RegCursors.SetValue("SizeNS",$PWD + "size4_red.cur")
$RegCursors.SetValue("SizeNWSE",$PWD + "size2_red.cur")
$RegCursors.SetValue("SizeWE",$PWD + "size3_red.cur")
$RegCursors.SetValue("UpArrow",$PWD + "up_red.cur")
$RegCursors.SetValue("Wait",$PWD + "busy_red.cur")

$RegCursors.Close()
$RegConnect.Close()

function Update-UserPreferencesMask {
$Signature = @"
[DllImport("user32.dll", EntryPoint = "SystemParametersInfo")]
public static extern bool SystemParametersInfo(uint uiAction, uint uiParam, uint pvParam, uint fWinIni);

const int SPI_SETCURSORS = 0x0057;
const int SPIF_UPDATEINIFILE = 0x01;
const int SPIF_SENDCHANGE = 0x02;

public static void UpdateUserPreferencesMask() {
    SystemParametersInfo(SPI_SETCURSORS, 0, 0, SPIF_UPDATEINIFILE | SPIF_SENDCHANGE);
}
"@
Add-Type -MemberDefinition $Signature -Name UserPreferencesMaskSPI -Namespace User32
[User32.UserPreferencesMaskSPI]::UpdateUserPreferencesMask()
}
Update-UserPreferencesMask
