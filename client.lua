local sprite = {
    dictionary = "helicopterhud",
    texture = "hud_dest",
    rotate = 43.0,
    firstWidth = 0.02,
    firstHeight = 0.02,
    step = 0.02,
    lastWidth = 0.08,
    lastHeight = 0.08,
    rgba = {255, 255, 255, 255},
    stepInterval = 1
}

AddEventHandler('gameEventTriggered', function(event, args)
    if event == "CEventNetworkEntityDamage" then
        local victim = args[1]
        local attacker = args[2]
        local isFatal = args[4];
        local weaponHash = args[5];
        local isMelee = args[10];

        if tonumber(isMelee) == 0 then
            local _pped = PlayerPedId()
            print(victim, attacker, _pped)
            if attacker == _pped then
                local width, height = sprite.firstWidth, sprite.firstHeight
                local intervalTime = 0
                while true do
                    Wait(5)
                    intervalTime = intervalTime + 1
                    RequestStreamedTextureDict(sprite.dictionary, false)
                    if intervalTime >= sprite.stepInterval then
                        width = width + sprite.step
                        height = height + sprite.step
                        intervalTime = 0
                    end
                    print(intervalTime)
                    DrawSprite(sprite.dictionary, sprite.texture, 0.5, 0.5, width, height, sprite.rotate, sprite.rgba[1], sprite.rgba[2], sprite.rgba[3], sprite.rgba[4])
                    if width >= sprite.lastWidth or height >= sprite.lastHeight then break end
                end
            end
        end
    end
end)