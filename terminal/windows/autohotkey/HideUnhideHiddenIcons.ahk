; F10::ControlClick,Button2,ahk_class Shell_TrayWnd ; clicks the Show hidden icons ^ button so that even if the icons box is showing, it still shows instead of hides [you might want to trigger the same two times if it doesn't work, in some cases that might work more reliably]

F10::
  IfWinExist ahk_class NotifyIconOverflowWindow
  {
    IfWinExist, ahk_class NotifyIconOverflowWindow
    WinHide ; Hide hidden icons if they were showing
  }
  Else
    ControlClick,Button2,ahk_class Shell_TrayWnd ; Show hidden icons
  Return

; F10:: ; toggle show/hide the so called hidden tray icons METHOD 2 FOR ONLY SOME PURPOSES [confirmed working on Windows 10 BUT works ONLY if hidden tray icons box was already once shown!]
;  DetectHiddenWindows, On
;  IfWinExist, ahk_class NotifyIconOverflowWindow
;  ; Window Exists
;  {
;    DetectHiddenWindows, Off
;    ; Check if its hidden
;    IfWinNotExist, ahk_class NotifyIconOverflowWindow
;    ; Script cant see it without detecting hidden windows, so...
;    {
;      WinShow
;      Return
;    }
;    IfWinExist, ahk_class NotifyIconOverflowWindow
;    ; Script sees it without detecting hidden windows, so..
;    WinHide
;  }
;  ; NOTE: #b and {Space} sometimes works for opening the hidden icons box, however if any traytip is showing, #b will focus on the corresponding systray item instead of the ^ button so that's not a reliable method!
;  Return
