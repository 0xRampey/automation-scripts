
-- Automated wifi login script--

local ssids={"BPGC-HOSTEL","BPGC-WIFI","Prudhvi's Network"}
 

hs.wifi.watcher.new(function()
	connectedWifi=hs.wifi.currentNetwork()
	if not connectedWifi then return end
	for i=1,3 do
      if ssids[i] == connectedWifi then
    -- Check for an internet connection and then, send a request
      hs.network.reachability.internet():setCallback(function(self, flags)
        if (flags & hs.network.reachability.flags.reachable) > 0 then
            -- a default route exists, so an active internet connection is present
            login()
        else
            -- no default route exists, so no active internet connection is present
        end
   end):start()
        -- No need to pause the watcher as it conveniently sends a request when an internet connection resets
      end
  end
    return
end):start()
-- Execute custom script that logs in with a POST request --
function login()
  	
    local login = hs.task.new("~/Documents/Scripts/Mine/bpgc_portal_login.sh", function(exitCode,stdOut,stdErr) 
      if(exitCode==0) then
        hs.notify.new({title="Login succesfull", informativeText=("Logging in to " .. connectedWifi)}):send()
      else
        hs.notify.new({title=("Login succesfull"), informativeText="The server is down or you might want to authenticate."}):send()
        end
    end):start()
  -- Debugging purposes
    print(login)

	  
  
end

-- Later versions will check POST response to notify login states

