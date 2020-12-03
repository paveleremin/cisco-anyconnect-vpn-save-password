Dim PASSWORD

PASSWORD = "SET_YOUR_PASSWORD_HERE"

Set WshShell = WScript.CreateObject("WScript.Shell")

WshShell.Run """%PROGRAMFILES(x86)%\Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe"""

WScript.Sleep 2000

WshShell.AppActivate "Cisco AnyConnect Secure Mobility Client"

WshShell.SendKeys "{TAB}"
WshShell.SendKeys "{TAB}"
WshShell.SendKeys "{ENTER}"

WScript.Sleep 3000
WshShell.SendKeys "{TAB}"
WshShell.SendKeys "{ENTER}"

WScript.Sleep 6000
WshShell.SendKeys PASSWORD
WshShell.SendKeys "{ENTER}"
WScript.Sleep 500

Function ClipBoard(input)
  If IsNull(input) Then
    ClipBoard = CreateObject("HTMLFile").parentWindow.clipboardData.getData("Text")
    If IsNull(ClipBoard) Then ClipBoard = ""
  Else
    CreateObject("WScript.Shell").Run _
      "mshta.exe javascript:eval(""document.parentWindow.clipboardData.setData('text','" _
      & Replace(Replace(Replace(input, "'", "\\u0027"), """","\\u0022"),Chr(13),"\\r\\n") & "');window.close()"")", _
      0,True
  End If
End Function

ClipBoard(PASSWORD)