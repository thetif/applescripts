--==============
--turn Growl Off
--==============
tell application "System Events"
	set isRunning_Growl to (count of (every process whose name is "GrowlHelperApp")) > 0
end tell

if isRunning_Growl then
	tell application "GrowlHelperApp"
		set the allNotificationsList to {"Growl Toggler"}
		register as application "Growl Toggler" all notifications allNotificationsList default notifications allNotificationsList
		notify with name "Growl Toggler" title "Notifications OFF" description "" application name "Growl Toggler" icon of application "Automator"
	end tell
	delay (2)
	tell application "GrowlHelperApp" to quit
end if


--==============
--Minimize Firefox
--==============
tell application "Firefox"
	-- Bring Firefox to the front.
	activate
	-- Use Sysem Events to mimick pressing "m" and the Command key together.
	tell application "System Events" to keystroke "m" using command down
end tell

--==============
--Open timeEdition and Backdrop
--==============
tell application "timeEdition" to launch
tell application "Backdrop" to launch

--==============
--Set Adium to Studying
--==============
-- set to away
set theMessage to "Studying"

tell application "Adium"
	repeat with theAccount in accounts
		set theStatus to status type of status of theAccount
		
		(*
		set theTitle to title of theAccount
		set theDebugMessage to "Account: " & theTitle & " Status: " & (theStatus as string)
		tell application "Finder" to display dialog theDebugMessage
		*)
		
		if (theStatus is available) then
			go away theAccount with message theMessage
		else if (theStatus is away) then
			go available theAccount with message theMessage
		end if
	end repeat
end tell

--==============
--Hide Dock
--==============
tell application "System Events"
	keystroke "d" using {command down, option down}
end tell