#Requires AutoHotkey v2.0

A_HotkeyInterval := 2000  ; This is the default value (milliseconds).
A_MaxHotkeysPerInterval := 200

; Define hotkey for Ctrl + `
$^`::
; placing a $ symbol in front of a hotkey designates it as a non-reentrant hotkey. This means that the hotkey cannot trigger itself if the script tries to send the same key within the hotkey's actions. It helps to avoid recursive loops where the hotkey would repeatedly trigger itself and potentially cause an infinite loop.
{
    ; Check if a web browser is the active window
    if     WinActive("ahk_exe chrome.exe") 
        || WinActive("ahk_exe firefox.exe")
        || WinActive("ahk_exe msedge.exe" ) 
    {
        ; Send Ctrl + Shift + Tab
        Send("^+{Tab}")
    }
    else {
        Send("^``")
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

; Hotkey: Right Alt + Enter
RAlt & Enter::
{
    Send "{End};{Enter}"
    return
}

::gg::
{
    Sleep 50 ; 클립보드 업데이트 대기
    Send("Please check the grammar below.") ; 저장할 텍스트
    Send("{Shift down}{Enter}{Shift up}") ; Shift + Enter
    Send("^v") ; 클립보드 내용 붙여넣기
    Send("{Enter}")
    return
}
::h31::를 한국말로 하면?{Enter}
::h31::^v를 한국말로 하면?{Enter}
::htp::how to pronounce ^v{Enter}
::w31::, what is it?{Enter}
::w32::what is ^v?{Enter}
::e31::를 영어로 하면?{Enter}
::mu3::https://muckmool.tistory.com/search/^v{Enter}
