#Requires AutoHotkey v1.1.0+
;==============================================================
; Event — Simple wrapper for Win32 manual reset event handle
;
; GitHub: https://github.com/SevenKeyboard/event
; Author: SevenKeyboard Ltd. (2025)
; License: The Unlicense
;==============================================================
class VersionManager_Event
{
    static _ := VersionManager_Event._init()
    _init()    {
        global
        EVENT_VERSION := "1.0.0"
    }
}
class Event
{
    __new(eventAttributes := 0, manualReset := 0, initialState := 0, name := 0)    {
        this.handle := dllCall("Kernel32.dll\CreateEvent", "Ptr",eventAttributes, "Int",manualReset, "Int",initialState, "Ptr",name, "Ptr")
    }
    set()    {
        dllCall("Kernel32.dll\SetEvent", "Ptr",this.handle)
    }
    __delete() {
        this.set()
        dllCall("Kernel32.dll\CloseHandle", "Ptr",this.handle)
    }
}