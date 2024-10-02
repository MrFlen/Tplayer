-- Глобальная переменная для отслеживания состояния меню
local menuOpen = false

function activate(fireMode, shiftHeld)
    if shiftHeld and fireMode == "primary" then
        if not menuOpen then
            activeItem.interact("ScriptPane", "/interface/scripted/tplayer.config")
            menuOpen = true
        end
    elseif fireMode == "primary" then
        if not menuOpen then
            activeItem.interact("ScriptPane", "/interface/scripted/tplayer.config")
            menuOpen = true
        end
    elseif fireMode == "alt" then
        if not menuOpen then
            activeItem.interact("ScriptPane", "/interface/scripted/tplayer.config")
            menuOpen = true
        end
    end
end

function update()
    if mcontroller.crouching() then
        activeItem.setArmAngle(-0.15)
    else
        activeItem.setArmAngle(-0.5)
    end
end

-- Функция для закрытия меню и сброса состояния
function closeMenu()
    menuOpen = false
end
