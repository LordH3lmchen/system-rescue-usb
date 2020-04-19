function disable cashregister-mode
	nmcli connection down Hostspot
	nmcli connection down 'Drei (3) Default'
	nmcli connection up trabauer50
end
