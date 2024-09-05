local Lib = {}
local UserId = game:GetService("Players").LocalPlayer.UserId

function Lib:GetLink(ApplicationId)
  return string.format("https://gw.aisboost.com/a/%i?hwid=%i", ApplicationId, UserId)
end

function Lib:Verify(ApplicationId, Key)
  local status, response = pcall(function()
    return game:HttpGet(string.format("https://api.aisboost.com/v1/authenticators/%i/redeem?hwid=%s&key=%s", ApplicationId, UserId, Key))
  end)

  if status then 
    return string.find(response, "true")
  end

  return false
end

return Lib
