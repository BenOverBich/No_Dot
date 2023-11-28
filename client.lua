CreateThread(function()
    local bow = joaat('WEAPON_BOW')
    local bowImproved = joaat('WEAPON_BOW_IMPROVED')
    local player = PlayerId()
    while true do
        Wait(0)
        local playerPed = PlayerPedId()
        Citizen.InvokeNative(0x4CC5F2FC1332577F, 0x3F129E06) -- EnableHudContext / HUD_CTX_INFINITE_AMMO
        Citizen.InvokeNative(0x4CC5F2FC1332577F, 0xFC0F918A) -- EnableHudContext / HUD_CTX_SHARP_SHOOTER_EVENT
        if IsPlayerFreeAiming(player) and IsPedWeaponReadyToShoot(playerPed) then
            local _, weaponHash = GetCurrentPedWeapon(playerPed, true)
            if weaponHash ~= bow and weaponHash ~= bowImproved then
                Citizen.InvokeNative(0xC9CAEAEEC1256E54, 0xBB47198C)-- EnableHudContextThisFrame / HUD_CTX_IN_FAST_TRAVEL_MENU
            end
        else
            Citizen.InvokeNative(0xC9CAEAEEC1256E54, 0xBB47198C)-- EnableHudContextThisFrame / HUD_CTX_IN_FAST_TRAVEL_MENU
        end
    end
end)