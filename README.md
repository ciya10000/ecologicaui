# ecologicaui
UI STATUS ECOLOGICA HUD
DISCORD: Ice Heart#1826

require: https://github.com/ESX-Org/esx_status
in esx status client/main.lua add

TriggerEvent('esx_ecologica:updateBasics', GetStatusData(true))
```lua
-- Marmota helps
RegisterNetEvent('esx_status:load')
AddEventHandler('esx_status:load', function(status)

	for i=1, #Status, 1 do
		for j=1, #status, 1 do
			if Status[i].name == status[j].name then
				Status[i].set(status[j].val)
			end
		end
	end

	Citizen.CreateThread(function()
	  while true do

	  	for i=1, #Status, 1 do
	  		Status[i].onTick()
	  	end

			SendNUIMessage({
				update = true,
				status = GetStatusData()
			})
	
		TriggerEvent('esx_ladderhud:updateBasics', GetStatusData(true))
	    Citizen.Wait(Config.TickTime)
	  end
	end)

end)
