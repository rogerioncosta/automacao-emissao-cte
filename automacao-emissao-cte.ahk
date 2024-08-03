Gui, Add, Text,, Código Carga:
Gui, Add, Edit, vCargaInput w200

Gui, Add, Text,, Remessa:
Gui, Add, Edit, vRemessaInput w200

Gui, Add, Text,, Pedido PBR:
Gui, Add, Edit, vPedidoPbrInput w200

Gui, Add, Text,, Modalidade Frete: CIF( c ), FOB( f )
;Gui, Add, Edit, vModalidadeFreteInput w200
Gui, Add, Radio, vModalidadeFreteInput1, CIF ; Checked
Gui, Add, Radio, vModalidadeFreteInput2, FOB

Gui, Add, Text,, Tipo Transp: TRF, CIR, MP, PLT, DV1, T1
Gui, Add, Radio, vTipoTranspInput1, TRF
Gui, Add, Radio, vTipoTranspInput2, CIR
Gui, Add, Radio, vTipoTranspInput3, MP
Gui, Add, Radio, vTipoTranspInput4, PLT
Gui, Add, Radio, vTipoTranspInput5, DV1
Gui, Add, Radio, vTipoTranspInput6, T1
;Gui, Add, Edit, vTipoTranspInput w200

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

Gui, Add, Text,, OBS1:
Gui, Add, Edit, vObsInput1 w200

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

    ; Seu código para enviar dados continua aqui...

    Click, 932, 648 ; EXTRAS
    Sleep, 1000
    Click, 806, 532 ; CTE
    Sleep, 800
    MsgBox, Prosseguir Incluir?
    Sleep, 900
    Send, i ; INCLUIR
    ;Sleep, 4000
    MsgBox, Prosseguir Normal?
    Sleep, 900
    Send, n ; NORMAL
    Sleep, 800
    MsgBox, Prosseguir para selecionar xml?
    Sleep, 900

    Click, 38, 585
    Send, {Right 12}

    ; Pegar xml
    Sleep, 500
    Send, {Enter}
    Send, {Tab}
    Sleep, 900
    Send, s
    Sleep, 900
    MsgBox Proseguir Cod carga?
    Sleep, 900
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

    if CargaInput != 4575640309
    {
        Sleep, 400
        MsgBox Proseguir após selecionar tarifa?
        Sleep, 900
    }
    else
    {
        Sleep, 200
    }

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

    ;+-----TIPO TRANSP------+
    ;Send, %TipoTranspInput%
    ;+----------------------+
    Sleep, 300
    ;Send, {Tab}
    Click, 109,243
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

    if (ObsInput1 = "" and NotaPalletInput = "")
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

    MsgBox, Prosseguir para Salvar?
    Sleep, 900
    Click, 1328, 155 ; SALVAR
    ; BAIXAR PENDÊNCIA SALVAR E DAR OK NA TARIFA MANUALMENTE
    Sleep, 500
    MsgBox, Prosseguir para Refresh na tela?
    Sleep, 900
    ; AUTORIZAR CTE E MDF
    Click, 537, 646 ; REFRESH
    Click, 537, 646
    Sleep, 3000
    Send, {End}
    Sleep, 1000
    ; CLICA 2 VEZES MANUALMENTE
    MsgBox, Prosseguir Transmitir?
    Sleep, 900
    Click, 361, 643 ; TRANSMITIR
    Click, 361, 643
    Sleep, 1000
    MsgBox, Prosseguir Dacte?
    Sleep, 1000
    Click, 205, 641 ; DACTE
    Click, 205, 641
    Sleep, 1000
    MsgBox, Prosseguir selecionar ambos?
    Sleep, 900
    ; SELECIONA NR. CTE MANUALMENTE
    Send, a
    ;Sleep, 10000
    Sleep, 500
    MsgBox, Prosseguir cancelar check-list?
    Sleep, 900
    Send, c

    ; GERAR MDF
    Sleep, 500
    MsgBox, Prosseguir após selecionar mdf?
    Sleep, 900
    ; TELA MDF
    Click, 437, 572 ; CONFIRMAR
    Sleep, 3000
    Click, 763, 529 ; OK
    Sleep, 12000
    Click, 1230, 701 ; REFRESH
    Click, 1230, 701 ; REFRESH
    Sleep, 500
    MsgBox, Prosseguir Entrar?
    Sleep, 900
    ; CLICK REFRESH
    Send, {Tab 2}
    Sleep, 300
    Send, {Enter}

    ; IMPRIMIR
    Sleep, 900
    MsgBox, Prosseguir impressão ok?
    Sleep, 900
    Click, 794, 690 ; CLICA OK
    ; SELECIONA NR. MDF MANUALMENTE
    ; CLICA ENTENDIDO
    ; CLICA FECHAR.
    Sleep, 900

    MsgBox, Prosseguir sim?
    Sleep, 900
    Send, s
    Sleep, 1000
    MsgBox, Prosseguir imprimir pdf?
    Sleep, 900
    Send ^{p}
    Sleep, 2000
    Send, {Tab 3}
    Sleep, 500
    Send, 3

    Sleep, 300
    MsgBox, Prosseguir carta frete?
    Sleep, 1000

    if CargaInput != 4575640309
    {
        MsgBox, Imprimir Carta frete
        Sleep, 900
        Click, 24,143 ; ÍCONE IMPRESSORA
        Send, {Tab 2}
        Sleep, 1000
        Send, {Enter 2}
    }
}
else
{
    MsgBox, A janela do TOTVS não está aberta. Não é possível prosseguir.
    Return
}

Return

::ex*::
ExitApp
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
GuiControl,, vQtdePalletInput, % ""
GuiControl,, vObsInput1, % ""

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