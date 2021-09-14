ESX = nil




Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


-- Prix vente marijuana NPC
local WeedMin = 30
local WeedMax = 50


-- Vente marijuana
RegisterServerEvent("NPCVente:Weed")
AddEventHandler("NPCVente:Weed", function(num)
    local xPlayer = ESX.GetPlayerFromId(source)
    local nombre = xPlayer.getInventoryItem("marijuana")
    local count = 1
    if nombre.count >= num then
        local PrixWeed = math.random(WeedMin,WeedMax)
        local PrixWeedFinal = num * PrixWeed
        xPlayer.removeInventoryItem("marijuana", num)
        --xPlayer.addMoney(PrixWeedFinal)
        xPlayer.addAccountMoney('black_money', PrixWeedFinal)
        TriggerClientEvent("NPCVente:Notification", source, "Activité illégal", "~g~Vente de marijuana", "Ouais je t'en prends ~g~"..num.."~w~\nArgent obtenu: ~g~"..PrixWeedFinal, "CHAR_LESTER", 8)
    else
        TriggerClientEvent("NPCVente:Notification", source, "Activité illégal", "~g~Vente de marijuana", "Walid le boss : Ouais cimer je t'en prends ... Attend mais t'essaye de me vendre quoi la ? T'as rien frère ? Casse toi !", "CHAR_LESTER", 8)
    end
end)

-- Prix vente meth NPC
local methMin = 80
local methMax = 100


-- Vente meth
RegisterServerEvent("NPCVente:meth")
AddEventHandler("NPCVente:meth", function(num)
    local xPlayer = ESX.GetPlayerFromId(source)
    local nombre = xPlayer.getInventoryItem("meth")
    local count = 1
    if nombre.count >= num then
        local Prixmeth = math.random(methMin,methMax)
        local PrixmethFinal = num * Prixmeth
        xPlayer.removeInventoryItem("meth", num)
        --xPlayer.addMoney(PrixmethFinal)
        xPlayer.addAccountMoney('black_money', PrixmethFinal)
        TriggerClientEvent("NPCVente:Notification", source, "Activité illégal", "~g~Vente gr de meth", "Ouais je t'en prends ~g~"..num.."~w~\nArgent obtenu: ~g~"..PrixmethFinal, "CHAR_LESTER", 8)
    else
        TriggerClientEvent("NPCVente:Notification", source, "Activité illégal", "~g~Vente gr de meth", "Ouais cimer je t'en prends ... Attend mais t'essaye de me vendre quoi la ? T'as rien frère ? Casse toi !", "CHAR_LESTER", 8)
    end
end)



-- Prix vente coke NPC
local cokeMin = 120
local cokeMax = 140


-- Vente coke
RegisterServerEvent("NPCVente:coke")
AddEventHandler("NPCVente:coke", function(num)
    local xPlayer = ESX.GetPlayerFromId(source)
    local nombre = xPlayer.getInventoryItem("cocaine")
    local count = 1
    if nombre.count >= num then
        local Prixcoke = math.random(cokeMin,cokeMax)
        local PrixcokeFinal = num * Prixcoke
        xPlayer.removeInventoryItem("cocaine", num)
        --xPlayer.addMoney(PrixcokeFinal)
        xPlayer.addAccountMoney('black_money', PrixcokeFinal)
        TriggerClientEvent("NPCVente:Notification", source, "Activité illégal", "~g~Vente de coke", "Ouais je t'en prends ~g~"..num.."~w~\nArgent obtenu: ~g~"..PrixcokeFinal, "CHAR_LESTER", 8)
    else
        TriggerClientEvent("NPCVente:Notification", source, "Activité illégal", "~g~Vente de coke", "Ouais cimer je t'en prends ... Attend mais t'essaye de me vendre quoi la ? T'as rien frère ? Casse toi !", "CHAR_LESTER", 8)
    end
end)

-- Appel LSPD 



RegisterServerEvent("NPCVente:AppelLSPD")
AddEventHandler("NPCVente:AppelLSPD", function(coords)
    local xPlayers	= ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' then
            TriggerClientEvent('NPCVente:AffichageAppel', xPlayers[i], coords)
        end
    end
end)