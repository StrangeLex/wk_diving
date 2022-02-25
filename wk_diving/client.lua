Citizen.CreateThread(function()
    SendNUIMessage({h = "false"})
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
    while true do
        Citizen.Wait(100)
        Mask()
    end
end)

local hud = "false"
local diving = 0

RegisterNetEvent('wkdiving:toggle')
AddEventHandler('wkdiving:toggle', function()
    if (diving==0) then
        diving = 1
        SetEnableScuba(GetPlayerPed(-1),true)
        SetPedMaxTimeUnderwater(GetPlayerPed(-1), 400.00)
        TenueDiving()
    else
        diving = 0
        SetEnableScuba(GetPlayerPed(-1),false)
        SetPedMaxTimeUnderwater(GetPlayerPed(-1), 100.00)

        TenueCivil()
    end
end)


function Mask()
    SendNUIMessage({h = hud})
end

function TenueCivil()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        local isMale = skin.sex == 0
        TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
                TriggerEvent('esx:restoreLoadout')
            end)
        end)
    end)
end



function TenueDiving()
    local model = GetEntityModel(GetPlayerPed(-1))
    TriggerEvent('skinchanger:getSkin', function(skin)
        if model == GetHashKey("mp_m_freemode_01") then
            clothesSkin = {
                ['tshirt_1'] = 125, ['tshirt_2'] = 0,
                ['torso_1'] = 330, ['torso_2'] = 13,
                ['arms'] = 100,
                ['pants_1'] = 128, ['pants_2'] = 13,
                ['shoes_1'] = 82, ['shoes_2'] = 0,
                ['bags_1'] = 0, ['bags_2'] = 0,
                ['mask_1'] = -1, ['mask_2'] = 0,
                ['glasses_1'] = 26, ['glasses_2'] = 1,
                ['bproof_1'] = 0,
                ['chain_1'] = 0,
                ['helmet_1'] = -1, ['helmet_2'] = 5,
            }
        end
        if model == GetHashKey("mp_f_freemode_01") then
            clothesSkin = {
                ['tshirt_1'] = 125, ['tshirt_2'] = 0,
                ['torso_1'] = 330, ['torso_2'] = 13,
                ['arms'] = 100,
                ['pants_1'] = 128, ['pants_2'] = 13,
                ['shoes_1'] = 82, ['shoes_2'] = 0,
                ['bags_1'] = 0, ['bags_2'] = 0,
                ['mask_1'] = -1, ['mask_2'] = 0,
                ['glasses_1'] = 26, ['glasses_2'] = 1,
                ['bproof_1'] = 0,
                ['chain_1'] = 0,
                ['helmet_1'] = -1, ['helmet_2'] = 5,
            }
        end
        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
    end)
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if (diving==1) then
            if IsPedSwimmingUnderWater(GetPlayerPed(-1)) then
                hud = "true"
            else
                hud = "false"
            end
        else
            hud = "false"
        end
    end

end)