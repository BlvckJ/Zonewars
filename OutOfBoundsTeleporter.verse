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
using { /UnrealEngine.com/Temporary/SpatialMath }



outofbounds := class(creative_device):
        @editable mutatorzone1 : mutator_zone_device = mutator_zone_device{}     #mutator zone for max height
        @editable mutatorzone2 : mutator_zone_device = mutator_zone_device{}     #mutator zone for water/off of platform
        @editable TP : teleporter_device = teleporter_device{}           #teleport device that players will be teleported to when out of bounds
        @editable Explosives : []explosive_device = array{}            #explosive devices used to explode all builds when players get teleported
    
        # Runs when the device is started in a running game
        OnBegin<override>()<suspends>:void=
            mutatorzone1.AgentEntersEvent.Subscribe(TPAgent)
            mutatorzone2.AgentEntersEvent.Subscribe(TPAgent)
        TPAgent(Agent:agent): void =      #activates when players go into either mutator zone
            TP.Teleport(Agent)    #teleports the player to the teleporter
            for (explosive : Explosives):    #explodes all builds
                explosive.Explode(Agent)
                explosive.Reset()