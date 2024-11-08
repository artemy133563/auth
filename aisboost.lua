local Lib = {}
local Hwid = crypt.base64.encode(game:GetService("RbxAnalyticsService"):GetClientId())

function Lib:GetLink(ApplicationId)
  return string.format("https://gw.aisboost.com/a/%i?hwid=%i", ApplicationId, Hwid)
end

function Lib:Verify(ApplicationId, Key)
  local status, response = pcall(function()
    return game:HttpGet(string.format("https://api.aisboost.com/v1/authenticators/%i/redeem?hwid=%s&key=%s", ApplicationId, Hwid, Key))
  end)

  if status then 
    return string.find(response, "true")
  end

  return false
end

return Lib
