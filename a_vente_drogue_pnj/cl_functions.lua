function NotificationNpc(title, subject, msg, icon, iconType)

	AddTextEntry('showAdDrogue', msg)

	SetNotificationTextEntry('showAdDrogue')

	SetNotificationMessage(icon, icon, false, iconType, title, subject)

	DrawNotification(false, false)

end



RegisterNetEvent("NPCVente:Notification")

AddEventHandler("NPCVente:Notification", function(title, subject, msg, icon, iconType)

	AddTextEntry('showAdDrogue', msg)

	SetNotificationTextEntry('showAdDrogue')

	SetNotificationMessage(icon, icon, false, iconType, title, subject)

	DrawNotification(false, false)

end)



NearestePed = nil

local DejaVenduPed = {}

Citizen.CreateThread(function()

    while ESX == nil do

        Wait(100)

    end

    while true do

        local zone = GetZoneDevant()

        local ped = ESX.Game.GetClosestPed(zone, {})

        local model = GetEntityModel(ped)

        if ped ~= GetPlayerPed(-1) and not IsPedAPlayer(ped) and not IsPedInAnyVehicle(ped, 1) and not IsPedDeadOrDying(ped, 1) then

            if model ~= GetHashKey("s_f_y_cop_01") 

			and model ~= GetHashKey("S_M_Y_Casino_01")

			and model ~= GetHashKey("S_F_Y_Casino_01")

			and model ~= GetHashKey("a_f_y_femaleagent") 

			and model ~= GetHashKey("s_m_m_dockwork_01")

			and model ~= GetHashKey("s_m_y_dockwork_01")

			and model ~= GetHashKey("s_m_y_dealer_01") 

			and model ~= GetHashKey("s_m_y_robber_01")

			and model ~= GetHashKey("mp_f_boatstaff_01") 

			and model ~= GetHashKey("s_m_y_construct_01")

			and model ~= GetHashKey("s_m_m_gardener_01")

			and model ~= GetHashKey("a_f_y_business_02")

			and model ~= GetHashKey("s_m_y_cop_01")

			and model ~= GetHashKey("s_m_m_security_01")

			and model ~= GetHashKey("a_c_boar")

			and model ~= GetHashKey("a_c_deer")

			and model ~= GetHashKey("a_c_dolphin")

			and model ~= GetHashKey("a_c_fish")

			and model ~= GetHashKey("a_c_hen") 

			and model ~= GetHashKey("a_c_humpback")

			and model ~= GetHashKey("a_c_husky")

			and model ~= GetHashKey("a_c_killerwhale")

			and model ~= GetHashKey("a_c_mtlion")

			and model ~= GetHashKey("a_c_pig")

			and model ~= GetHashKey("a_c_poodle") 

			and model ~= GetHashKey("a_c_pug")

			and model ~= GetHashKey("a_c_rabbit_01")

			and model ~= GetHashKey("a_c_rat") 

			and model ~= GetHashKey("a_c_retriever")

			and model ~= GetHashKey("a_c_rhesus")

			and model ~= GetHashKey("a_c_rottweiler") 

			and model ~= GetHashKey("a_c_seagull") 

			and model ~= GetHashKey("a_c_sharkhammer") 

			and model ~= GetHashKey("a_c_sharktiger")

			and model ~= GetHashKey("a_c_shepherd")

			and model ~= GetHashKey("a_c_stingray") 

			and model ~= GetHashKey("a_c_pigeon") 

			and model ~= GetHashKey("a_c_westy")

			and model ~= GetHashKey("a_c_cat_01")

			and model ~= GetHashKey("s_m_m_pilot_02")

			and model ~= GetHashKey("a_c_chickenhawk") 

			and model ~= GetHashKey("a_c_chimp")

			and model ~= GetHashKey("a_c_chop")

			and model ~= GetHashKey("a_c_cormorant")

			and model ~= GetHashKey("a_c_cow")

			and model ~= GetHashKey("a_c_coyote")

			and model ~= GetHashKey("a_c_crow") 

			and model ~= GetHashKey("a_c_rat")

			and model ~= GetHashKey("mp_m_shopkeep_01") 

			and model ~= GetHashKey("mp_m_weapexp_01") 

			and model ~= GetHashKey("csb_burgerdrug")

			and model ~= GetHashKey("ig_drfriedlander")

			and model ~= GetHashKey("s_m_y_dockwork_01") 

			and model ~= GetHashKey("s_m_y_ammucity_01") 
			
			and model ~= GetHashKey("u_m_y_hippie_01") 

			and model ~= GetHashKey("s_m_m_doctor_01")

			and model ~= GetHashKey("ig_g")

            and model ~= GetHashKey("ig_dale")
            
            and model ~= GetHashKey("s_m_m_autoshop_02")

            and model ~= GetHashKey("a_m_m_tramp_01")

			then -- Blacklist des modèles ici, flème de faire une liste

                local coords = GetEntityCoords(ped, true)

                local distance = ESX.Math.Round(GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1), true), coords, true), 0)

                if distance <= 10 then

                    NearestePed = ped

                else

                    NearestePed = nil

                end

            end

        end

        Citizen.Wait(1000)

    end

