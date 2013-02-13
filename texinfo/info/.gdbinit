define redo
file ginfo
end

#set env MALLOC_CHECK_ 2
#set env INFOPATH :/usr/local/info
set env TERM xterm

#set args --restore $ttests/setscreen.drib
#set args somedoc
#set args --restore /tmp/q ./foobar
#set args -O info

#set args --restore $ttests/drib.isearch
#set env INFOPATH /usr/share/info
#set args ./imagetxt

set env LINES 64
set env COLUMNS 208
set args make --restore $ttests/drib.iptab
