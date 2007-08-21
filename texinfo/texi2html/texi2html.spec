Name: texi2html
Version: 1.79
Release: 1
#Epoch: 0
License: GPL
Group: Applications/Text
Summary: A highly customizable texinfo to HTML and other formats translator
Source: http://savannah.nongnu.org/download/texi2html/%{name}-%{version}.tar.gz
URL: http://www.nongnu.org/texi2html/
BuildArch: noarch
BuildRoot:  %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

# You may want to uncomment the following
#BuildRequires: perl
# perl is picked up automatically in most cases and the package may have 
# a different name so it is better not to require it. Moreover such old perl
# is unlikely to show up in a rpm based distribution.
#Requires: perl >= 5.004
Requires(post): /sbin/install-info
Requires(preun): /sbin/install-info

# uncomment this if you want to build a relocatable package
#Prefix: %{_prefix}

%description
The basic purpose of texi2html is to convert Texinfo documents into HTML, 
and other formats.  Configuration files written in perl provide fine degree 
of control over the final output, allowing most every aspect of the final 
output not specified in the Texinfo input file to be specified.  

%prep
%setup -q

%build
%configure
make %{?_smp_mflags}

%install
rm -rf $RPM_BUILD_ROOT
make install DESTDIR=$RPM_BUILD_ROOT 
#%find_lang %{name}

rm -f $RPM_BUILD_ROOT%{_infodir}/dir

%clean
rm -rf $RPM_BUILD_ROOT

%post
/sbin/install-info %{_infodir}/%{name}.info %{_infodir}/dir || :

%preun
if [ $1 = 0 ]; then
  /sbin/install-info --delete %{_infodir}/%{name}.info %{_infodir}/dir || :
fi

%files
%defattr(-,root,root)
%doc AUTHORS NEWS README ChangeLog %{name}.init
%{_bindir}/%{name}
%{_datadir}/texinfo/html/%{name}.html
%{_mandir}/man*/%{name}*
%{_infodir}/%{name}.info*
%{_datadir}/%{name}/

%changelog
* Mon Nov 14 2005 Patrice Dumas <pertusus@free.fr> 1.77-1
- cleanups

* Mon Mar 23 2004 Patrice Dumas <pertusus@free.fr> 0:1.69-0.fdr.1
- Initial build.
