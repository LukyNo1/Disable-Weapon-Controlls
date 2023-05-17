-- Made by LukyNo, if you have any suggestions or bugs, please contact me on my GitHub or Discord

local disableWeaponControls = false

RegisterCommand(Config.Command, function()
    disableWeaponControls = not disableWeaponControls
    if disableWeaponControls then
		if Config.Notification == 'esx' then
            ESX.ShowNotification('Controls are turned off!')
		elseif Config.Notification == 'okok' then
        	exports['okokNotify']:Alert('Weapon Controls', 'Controls are turned off!', 5000, 'success', true)
		elseif Config.Notification == 'qbcore' then
			QBCore.Functions.Notify('Controls are turned off!', 'success')
		elseif Config.Notification == 'message' then
			TriggerEvent("chat:addMessage", {
				args = {"^1WeaponControls: ", "^2Controls are turned off!"}
			})
		elseif Config.Notification == 'custom' then
			-- Your Notify Here
		end
    else
        if Config.Notification == 'esx' then
            ESX.ShowNotification('Controls are turned on!')
		elseif Config.Notification == 'okok' then
        	exports['okokNotify']:Alert('Weapon Controls', 'Controls are turned on!', 5000, 'success', true)
		elseif Config.Notification == 'qbcore' then
			QBCore.Functions.Notify('Controls are turned on!', 'success')
		elseif Config.Notification == 'message' then
			TriggerEvent("chat:addMessage", {
				args = {"^1WeaponControls: ", "^2Controls are turned on!"}
			})
		elseif Config.Notification == 'custom' then
			-- Your Notify Here
		end
    end
end, false)

TriggerEvent('chat:addSuggestion', Config.Command, Config.Description, {})

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if disableWeaponControls then
            if (not IsPedArmed(PlayerPedId(), 1)) and (GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey('weapon_unarmed')) then
                DisableControlAction(0, 140, true)
                DisableControlAction(0, 141, true)
                DisableControlAction(0, 142, true)
            end
        end
    end
end)

Citizen.CreateThread(function()
    if GetCurrentResourceName() ~= "su_dweaponcntrls" then
      print("^1ERROR: Name of the script was changed! Please rename it as default to avoid bugs!")
    end
end)
