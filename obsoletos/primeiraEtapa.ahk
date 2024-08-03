; Tela 1 =======================================
Gui, Add, Text,, Tela 1: ___________________________

Gui, Add, Text,, Código Carga:
Gui, Add, Edit, vCargaInput w200

Gui, Add, Text,, Remessa:
Gui, Add, Edit, vRemessaInput w200

Gui, Add, Text,, Pedido PBR:
Gui, Add, Edit, vPedidoPbrInput w200

Gui, Add, Text,, Modalidade Frete: CIF( c ), FOB( f )
;Gui, Add, Edit, vModalidadeFreteInput w200
Gui, Add, Radio, vModalidadeFreteInput1 Checked, CIF
Gui, Add, Radio, vModalidadeFreteInput2, FOB

Gui, Add, Button, gEnviarDados, Enviar Tela 1
Gui, Add, Button, gLimpar, Limpar Tela 1

; Tela 2 ======================================
Gui, Add, Text,, Tela 2: ___________________________
Gui, Add, Text,, Tipo Transp: TRF, CIR, MP, DV1
Gui, Add, Edit, vTipoTranspInput w200

Gui, Add, Text,, Espécie Carga: CX, UNI, PALLET
Gui, Add, Edit, vEspecieCargaInput w200

Gui, Add, Text,, Natureza Carga: É o produto:
Gui, Add, Edit, vNaturezaCargaInput w200

Gui, Add, Text,, Troca nf:? Sim( s ), Não ( n )
;Gui, Add, Edit, vTrocaNfInput w200
Gui, Add, Radio, vTrocaNfInput1, Sim
Gui, Add, Radio, vTrocaNfInput2 Checked, Não

Gui, Add, Text,, Nota de Pallet:
Gui, Add, Edit, vNotaPalletInput w200

Gui, Add, Text,, Quantidade Pallet:
Gui, Add, Edit, vQtdePalletInput w200

Gui, Add, Text,, Vale Pedágio:
Gui, Add, Edit, vValePedagioInput w200

Gui, Add, Button, gEnviarDados2, Enviar Tela 2
Gui, Add, Button, gLimpar2, Limpar Tela 2

Gui, Show,, Entrada de Dados

Return

EnviarDados:
Gui, Submit, NoHide

Sleep, 1000

;Run, C:\Users\Win10\Desktop\Nuvem Produção
;WinWaitActive, TOTVS Distribuição e logística (TOTVS) 02.9.0097

;Click, 327, 756

;COD CARGA
Send, !{Tab}
;Send, {Tab}
Sleep, 1000
Send {Left 13}
Sleep, 1000

;Click, 329, 589
Send, {Right 4}
Send, {Enter}

Sleep, 500
;+---------PEDIDO--------------+
Send, %CargaInput%
;+----------------------------+
Sleep, 500
Send, {Tab}
Sleep, 500
;+---------REMESSA------------+
Send, %RemessaInput%
;+---------------------------+
Sleep, 500
;Send, {Tab}
;+---------------PEDIDO PBR---------------+
Send, %PedidoPbrInput%
;+----------------------------------------+
Sleep, 500
Send, {Tab}
Sleep, 1000


;DADOS CTRC
;Send, !{Tab}
Sleep, 500
;Click, 353, 206
Click, 250, 206
;Sleep, 1500
Sleep, 500
Click, 109,243
Send, {Enter}
;Sleep, 1000
Sleep, 500

; Se troca nf está marcado como "Sim"
if ModalidadeFreteInput1
{
    Send, c
}
else
{
    Send, f
}
;+-----MODALIDADE----+
;Send, %ModalidadeFreteInput%
;+-------------------+

Return

Limpar:
Gui, Submit, NoHide

GuiControl,, vCargaInput, % "" ; Limpar vCargaInput
GuiControl,, vRemessaInput, % "" ;Limpar vRemessaInput
GuiControl,, vPedidoPbrInput, % "" ;Limpar vPedidoPbrInput
GuiControl,, vModalidadeFreteInput, % "" ;Limpar vModalidadeFreteInput

