#Requires AutoHotkey v2.0

; Define hotkey for Ctrl + `
^`::
{
    ; Check if a web browser is the active window
    if WinActive(
        WinActive("ahk_exe chrome.exe") 
        || WinActive("ahk_exe firefox.exe")
        || WinActive("ahk_exe msedge.exe" ) )
    {
        ; Send Ctrl + Shift + Tab
        Send("^+{Tab}")
    }
}

^+v::
{
    ; Store the current clipboard content in a variable and trim leading/trailing spaces
    clip := Trim(A_Clipboard)

    ; Remove double or single quotes at the beginning if they exist
    if (SubStr(clip, 1, 1) = '"' || SubStr(clip, 1, 1) = "'")
    {
        clip := SubStr(clip, 2)
    }

    ; Remove double or single quotes at the end if they exist
    if (SubStr(clip, -1) = '"' || SubStr(clip, -1) = "'")
    {
        clip := SubStr(clip, 1, StrLen(clip) - 1)
    }

    ; Send the modified clipboard content
    Send(clip)
}

::gg::Grammar check below please{Enter}^v
::h31::를 한국말로 하면?{Enter}
::h31::^v를 한국말로 하면?{Enter}
::htp::how to pronounce ^v{Enter}
::w31::, what is it?
::w32::what is ^v?{Enter}
