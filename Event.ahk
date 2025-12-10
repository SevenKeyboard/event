#Requires AutoHotkey v2.0.0+
;==============================================================
; Event — Simple wrapper for Win32 manual reset event handle
;
; GitHub: https://github.com/SevenKeyboard/event
; Author: SevenKeyboard Ltd. (2025)
; License: The Unlicense
;==============================================================
class VersionManager_Event
{
    static _ := this._init()
    static _init()    {
        global
        EVENT_VERSION := "1.0.0"
    }
}
class Event
{
    __new()    {
        this.handle := dllCall("Kernel32.dll\CreateEvent", "Ptr",0, "Int",0, "Int",0, "Ptr",0, "Ptr")
    }
    set()    {
        dllCall("Kernel32.dll\SetEvent", "Ptr",this.handle)
    }
    __delete() {
        this.set()
        dllCall("Kernel32.dll\CloseHandle", "Ptr",this.handle)
    }
}