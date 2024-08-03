Gui, Add, Text,, Código Carga:
Gui, Add, Edit, vCargaInput w200 h16

Gui, Add, Text,, Remessa:
Gui, Add, Edit, vRemessaInput w200 h16

Gui, Add, Text,, Pedido PBR:
Gui, Add, Edit, vPedidoPbrInput w200 h16

Gui, Add, Text,, Modalidade Frete: CIF( c ), FOB( f )
;Gui, Add, Edit, vModalidadeFreteInput w200
Gui, Add, Radio, vModalidadeFreteInput1, CIF ; Checked
Gui, Add, Radio, vModalidadeFreteInput2, FOB

Gui, Add, Text,, Tipo Transp: TRF, CIR, MP, PLT, DV1
Gui, Add, Radio, vTipoTranspInput1, TRF
Gui, Add, Radio, vTipoTranspInput2, CIR
Gui, Add, Radio, vTipoTranspInput3, MP
Gui, Add, Radio, vTipoTranspInput4, PLT
Gui, Add, Radio, vTipoTranspInput5, DV1
Gui, Add, Radio, vTipoTranspInput6, T1

Gui, Add, Text,, Espécie Carga: CX, UNI, PALLET
Gui, Add, Edit, vEspecieCargaInput w200 h16

Gui, Add, Text,, Natureza Carga: É o produto:
Gui, Add, Edit, vNaturezaCargaInput w200 h16

Gui, Add, Text,, Troca nf:? Sim( s ), Não ( n )
;Gui, Add, Edit, vTrocaNfInput w200
Gui, Add, Radio, vTrocaNfInput1, Sim
Gui, Add, Radio, vTrocaNfInput2 Checked, Não

Gui, Add, Text,, Nota de Pallet:
Gui, Add, Edit, vNotaPalletInput w200 h16

Gui, Add, Text,, Quantidade Pallet:
Gui, Add, Edit, vQtdePalletInput w200 h16

Gui, Add, Text,, Observação:
Gui, Add, Edit, vObsInput1 w200 h16

Gui, Add, Text,, Quantas nfs de produto?:
Gui, Add, Edit, vQtdNfs w30 h16, 1

Gui, Add, Button, gEnviarDados, Enviar
Gui, Add, Button, gLimpar, Limpar

Gui, Show,, Entrada de Dados

Return

EnviarDados:
Gui, Submit, NoHide

;Run, C:\Users\Win10\Desktop\Nuvem Produção
;WinWaitActive, TOTVS Distribuição e logística (TOTVS) 02.9.0097

Send, !{Tab}
Sleep, 1000

; Verifica se a janela do TOTVS está aberta
IfWinExist, TOTVS Distribuição e Logística (TOTVS) 02.9.0097 - Ver: 20.3.2.4
{
    WinActivate
    WinWaitActive, TOTVS Distribuição e Logística (TOTVS) 02.9.0097 - Ver: 20.3.2.4
    ; Agora o programa está ativo, podemos continuar com o envio dos dados
    Sleep, 300

    if (QtdNfs = "" or QtdNfs < 1)
    {
        Msgbox, Preencha a quantidade de notas e clique em enviar novamente.
    }
    else
    {
        ;DADOS CTRC
        Click, 250, 206
        Sleep, 500
	MouseMove, 267, 289
	Sleep, 500
	Send, {WheelUp 12}
	Sleep, 300
	Send, {WheelUp 5}
	Sleep, 500
        Click, 109, 243
        Send, {Enter}
        Sleep, 500

        if ModalidadeFreteInput1
        {
            Sleep, 500
            Send, c
        }
        else
        {
            Sleep, 500
            Send, f
        }

        Sleep, 500
        MsgBox, Alterar filial ok.
        Sleep, 500

        if TipoTranspInput5
        {
            Sleep, 900
        }
        else
        {
            Sleep, 300
        }
    /*
        Click, 109,243
        Sleep, 300
        Send, {Enter 2}
        Sleep, 300
        Send, {Home}
    */
        Sleep, 300

        Send, {Home}

        if TipoTranspInput1
        {
            Send, TRF
        }
        else if TipoTranspInput2
        {
            Send, CIR
        }
        else if TipoTranspInput3
        {
            Send, MP
        }
        else if TipoTranspInput4
        {
            Send, PLT
        }
        else if TipoTranspInput5
        {
            Send, DV1
        }
        else if TipoTranspInput6
        {
            Send, T1
        }

        ; Pegar xml das nfs restantes
        Sleep 800
        ;Click, 38, 585
	Click, 629,587
        Sleep 800
	Send, {Left 30}

        Loop %QtdNfs%
        {
            Sleep, 500
            Send, {Right 12}
            Sleep, 500
            Send, {Enter}
            Send, {Tab}
            Sleep, 900
            Send, s
            Sleep, 500
            MsgBox Proseguir Cod carga?
            Sleep, 900

            ;COD CARGA
            Send, {Left 30}
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

            if (A_Index < QtdNfs)
            {
                ;Sleep, 500
                ;Click, 38, 585
                Sleep, 500
                MsgBox, Prosseguir para incluir mais notas?
                Sleep, 200
                Send, {Down}
                Sleep, 500
                ;MsgBox, Prosseguir?
                ;Sleep, 500
            }
        }
	
        Sleep, 200
        Send, {Up}
        Sleep, 400
	MsgBox, Prosseguir?

        if CargaInput != 4575640309
        {
            Sleep, 400
            MsgBox Proseguir após selecionar tarifa?
            Sleep, 700
        }
        else
        {
            Sleep, 200
        }

        ;+-----TIPO TRANSP------+
        ;Send, %TipoTranspInput%
        ;+----------------------+
        Sleep, 300
        ;Send, {Tab}****
	Send, {WheelUp 12}
	Sleep, 300
	Send, {WheelUp 5}
	Sleep, 300
        Click, 109, 243
        Sleep, 500
        Send, {Enter 2}
        Sleep, 500
        Loop 14 ; Loop para repetir 14 vezes
        {
            Send {Enter} ; Simula pressionamento da tecla Enter
            Sleep 100 ; Espera x milissegundos
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

        if (ObsInput1 = "" and NotaPalletInput = "") ;and QtdNfs < 2)
        {
            goto Continue

        }

        Loop 7 ; Loop para repetir 7 vezes
        {
            Send {Enter} ; Simula pressionamento da tecla Enter
            Sleep 100
        }

        Sleep, 700

        if ObsInput1 !=
        {
            ;+------------OBERVACAO------------------+
            Send, %ObsInput1%
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
            Send, {Up 2}
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
        Sleep, 500

        ^Esc::
        goto Fim
    }
}
else
{
    MsgBox, A janela do TOTVS não está aberta. Não é possível prosseguir.
    return
}

Fim:
Return

::e*::
ExitApp
Return

/*
^Esc::
Reload
Return
*/

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
GuiControl,, vQtdePalletInput, % ""
GuiControl,, vObsInput1, % ""
GuiControl,, vQtdNfs, % ""

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
ControlSetText, Edit12, , ahk_class AutoHotkeyGUI

Return

GuiClose:
ExitApp