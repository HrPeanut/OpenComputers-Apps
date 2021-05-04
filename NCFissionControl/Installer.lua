-- https://pastebin.com/kxGZBFvK
local component = require("component")

local repository = "https://raw.githubusercontent.com/HrPeanut/OpenComputers-Apps/main/NCFissionControl/"

local function install(fileName)
    local url = repository .. fileName
    print("Installing", url)
    local handle, data, chunk = component.internet.request(repository .. fileName)
    while true do
        chunk = handle.read(math.huge)
        if chunk then
            data = data .. chunk
        else
            break
        end
    end
    handle.close()
    
    file = io.open(fileName, "w")
    file:write(data)
    file:close()
end

install("Main.lua")