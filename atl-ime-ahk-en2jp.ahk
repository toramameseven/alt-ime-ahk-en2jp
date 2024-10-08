#Requires AutoHotkey v2.0
; 日本語キーボードモードで、英語入力にする.
; 日本語キーボードは、キートップを英語にする.
; 英語キーボードは、そのまま使用できる.
; calslock は F18 に変更済み
; 変換キーではvk1Csc079をsc079に、無変換キーではvk1Dsc07Bをsc07Bに書き換えることによってエラーを回避できました。

; 左右 Alt キーの空打ちで IME の OFF/ON を切り替える.
;
; 左 Alt キーの空打ちで IME を「英数」に切り替え F16
; 右 Alt キーの空打ちで IME を「かな」に切り替え F15
; Alt キー;を押している間に他のキーを打つと通常の Alt キーとして動作.


; 以下はオリジナルの情報
; AutoHotkey: v1.1.24.05
; Author:     karakaram   http://www.karakaram.com/alt-ime-on-off
; https://github.com/karakaram/alt-ime-ahk

; 日本語から英語
; Author: @uhyot さん
; https://qiita.com/uhyot/items/e3039e9e730e89939b58


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
*~F18::
{
Return
}


#UseHook
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ; 1段目.
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 VKF4::Send "{``}"    ;         半角/全角     -> `
 +VKF4::Send "{~}"    ; Shift + 半角/全角     -> ~
 +2::Send "{@}"       ; Shift + 2         ["] -> @
 +6::Send "{^}"       ; Shift + 6         [&] -> ^
 +7::Send "{&}"       ; Shift + 7         ['] -> &
 +8::Send "{*}"       ; Shift + 8         [(] -> *
 +9::Send "{(}"       ; Shift + 9         [)] -> (
 +0::Send "{)}"       ; Shift + 0         [ ] -> )
 +-::Send "{_}"       ; Shift + -         [=] -> _
 ^::Send "{=}"        ;                   [^] -> =
 +^::Send "{+}"       ; Shift + ^         [~] -> +

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
 *::Send "{`"}"      ; Shift + :         [*] -> "
 ]::send "{\}"       ; ]                 []] -> \
 +]::send "{|}"      ; Shift + ]         [}] -> |

; 上部メニューがアクティブになるのを抑制.
*~LAlt::Send "{Blind}{vk07}"
*~RAlt::Send "{Blind}{vk07}"

;vk1Csc079をsc079に、無変換キーではvk1Dsc07Bをsc07B
LAlt up::
{
if (A_PriorHotkey == "*~LAlt")
send "{sc07B}"
Return
}
; 右 Alt 空打ちで IME を ON. F15
RAlt up::
{
if (A_PriorHotkey == "*~RAlt")
send "{sc079}"
Return
}


;; ここからは おまけ

F18 & l::send  "{Blind}{Left}"
F18 & u::send  "{Blind}{Up}"
F18 & d::send  "{Blind}{Down}"
F18 & r::send  "{Blind}{Right}"
F18 & m::send  "{Blind}{Enter}"
F18 & h::send  "{Blind}{bs}"
F18 & e::send  "{Blind}{End}"
F18 & t::send  "{Blind}{Home}"
F18 & v::send  "^v"
F18 & c::send  "^c"
F18 & x::send  "^x"
F18 & z::send  "^z"
F18 & s::send  "^s"
F18 & a::send  "^a"
F18 & f::send  "^f"
F18 & i::send "{sc07B}"
F18 & o::send "{sc079}"
 