end)



Citizen.CreateThread(function()

    while true do

        local count = 0

        local attente = 3000

        for k,v in ipairs(DejaVenduPed) do

            local NetPed = NetworkGetEntityFromNetworkId(v)

            if DoesEntityExist(NetPed) then 

                count = count + 1

                attente = 1000

            end

        end

        if count == 0 then

            DejaVenduPed = {}

            attente = 10000

        end  

        Citizen.Wait(attente)

    end

end)



Citizen.CreateThread(function()

    while ESX == nil do

        Wait(100)

    end

    while true do

        for k,v in ipairs(DejaVenduPed) do

            local NetPed = NetworkGetEntityFromNetworkId(v)

            if NetPed == NearestePed then 

                NearestePed = nil

            end

        end

        if NearestePed ~= nil then

            local ped = NearestePed

            local coords = GetEntityCoords(ped, true)

            local distance = ESX.Math.Round(GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1), true), coords, true), 0)

            --print(distance)

            if distance <= 5.0 then

                if distance >= 3.0 then

                    DrawMarker(32, coords.x, coords.y, coords.z+1.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 0, 0, 170, 0, 0, 2, 1, nil, nil, 0)

                else

                    DrawMarker(32, coords.x, coords.y, coords.z+1.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 170, 0, 0, 2, 1, nil, nil, 0)

                    --DrawText3D(coords.x, coords.y, coords.z, "Appuyer sur [~b~E~w~] pour parler avec la personne")

                    ShowFloatingHelp("HELPTEXT621", coords)

                    AddTextEntry("HELPTEXT621", "Appuyer sur [~b~E~w~] pour parler avec la personne")

                    if IsControlJustReleased(1, 46) then

                        local PedNetId = NetworkGetNetworkIdFromEntity(ped)

                        OpenNpcMenu(PedNetId)

                    end

                end

            else

                NearestePed = nil
            end

        end

        Citizen.Wait(1)

    end

end)





function GetZoneDevant()

    local backwardPosition = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 2.0, 0.0)

	return backwardPosition

end







function DrawText3D(x,y,z, text)

	local onScreen,_x,_y=World3dToScreen2d(x,y,z)



	if onScreen then

		SetTextScale(0.25, 0.25)

		SetTextFont(4)

		SetTextProportional(1)

		SetTextColour(255, 255, 255, 215)

		SetTextEntry("STRING")

		SetTextCentre(1)

		AddTextComponentString(text)

		DrawText(_x,_y)

		local factor = (string.len(text)) / 350

		DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)

	end

end







-- Vente de cannabis

  

function VenteWeed(npc)

    local ped = NetworkGetEntityFromNetworkId(npc)

    FreezeEntityPosition(ped, true)

    local random = math.random(1,10)



    if random <= 8 then

        local weedBuy = math.random(1,40)

        local heading = GetEntityHeading(ped)

        local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.14, 0.0)



        

        SetEntityHeading(PlayerPedId(), heading - 180.1)

        SetEntityCoordsNoOffset(PlayerPedId(), coords.x, coords.y, coords.z, 0)

        Wait(300)

        while not HasAnimDictLoaded("mp_ped_interaction") do

            RequestAnimDict("mp_ped_interaction")

            Citizen.Wait(1)

        end

        

        TriggerServerEvent("NPCVente:Weed", weedBuy)

        TaskPlayAnim(GetPlayerPed(-1), "mp_ped_interaction", "hugs_guy_a", 2.0, 2.0, -1, 0, 0, false, false, false)

        TaskPlayAnim(ped, "mp_ped_interaction", "hugs_guy_a", 2.0, 2.0, -1, 0, 0, false, false, false)

        Wait(4500)

        FreezeEntityPosition(ped, false)

    

        local NetId = NetworkGetNetworkIdFromEntity(ped)

        table.insert(DejaVenduPed, NetId)

        NearestePed = nil

    else

        FreezeEntityPosition(ped, false)

        NotificationNpc("Activité illégal", "~g~Vente de weed", "Ouais ouais ... Nan je suis pas dans ça moi, laisse moi !", "CHAR_LESTER", 8)

        TaskCombatPed(ped, GetPlayerPed(-1), 0, 8)



        local coords = GetEntityCoords(GetPlayerPed(-1), true)

        TriggerServerEvent("NPCVente:AppelLSPD", coords)



        local NetId = NetworkGetNetworkIdFromEntity(ped)

        table.insert(DejaVenduPed, NetId)

        NearestePed = nil

    end

end



---- Vente de meth



