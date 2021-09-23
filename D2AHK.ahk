; ==============================================================================
; READ ME: 
;  This allows you to use R as second right mouse click and several other buttons, 
;  R becomes your main skill
;
; Buttons A, S, D, F:  once pressed will activate the skill then go back to your main skill (R)
; Buttons Q, W, E, 5:  same as above
; Button R:            all keyboard presses associated with this script except T and 5 will return to this button
; Button T:            incase you have some secondary skill that you don't want to return mouse button to (R)
; Button Capslock:     this casts F1, A, D. Use this to cast buffs and maybe summons, imperfect though   
 
; ==============================================================================

; #Warn  ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#NoEnv                     ; improves performance
SendMode Input             ; improves reliability

; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
; change the following if needed, should be the name in task manager, this works with diablo 2 but probably not remaster 
; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#IfWinActive, Diablo II    ; suspend outside of client

defaultRightClick = {F9}
defaultLeftClick  = {F10}
defaultWeaponSwap = {F11}
hotkeyDelay       := 1     ; in milliseconds
weaponSwapDelay   := 500   ; in milliseconds


;  ============================================================================
;  ASDF
;  ============================================================================

A::
   Send {A}
   while ( GetKeyState("A" , "P") )
   Click down right
   Click up right
   Send %defaultRightClick%
   Send {R}
return

S::
   Send {S}
   while ( GetKeyState("S" , "P") )
   Click down right
   Click up right
   Send %defaultRightClick%
   Send {R}
return

D::
   Send {D}
   while ( GetKeyState("D" , "P") )
   Click down right
   Click up right
   Send %defaultRightClick%
   Send {R}
return

F::
   Send {F}
   while ( GetKeyState("F" , "P") )
   Click down right
   Click up right
   Send %defaultRightClick%
   Send {R}
return

;  ============================================================================
;  QWER
;  ============================================================================

Q::
   Send {Q}
   while ( GetKeyState("Q" , "P") )
   Click down right
   Click up right
   Send %defaultRightClick%    
   Send {R}
return

W::
   Send {W}
   while ( GetKeyState("W" , "P") )
   Click down right
   Click up right
   Send %defaultRightClick%
   Send {R}
return

E::
   Send {E}
   while ( GetKeyState("E" , "P") )
   Click down right
   Click up right
   Send %defaultRightClick%
   Send {R}
return

R::
   Send {R}
   while ( GetKeyState("R" , "P") )
   Click down right
   Click up right
   Send %defaultRightClick%
return

; ======================================================================
; Instead of returning to using R, 
; will allow you to keep using t with right click
; ======================================================================
T::
   Send {T}
   while ( GetKeyState("T" , "P") )
   Click down right
   Click up right
   Send %defaultRightClick%
   Send {T}
return

; ==========================================
; buffs F1,F2,F3,F3 Capslock
; this uses F1, A, D, might not always work 
; ==========================================
CapsLock::
   Send {F1}
   Click down right
   Click up right
   Send %defaultRightClick%

   Sleep 320
   Send {A}
   Click down right
   Click up right
   Send %defaultRightClick%
   
   Sleep 310
   Send {D}
   Click down right
   Click up right
   Send %defaultRightClick%
return

; ==========================================
; town portal, 
; ==========================================

5::
 Send {5}
   while ( GetKeyState("5" , "P") )
   Click down right
   Click up right
   Send %defaultRightClick%
   Send {R}
return

; ==========================================
; Drink all potions
; ==========================================
; N::
;   potions := 16
;   potionSlotCurrentIndex := 1
;   potionIndex := 0
   
;   while(potions > (potionIndex * potionSlotCurrentIndex) && NPressed < 1){
;    if(potionIndex = 4){
;     potionIndex := 0
;     potionSlotCurrentIndex++
;    }
;    Send {potionSlotCurrentIndex}
;    Sleep 6000
;    potionIndex++
;   }

;return


;  ============================================================================
;  Utility functions
;  ============================================================================

;  Suspend script (for typing in chat)

Enter::
   Suspend, Toggle
   Send {Enter}
return

P::
   Suspend, Toggle
   Send {P}
return

;  Re-enables script in case user escapes out of text window
Escape::
   Suspend, Off
   Send {Escape}
return

QueueSound(delay, soundFile) {
   fn := Func("TriggerSound").Bind(soundFile)
   SetTimer, %fn%, -%delay%
}

TriggerSound(a) {
   SoundPlay, % a
}
