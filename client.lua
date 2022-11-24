Citizen.CreateThread(function()
    local lastPedAimed

    while true do 
        Citizen.Await(1000) -- set the cooldown of the logs here in msec!
        local letSleep = true 
        local playerPed = PlayerPedId()
        if DoesEntityExist(playerPed) then
            if isPedArmed(playerPed, 4) then
                letSleep = false

                local isAming, targetPed = GetEntityPlayerIsFreeAimingAt(PlayerId(-1))
                if isAming and targetPed ~= lastPedAimed then
                    lastPedAimed = targetPed

                    if DoesEntityExist(targetPed) and IsEntityAPed(targetPed) then
                        if IsPedAPlayer(targetPed) then
                            local targetId = NetworkGetPlayerIndexFromPed(targetPed)

                            if targetId then 
                                local pedId = GetPlayerServerId(targetId)
                                
                                if pedId and (pedId > 0) then 
                                    TriggerServerEvent('beansaimlogs:log', pedId)

                                end
                            end
                        end
                    end
                end
            end
        end

        if letSleep then 
            Wait(1000)
        end
    end 
end)  