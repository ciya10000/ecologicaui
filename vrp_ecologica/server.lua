local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
vRPhud = {}
Tunnel.bindInterface("vrp_ecologica",vRPhud)

RegisterServerEvent('info:Server')
AddEventHandler('info:Server',function()
  local source = source
  local user_id = vRP.getUserId(source)
  local fome = vRP.getHunger(user_id)
  local sede = vRP.getThirst(user_id)
  local emprego = vRP.getUserGroupByType(user_id, "job")
  
  TriggerClientEvent('info:Client', source, emprego, fome, sede) 
end)

