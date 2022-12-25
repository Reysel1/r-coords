local core = "esx" -- esx or qb 


if (core == 'esx') then 
    ESX = exports['es_extended']:getSharedObject()
elseif ( core == 'qb' ) then 
    QBCore = exports["qb-core"]:GetCoreObject()
end

RegisterCommand('coords', function() 
    OpenUI()
end)


function OpenUI()
    SetNuiFocus(true, true)
    local _char = PlayerPedId()
    local _charPos = math.floor(GetEntityCoords(_char))
    local _charHeading = math.floor(GetEntityHeading(_char))
    SendNUIMessage({
        type = "open",
        _charPos = _charPos,
        _charHeading = _charHeading,
    })
end

RegisterNUICallback('int:close', function(data)
    SetNuiFocus(false, false)
end)
  

RegisterNUICallback('int:noty', function(data)
    if (core == 'esx') then 
        ESX.ShowNotification(data.noti)
    elseif ( core == 'qb' ) then 
        QBCore.Functions.Notify(data.noti)
    end
end)
  
