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

set args --restore $ttests/tab.drib
