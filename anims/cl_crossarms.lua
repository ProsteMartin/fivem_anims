-- CROSSARMS
local crossarms = false

RegisterCommand('crossarms', function()
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        local dict = "anim@amb@nightclub@peds@"
        if not crossarms then
                RequestAnimDict(dict)
                while not HasAnimDictLoaded(dict) do
                    Wait(500)
                end
                TaskPlayAnim(PlayerPedId(), dict, "rcmme_amanda1_stand_loop_cop", 2.5, 2.5, -1, 50, 0, false, false, false)
                crossarms = true
        else
            crossarms = false
            StopAnimTask(PlayerPedId(), dict, "rcmme_amanda1_stand_loop_cop", -2.5)
            RemoveAnimDict(dict)
        end
    end
end)

RegisterKeyMapping('crossarms', Config.CrossarmsName, 'keyboard', Config.CrossarmsBind)
