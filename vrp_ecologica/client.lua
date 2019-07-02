local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
HUDserver = Tunnel.getInterface("vrp_ecologica")
vRPhud = {}
Tunnel.bindInterface("vrp_ecologica",vRPhud)

RegisterNetEvent('info:Client')
AddEventHandler('info:Client',function(emprego, fome, sede)
	local hour = GetClockHours()
	local minutes = GetClockMinutes()
    SendNUIMessage({
		show = 		IsPauseMenuActive(),
		fome = 		math.ceil(fome),
		sede = 		math.ceil(sede),
		hora = 		hour.. ":" ..minutes,	
		emprego = 	emprego,
	})	
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
		TriggerServerEvent('info:Server')
    end
end)
