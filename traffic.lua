local config = { -- Adjust these values to control how many pedestrians and vehicles spawn
    pedFrequency = 0.9,      -- Pedestrian spawn density (0.0 = none, 1.0 = default GTA level)
    trafficFrequency = 0.1,  -- Vehicle spawn density (0.0 = none, 1.0 = default GTA level)
}

Citizen.CreateThread(function()
    -- Infinite loop that runs every frame
    while true do 
        -- Wait 0 ensures this runs once per game frame
        Wait(0)

        -- Control pedestrian density in the world
        SetPedDensityMultiplierThisFrame(config.pedFrequency)

        -- Control scenario pedestrians (NPCs doing activities like sitting, talking, etc.)
        SetScenarioPedDensityMultiplierThisFrame(config.pedFrequency, config.pedFrequency)

        -- Control randomly spawned vehicles driving around
        SetRandomVehicleDensityMultiplierThisFrame(config.trafficFrequency)

        -- Control parked vehicles around the map
        SetParkedVehicleDensityMultiplierThisFrame(config.trafficFrequency)

        -- Control overall vehicle density
        SetVehicleDensityMultiplierThisFrame(config.trafficFrequency)
    end
end)