ControlSetText, Edit1, , ahk_class AutoHotkeyGUI
ControlSetText, Edit2, , ahk_class AutoHotkeyGUI
ControlSetText, Edit3, , ahk_class AutoHotkeyGUI
ControlSetText, Edit4, , ahk_class AutoHotkeyGUI

Return

;================================================================================


EnviarDados2:
Gui, Submit, NoHide

;Sleep, 1000
;Send, !{Tab}
;Sleep, 2000
Sleep, 500
Click, 443, 293
Sleep, 300
Click, 109,243
Send, {Enter 2}
Send, {Home}
;+-----TIPO TRANSP------+
Send, %TipoTranspInput%
;+----------------------+
Sleep, 700
;Send, {Tab}
Click, 109,243
Sleep, 700
Send, {Enter 2}
Sleep, 700
Loop 14 ; Loop para repetir 4 vezes
{
    Send {Enter} ; Simula pressionamento da tecla Enter
    Sleep 100 ; Espera 2000 milissegundos (2 segundos)
}
Sleep, 700
;+-----ESPECIE CARG------+
Send, %EspecieCargaInput%
;+----------------------+
Sleep, 700
Send, {Enter}
;+-----NATUREZA CARG--------+
Send, %NaturezaCargaInput%
;+-------------------------+
;Sleep, 2000
Sleep, 500
Send, {Enter}
;Sleep, 1000
Sleep, 500
; Se troca nf está marcado como "Sim"
if TrocaNfInput1
{
    Send, s
}
else
{
    Send, n
}

;+-----TROCA NF-------+
;Send, %TrocaNfInput%
;+--------------------+
;Send, {Tab}
;Sleep, 1000
Sleep, 500
Loop 8 ; Loop para repetir 4 vezes
{
    Send {Enter} ; Simula pressionamento da tecla Enter
    Sleep 100 ; Espera 2000 milissegundos (2 segundos)
}

Sleep, 700
;+-----NOTA DE PALLET-----------+
;Send, %NotaPalletInput%
;+------------------------------+
;Sleep 1000
;Click, 410, 455
;Send, {Enter 2}
;Send, %QtdePalletInput%
;Sleep 1000

;+------------OBERVACAO------------------+
Send, %ValePedagioInput%
;+---------------------------------------+
;Sleep, 1000
Sleep, 500

Click, 139, 464
Send, {Home}
Sleep 500
;+-----NOTA DE PALLET-----------+
Send, %NotaPalletInput%
;+------------------------------+
;Send, {Enter}
Sleep 700
Click, 437, 462
Send, {Home}
Sleep 500
Send, %QtdePalletInput%
Sleep 500
Send, {Enter}
Sleep 700

;Click, 968, 216
Click, 980, 200
;Sleep, 2000
Sleep, 500
Click, 179, 246
Return

Limpar2:
Gui, Submit, NoHide

GuiControl,, vTipoTranspInput, % "" ; Limpar
GuiControl,, vEspecieCargaInput, % "" ;Limpar
GuiControl,, vNaturezaCargaInput, % "" ;Limpar
GuiControl,, vTrocaNfInput, % "" ;Limpar
GuiControl,, vNotaPalletInput, % "" ;Limpar
GuiControl,, vValePedagioInput, % "" ;Limpar

ControlSetText, Edit5, , ahk_class AutoHotkeyGUI
ControlSetText, Edit6, , ahk_class AutoHotkeyGUI
ControlSetText, Edit7, , ahk_class AutoHotkeyGUI
ControlSetText, Edit8, , ahk_class AutoHotkeyGUI
ControlSetText, Edit9, , ahk_class AutoHotkeyGUI
ControlSetText, Edit10, , ahk_class AutoHotkeyGUI
ControlSetText, Edit11, , ahk_class AutoHotkeyGUI

Return

GuiClose:
ExitApp
