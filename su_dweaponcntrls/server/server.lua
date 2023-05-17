local resource = "su_dweaponcntrls"
AddEventHandler("onResourceStart", function(resource)
    if (GetCurrentResourceName() ~= resource) then
        return
    end

    local currentVersion = "1.0" -- aktuálna verzia vášho scriptu
    PerformHttpRequest("https://raw.githubusercontent.com/LukyNo1/Disable-Weapon-Controlls/main/version.txt", function(errorCode, resultData, resultHeaders)
        if (string.find(resultData, currentVersion) == nil) then
            print("^1Update! New version is avaible on your KeyMaster!^0")
        end
    end)
end)



Citizen.CreateThread(function()
    if GetCurrentResourceName() ~= "su_dweaponcntrls" then
      print("^1ERROR: Name of the script was changed! Please rename it as default to avoid bugs!")
    end
end)