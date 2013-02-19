define redo
file texindex
end

set env MALLOC_CHECK_ 2
set env ttests ../../@tests

set args $ttests/bug-texinfo-4.3/gforth.ds
