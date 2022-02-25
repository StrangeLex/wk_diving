ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('divingstuff', function(source)
    TriggerClientEvent('wkdiving:toggle', source)
end)


Citizen.CreateThread(function()
	print("^7[^5WK Developpement^7] ^2WK Diving Initialiser")
	print("^6Discord^7: ^2https://discord.gg/wkdev")
end)