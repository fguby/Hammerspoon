hs.hotkey.bind({"ctrl"}, "T", function()
	a1, a2 = hs.dialog.textPrompt("A simple timer", "Setting time", "{number}: {s/m/h}", "Confirm", "Cancel", false)
  	if(a1 == "Confirm")
  		then
  			hs.alert.show("Success(..•˘_˘•..)")
  			local clock = hs.menubar.new()
  			local t = string.sub(a2, -1)
  			local time = tonumber(string.sub(a2, 1, string.len(a2) - 1))
  			if(t == "m")
  				then
  					time = 60 * time
			elseif(t == "h")
				then
					time = 60 * 60 * time
			end
			local start = 0
			local icon = hs.image.imageFromPath("~/icon/beetle.png")
			local icon = icon:setSize({w=20, h=20})
			clock:setIcon(icon, false)
  			hs.timer.doUntil(function()
  				-- body
  				if(start >= time)
  					then
  						s = hs.sound.getByName("Glass.aiff")
  						s:play()
						clock:delete()
						hs.alert.show("Time is up(..•˘_˘•..)")  
  						return true
				end
  			end, function()
  				local seconds = time - start
  				local hour = math.floor(seconds/3600)
  				local minutes = math.floor((seconds - hour*60)/60)
  				local lastSeconds = seconds - hour*3600 - minutes * 60
  				local title = string.format(" %02d:%02d:%02d", hour, minutes, lastSeconds)
          		title = hs.styledtext.ansi(title)
  				clock:setTitle(title)
  				start = start + 1
  			end)
		end
end)