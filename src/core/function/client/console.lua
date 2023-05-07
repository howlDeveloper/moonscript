local opds = outputDebugString

function moonscript.console:log(arg)
    if (type(arg) == "string" or type(arg) == "number" or type(arg) == "boolean") then
        return opds(tostring(arg), 4)
    end

    return opds("@moonscript a error ocurred 'console:log' [argument 1] got "..type(arg), 1)
end

function moonscript.console:error(error)
    if (not error) then 
        return opds("@moonscript error not defined", 1)    
    end

    return opds("@moonscript Console:Error ["..tostring(error).."]", 4, 255, 0, 0)
end

function moonscript.console:warn(warnMessage)
    if (not warnMessage) then
        return opds("@moonscript warn not defined", 1)
    end

    return opds("@moonscript Console:Warn ["..tostring(warnMessage).."]", 4, 255, 165, 0)
end

function moonscript.console:count(n1, n2, sym)
    if (not n1) then
        return opds("@moonscript bad Argument at 'console:count' [argument 1] got nil")
    end

    if (not n2) then
        return opds("@moonscript bad Argument at 'console:count' [argument 2] got nil")
    end

    if (not sym) then
        return opds("@moonscript bad Argument at 'console:count' [argument 3] got nil")
    end

    if (type(n1) ~= "number" and type(n2) ~= "number") then
        return opds("@moonscript arguments is not Numbers")
    end

    for i=n1, n2 do
        opds("@moonscript Console:Count ["..tostring(i).."]", 4)
    end
end

function moonscript.console:info(table)
    if (not table) then
        return opds("@moonscript table not defined")
    end
    if (type(table) == "table") then
        return opds(inspect(table))
    end

    return false
end