function Ventemeth(npc)

    local ped = NetworkGetEntityFromNetworkId(npc)

    FreezeEntityPosition(ped, true)

    local random = math.random(1,25)



    if random <= 8 then

        local methBuy = math.random(1,15)

        local heading = GetEntityHeading(ped)

        local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.14, 0.0)



        

        SetEntityHeading(PlayerPedId(), heading - 180.1)

        SetEntityCoordsNoOffset(PlayerPedId(), coords.x, coords.y, coords.z, 0)

        Wait(300)

        while not HasAnimDictLoaded("mp_ped_interaction") do

            RequestAnimDict("mp_ped_interaction")

            Citizen.Wait(1)

        end

        

        TriggerServerEvent("NPCVente:meth", methBuy)

        TaskPlayAnim(GetPlayerPed(-1), "mp_ped_interaction", "hugs_guy_a", 2.0, 2.0, -1, 0, 0, false, false, false)

        TaskPlayAnim(ped, "mp_ped_interaction", "hugs_guy_a", 2.0, 2.0, -1, 0, 0, false, false, false)

        Wait(4500)

        FreezeEntityPosition(ped, false)

    

        local NetId = NetworkGetNetworkIdFromEntity(ped)

        table.insert(DejaVenduPed, NetId)

        NearestePed = nil

    else

        FreezeEntityPosition(ped, false)

        NotificationNpc("Activité illégal", "~g~Vente de meth", "Ouais ouais ... Nan j'prend pas sa, laisse moi !", "CHAR_LESTER", 8)

        TaskCombatPed(ped, GetPlayerPed(-1), 0, 8)



        local coords = GetEntityCoords(GetPlayerPed(-1), true)

        TriggerServerEvent("NPCVente:AppelLSPD", coords)



        local NetId = NetworkGetNetworkIdFromEntity(ped)

        table.insert(DejaVenduPed, NetId)

        NearestePed = nil

    end

end





---- Vente de coke



function VenteCoke(npc)

    local ped = NetworkGetEntityFromNetworkId(npc)

    FreezeEntityPosition(ped, true)

    local random = math.random(1,20)



    if random <= 6 then

        local cokeBuy = math.random(1,5)

        local heading = GetEntityHeading(ped)

        local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.14, 0.0)



        

        SetEntityHeading(PlayerPedId(), heading - 180.1)

        SetEntityCoordsNoOffset(PlayerPedId(), coords.x, coords.y, coords.z, 0)

        Wait(300)

        while not HasAnimDictLoaded("mp_ped_interaction") do

            RequestAnimDict("mp_ped_interaction")

            Citizen.Wait(1)

        end

        

        TriggerServerEvent("NPCVente:coke", cokeBuy)

        TaskPlayAnim(GetPlayerPed(-1), "mp_ped_interaction", "hugs_guy_a", 2.0, 2.0, -1, 0, 0, false, false, false)

        TaskPlayAnim(ped, "mp_ped_interaction", "hugs_guy_a", 2.0, 2.0, -1, 0, 0, false, false, false)

        Wait(4500)

        FreezeEntityPosition(ped, false)



        local NetId = NetworkGetNetworkIdFromEntity(ped)

        table.insert(DejaVenduPed, NetId)

        NearestePed = nil

    else

        FreezeEntityPosition(ped, false)

        NotificationNpc("Activité illégal", "~g~Vente de coke", "Ouais ouais ... Nan je suis pas dans ça moi, laisse moi !", "CHAR_LESTER", 8)

        TaskCombatPed(ped, GetPlayerPed(-1), 0, 8)

        local coords = GetEntityCoords(GetPlayerPed(-1), true)

        TriggerServerEvent("NPCVente:AppelLSPD", coords)



        local NetId = NetworkGetNetworkIdFromEntity(ped)

        table.insert(DejaVenduPed, NetId)

        NearestePed = nil

    end

end

-- Appel LSPD





RegisterNetEvent("NPCVente:AffichageAppel")

AddEventHandler("NPCVente:AffichageAppel", function(coords)

    PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)

    --PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)

    PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)

    NotificationNpc("LSPD CENTRAL", "~g~Appel d'un citoyen", "~g~Central:~w~ Bonjour, quel-est votre problème ?\n~g~Citoyen~w~: Quelqu'un à essayer de me vendre des stupéfiants !\n~g~Central:~w~ Très bien, rester calme une équipe est en route.", "CHAR_CHAT_CALL", 8)



    local blip = AddBlipForCoord(coords)

    SetBlipSprite(blip, 51)

    SetBlipScale(blip, 0.85)

    SetBlipColour(blip, 47)

    SetBlipShrink(blip, true)



    local blipZone = AddBlipForCoord(coords)

    SetBlipSprite(blipZone, 161)

    SetBlipScale(blipZone, 3.0)

    SetBlipColour(blipZone, 1)

    SetBlipShrink(blipZone, true)





    Wait(1000)

    PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)

    PlaySoundFrontend(-1, "FocusOut", "HintCamSounds", 1)



    Citizen.Wait(60*1000)

    RemoveBlip(blip)

    RemoveBlip(blipZone)

end)



function ShowHelp(text, n)

    BeginTextCommandDisplayHelp(text)

    EndTextCommandDisplayHelp(n or 0, false, true, -1)

end



function ShowFloatingHelp(text, pos)

    SetFloatingHelpTextWorldPosition(1, pos)

    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)

    ShowHelp(text, 2)

end

