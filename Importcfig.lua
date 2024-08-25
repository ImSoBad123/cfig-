print("Loading Config: " .. _G.cfig)
local url
local main = Username

wait(0.3)
if _G.cfig == "Frag" then
    url = "https://raw.githubusercontent.com/ImSoBad123/cfig-/main/frag.json"
end

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerName = player.Name  -- Extract player's name as a string

-- Check if the URL is set before proceeding
if url then
    local response = game:HttpGet(url)
    
    -- Decode JSON response into a Lua table
    local config = HttpService:JSONDecode(response)
    
    -- New folder structure
    local folder = "True_W_azure_V2_Beta/ConfigMain"
    local filename = playerName  -- Use player's name for the filename
    
    -- Ensure the folder exists
    if not isfolder(folder) then
        makefolder(folder)
    end
    
    wait(0.3)
    print("write cfig")
    writefile(folder .. "/" .. filename, HttpService:JSONEncode(config))
else
    warn("URL not set. Configuration may not have been loaded.")
end

wait(0.5)
print("loading script")
