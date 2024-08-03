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

Gui, Add, Button, gEnviarDados, Enviar
Gui, Add, Button, gLimpar, Limpar

Gui, Show,, Entrada de Dados

Return

EnviarDados:
Gui, Submit, NoHide

;Run, C:\Users\Win10\Desktop\Nuvem Produção
;WinWaitActive, TOTVS Distribuição e logística (TOTVS) 02.9.0097

Send, !{Tab}
Sleep, 2000
Click, 38, 585
Send, {Right 12}

; Pegar xml
Sleep, 500
Send, {Enter}
Send, {Tab}
Sleep, 200
Send, s
Sleep, 900
MsgBox Proseguir?
;Sleep, 10000

;COD CARGA
Send, {Left 13}
Sleep, 800

if (CargaInput != "")
{

    Send, {Right 4}
    Sleep, 500
    Send, {Enter}
    ;+---------PEDIDO--------------+
    Send, %CargaInput%
    ;+----------------------------+
    Sleep, 500
    Send, {Tab}
    Sleep, 500
}

if (RemessaInput != "")
{
    ;+---------REMESSA------------+
    Send, %RemessaInput%
    ;+---------------------------+
    Sleep, 500
    ;Send, {Tab}
}

if (PedidoPbrInput != "")
{
    ;+---------------PEDIDO PBR---------------+
    Send, %PedidoPbrInput%
    ;+----------------------------------------+
    Sleep, 500
    Send, {Tab}
    Sleep, 1000
}

;DADOS CTRC
Click, 250, 206
Sleep, 500
Click, 109,243
Send, {Enter}
Sleep, 500

if ModalidadeFreteInput1
{
    Send, c
}
else
{
    Send, f
}

if CargaInput != 4575640309
{
    Sleep, 400
    MsgBox Proseguir?
    ;Sleep, 6000
}
else
{
    Sleep, 200
}

Send, {Up 2}
Sleep, 200
;Click, 109,243
Send, {Enter 2}
Send, {Home}
;+-----TIPO TRANSP------+
Send, %TipoTranspInput%
;+----------------------+
Sleep, 300
;Send, {Tab}
Click, 109,243
Sleep, 500
Send, {Enter 2}
Sleep, 500
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

Sleep, 500
Send, {Enter}
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

Sleep, 500

if (ValePedagioInput = "" and NotaPalletInput = "")
{
    goto Continue

}

Loop 8 ; Loop para repetir 8 vezes
{
    Send {Enter} ; Simula pressionamento da tecla Enter
    Sleep 100
}

Sleep, 700

if ValePedagioInput !=
{
    ;+------------OBERVACAO------------------+
    Send, %ValePedagioInput%
    ;+---------------------------------------+
    Sleep, 500

    ;Send, {Up 3}
    ;Send, {Home}
    ;Sleep 500
}

Sleep, 300

if NotaPalletInput !=
{
    Sleep, 500
    Send, {Up 3}
    Send, {Home}
    Sleep 500

    ;+-----NOTA DE PALLET-----------+
    Send, %NotaPalletInput%
    ;+------------------------------+

    Sleep 700
    Click, 437, 462
    Send, {Home}
    Sleep 500
    Send, %QtdePalletInput%
    Sleep 500
    Send, {Enter}
    Sleep 700
}

Continue:
Click, 980, 200
Sleep, 500
Click, 179, 246
Return

Limpar:
Gui, Submit, NoHide

GuiControl,, vCargaInput, % ""
GuiControl,, vRemessaInput, % ""
GuiControl,, vPedidoPbrInput, % ""
GuiControl,, vModalidadeFreteInput, % ""
GuiControl,, vTipoTranspInput, % ""
GuiControl,, vEspecieCargaInput, % ""
GuiControl,, vNaturezaCargaInput, % ""
GuiControl,, vTrocaNfInput, % ""
GuiControl,, vNotaPalletInput, % ""
GuiControl,, vValePedagioInput, % ""

ControlSetText, Edit1, , ahk_class AutoHotkeyGUI
ControlSetText, Edit2, , ahk_class AutoHotkeyGUI
ControlSetText, Edit3, , ahk_class AutoHotkeyGUI
ControlSetText, Edit4, , ahk_class AutoHotkeyGUI
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
