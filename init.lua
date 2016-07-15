
-- Automatated wifi login script--

local ssids={"BPGC-HOSTEL","BPGC-WIFI"}

hs.wifi.watcher.new(function()
	local connectedWifi=hs.wifi.currentNetwork()
	if not connectedWifi then return end
	for i=1, 2 do
      if ssids[i] == connectedWifi then
      	break
      else
      	return
      end
    end

--Execute custom script that logs in with a POST request--
	hs.execute("~/Documents/Scripts/Mine/bpgc_portal_login.sh")

	hs.notify.new({title="Logged in to "+connectedWifi, informativeText=""}):send()
	end):start()

-- Later versions will check POST response to notify login states--

