Dim PASSWORD

PASSWORD = "YOUR_PASSWORD"

Set WshShell = WScript.CreateObject("WScript.Shell")

WshShell.Run """C:\Program Files (x86)\Cisco\Cisco Secure Client\UI\csc_ui.exe"""

WScript.Sleep 1000

WshShell.AppActivate "Cisco AnyConnect Secure Mobility Client"

WshShell.SendKeys "{TAB}"
WshShell.SendKeys "{TAB}"
WshShell.SendKeys "{ENTER}"



WScript.Sleep 1000
WshShell.SendKeys PASSWORD
WshShell.SendKeys "{ENTER}"
WScript.Sleep 500
WshShell.SendKeys "{ENTER}"

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
