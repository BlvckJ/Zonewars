<#
====================================================================================================
THIS CODE IS MAPACADEMY PROPERTY. RESPECT THE RIGHTS OF THIS CODE.
SHARING THIS CODE COULD COME WITH A LEGAL CONSEQUENCES.                                                                                                 
CONTACT MAPPCO ON DISCORD
====================================================================================================
#>
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /Fortnite.com/Characters }


HoldingCardInvisible := class(creative_device):
    @editable GameStartDevice : GameStart = GameStart{}
    @editable HoldingCardClassNumber : int = 100
    @editable HoldingCardConditional : conditional_button_device = conditional_button_device{}

    OnBegin<override>()<suspends>:void=
        spawn:
            InvisibilityPlayer()
    InvisibilityPlayer()<suspends> : void =
        loop:
            for (Player : GetPlayspace().GetPlayers()):
                if(FC := Player.GetFortCharacter[], Agent := FC.GetAgent[]):
                    if( GameStartDevice.EachPlayerMap[Agent].ClassNum = HoldingCardClassNumber):
                        if(HoldingCardConditional.IsHoldingItem[Agent]):
                            FC.Hide()
                        else:
                            FC.Show()
                        Sleep(0.1)
            Sleep(0.1)


    
            


    