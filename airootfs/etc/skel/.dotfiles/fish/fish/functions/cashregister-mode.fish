function cashregister-mode
	nmcli connection up Hostspot
	nmcli connection up 'Drei (3) Default'
	chromium 'https://www.mminvoice.at/' 'https://docs.google.com/spreadsheets/d/1pzG7KXYuCD3erY6tWFBBpozeCGijT-bm5cR9CKxVPo4/edit#gid=128467581' &
end
