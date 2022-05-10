local AR = {}
function AR.yield()
    while true do
        local event = {os.pullEvent()}
        if event[1] == "timer" and event[2] == timeout then
            break
        end
        os.queueEvent("timer")
        os.pullEvent("timer")
    end
end
function AR.init()
    Logger.write("Loading module AR...")

    ArController.clear()
    ArController.setRelativeMode(true, 1600, 900)
end
function AR.initSecondPhase()
    curEText = " ... "
    maxEText = " ... "
    eRatio = 0;
end
function AR.drawAll(itemList, energyTable)
    local start_x = 0
    local step_x = 50

    local start_y = 810
    local padding_y = 0

    local x = start_x
    local y = start_y

    -- Icon
    local item_icon = "powah:battery_nitro"
    ArController.clear()
    ArController.fill(0, 855, 620, 900, 0x2C589A)    
    ArController.drawItemIcon(item_icon, x + 10, y)
    ARtext =  curEText .. " FE /" .. maxEText .. " FE (" .. tostring(eRatio) .. "%)"
    ArController.drawString(ARtext, x + 45, y + 10, 0xffffff)         
    AR.drawEnergy(energyTable)
    AR.drawItems(itemList)

end

function AR.drawEnergy(energyTable)
    local start_x = 0
    local step_x = 50
    local padding_x = 10

    local start_y = 810
    local padding_y = 0

    local x = start_x
    local y = start_y


    local curE = energyTable.capacity
    eRatio = tostring(energyTable.fillRatio)

    local curEU = " "

    
    if curE >= 1000000000 and curE <= 1000000000000 then
        curE = math.floor(curE/100000)
        curE = (curE/1000)
        curEU = " B"
    elseif curE >= 1000000000000 and curE <= 1000000000000000 then
        curE = math.floor(curE/100000000)
        curE = (curE/1000)
        curEU = " T"
    elseif curE >= 1000000000000000 then
        curE = math.floor(curE/100000000000)
        curE = (curE/1000)
        curEU = " Q"
    elseif curE <= 1000000 then curEU = " "
    end


    local maxE = energyTable.capacityMax
    local maxEU = " "   
    
    if maxE >= 1000000000 and maxE <= 1000000000000 then
        maxE = math.floor(maxE/100000)
        maxE = (maxE/1000)
        maxEU = " B"
    elseif maxE >= 1000000000000 and maxE <= 1000000000000000 then
        maxE = math.floor(maxE/100000000)
        maxE = (maxE/1000)
        maxEU = " T"
    elseif maxE >= 1000000000000000 then
        maxE = math.floor(maxE/100000000000)
        maxE = (maxE/1000)
        maxEU = " Q"
    elseif maxE <= 1000000 then maxEU = " "
    end
    
    curEText = tostring(curE) .. curEU
    maxEText = tostring(maxE) .. maxEU

end

function AR.drawItems(itemList)
    local start_x = 0
    local step_x = 50
    local padding_x = 10

    local start_y = 860
    local padding_y = 0

    local x = start_x
    local y = start_y
    parallel.waitForAny(
        function()
            for i, item in pairs(itemList) do
                local item_icon = item.name
                ArController.drawItemIcon(item_icon, x + padding_x, y + padding_y)
                local amount_text = tostring(item.amount)
                local text_size = getTextSize(amount_text)
                ArController.drawString(amount_text, x + padding_x + 35, y + 10, 0xffffff)
                x = x + text_size + step_x 
            end           
        end,
        AR.yield()
    )
end

function getTextSize(txt)
    local char_size = 10
    return string.len(txt) * char_size
end

return AR
