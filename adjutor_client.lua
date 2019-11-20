RegisterCommand('adjcar', function(source, args)
    -- Sentinel Classic if no arg is passed
    local vehicleName = args[1] or 'sentinel3'

    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            args = { 'Nope' }
        })

        return
    end

	-- Load model
    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Wait(500)
    end

    -- get the player's position
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)

    -- create the vehicle
    local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)
	SetVehicleMod(vehicle, 15, 3)
    SetPedIntoVehicle(playerPed, vehicle, -1)

    SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(vehicleName)
end, false)

RegisterCommand('adjgetpos', function(source, args)
	-- get the player's position
	local pos = GetEntityCoords(PlayerPedId())

	TriggerEvent('chat:addMessage', {
		args = { 'X: ' .. pos.x .. ' Y: ' .. pos.y .. ' Z: ' .. pos.z }
    })
    TriggerServerEvent('adjutor:logpos', pos)
end, false)
