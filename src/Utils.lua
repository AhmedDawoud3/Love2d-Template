---@diagnostic disable: param-type-mismatch

---@param t string|integer time
---@param n integer number of decimal places
---@return string time formated
function TimeGSUB(t, n)
    local time = tonumber(t)
    local seconds = math.floor(time)
    local miliseconds = time - seconds
    local timeFormated = tostring(seconds) .. string.sub(tostring(miliseconds), 2, n + 2)
    return timeFormated
end

-- Round to n Decimal places
function Round(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- Split stings with "sep"
-- https://stackoverflow.com/questions/1426954/split-string-in-lua
function Split(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end

function table.removekey(tabl_, value)
    for _, v in ipairs(tabl_) do
        if v == value then
            table.remove(tabl_, _)
            return
        end
    end
end

function GetAngle(x1, y1, x2, y2)
    return math.atan2(y2 - y1, x2 - x1)
end

function GetDistance(x1, y1, x2, y2)
    return math.sqrt((x1 - x2) ^ 2 + (y1 - y2) ^ 2)
end

function IsInTable(value, table)
    for i, v in ipairs(table) do
        if v == value then
            return i
        end
    end
    return false
end

function math.sign(number)
    if number > 0 then
        return 1
    elseif number < 0 then
        return -1
    else
        return 0
    end
end

-- This function takes a table and prints it to the console.
function Debug(x)
    print(Inspect(x))
end
