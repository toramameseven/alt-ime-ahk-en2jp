#Requires AutoHotkey v2.0
; 日本語キーボードモードで、英語入力にする.
; 日本語キーボードは、キートップを英語にする.
; 英語キーボードは、そのまま使用できる.
; calslock は F18 に変更済み

; 左右 Alt キーの空打ちで IME の OFF/ON を切り替える.
;
; 左 Alt キーの空打ちで IME を「英数」に切り替え F16
; 右 Alt キーの空打ちで IME を「かな」に切り替え F15
; Alt キー;を押している間に他のキーを打つと通常の Alt キーとして動作.


; 以下はオリジナルの情報
; AutoHotkey: v1.1.24.05
; Author:     karakaram   http://www.karakaram.com/alt-ime-on-off
; https://github.com/karakaram/alt-ime-ahk


; Razer Synapseなど、キーカスタマイズ系のツールを併用しているときのエラー対策.
; err #MaxHotkeysPerInterval 350

; 主要なキーを HotKey に設定し、何もせずパススルーする.

*~a::
*~b::
*~c::
*~d::
*~e::
*~f::
*~g::
*~h::
*~i::
*~j::
*~k::
*~l::
*~m::
*~n::
*~o::
*~p::
*~q::
*~r::
*~s::
*~t::
*~u::
*~v::
*~w::
*~x::
*~y::
*~z::
*~1::
*~2::
*~3::
*~4::
*~5::
*~6::
*~7::
*~8::
*~9::
*~0::
*~F1::
*~F2::
*~F3::
*~F4::
*~F5::
*~F6::
*~F7::
*~F8::
*~F9::
*~F10::
*~F11::
*~F12::
;*~`::
*~~::
*~!::
;*~@::
*~#::
*~$::
*~%::
*~^::
*~&::
*~*::
*~(::
*~)::
*~-::
*~_::
*~=::
*~+::
;*~[::
;*~{::
;*~]::
;*~}::
*~\::
*~|::
*~;::
*~'::
*~"::
*~,::
*~<::
*~.::
*~>::
*~/::
*~?::
*~Esc::
*~Tab::
*~Space::
;*~LAlt::
;*~RAlt::
*~Left::
*~Right::
*~Up::
*~Down::
*~Enter::
*~PrintScreen::
*~Delete::
*~Home::
*~End::
*~PgUp::
*~PgDn::
    {
        Return
        }


#UseHook
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ; 1段目.
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 VKF4::Send "{``}"     ;         半角/全角     -> `
 +VKF4::Send "{~}"    ; Shift + 半角/全角     -> ~
 +2::Send "{@}"       ; Shift + 2         ["] -> @
 +6::Send "{^}"       ; Shift + 6         [&] -> ^
 +7::Send "{&}"       ; Shift + 7         ['] -> &
 +8::Send "{*}"       ; Shift + 8         [(] -> *
 +9::Send "{(}"       ; Shift + 9         [)] -> (
 +0::Send "{)}"       ; Shift + 0         [ ] -> )
 +-::Send "{_}"       ; Shift + -         [=] -> _
 ^::Send "{=}"        ;                   [^] -> =
 +^::Send "{+}"      ; Shift + ^         [~] -> +

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ; 2段目.
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 @::send "{[}"       ;                   [@] -> [
 +@::send "{{}"      ; Shift + @         [`] -> {
 [::send "{]}"       ;                   [[] -> ]
 +[::Send "{}}"      ; Shift + [         [{] -> }

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ; 3段目.
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;                  ; ;                 [;] -> ;
 +;::Send "{:}"      ; Shift + ;         [+] -> :
 :::Send "{'}"       ; :                 [:] -> '
 *::Send "{`"}"       ; Shift + :          [*] -> "
 ]::send "{\}"       ; ]                  []] -> \
 +]::send "{|}"      ; Shift + ]         [}] -> |

; 上部メニューがアクティブになるのを抑制.
*~LAlt::Send "{Blind}{vk07}"
*~RAlt::Send "{Blind}{vk07}"

; 左 Alt 空打ちで IME を OFF.
LAlt up::
    {if (A_PriorHotkey == "*~LAlt")
        send "{F16}"
    
    Return
}
; 右 Alt 空打ちで IME を ON.
RAlt up::
    {if (A_PriorHotkey == "*~RAlt")
            send "{F15}"
        Return
        }

;;
!Space::Send "{F15}"

;; forked from https://github.com/usi3/emacs.ahk
*~F18::
{
     Return    
}

;; ここからは おまけ

F18 & f::send  "{Blind}{Left}"
F18 & p::send  " {Blind}{Up}"
F18 & n::send  "{Blind}{Down}"
F18 & b::send  "{Blind}{Right}"
F18 & m::send  "{Blind}{Enter}"
F18 & h::send  "{Blind}{bs}"
F18 & d::send  "{Blind}{Delete}"
F18 & e::send  "{Blind}{End}"
F18 & t::send  "{Blind}{Home}"
F18 & c::send  "^c"
F18 & x::send  "^x"
F18 & z::send  "^z"
F18 & v::send  "^v"
F18 & s::send  "^s"
F18 & a::send  "^a"
;;;    
