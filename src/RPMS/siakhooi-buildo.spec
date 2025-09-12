Name:           siakhooi-buildo
Version:        0.10.0
Release:        1%{?dist}
Summary:        powertoys for builder

License:        MIT
URL:            https://github.com/siakhooi/buildo
Source0:        https://github.com/siakhooi/%{name}/archive/refs/tags/${version}.tar.gz
BuildArch:      noarch

Requires:       bash, coreutils, siakhooi-devutils, util-linux, sed, findutils

%description
powertoys for builder

%install
%{__mkdir}   -v -p %{buildroot}%{_bindir}
%{__mkdir}   -v -p %{buildroot}%{_libdir}/buildo
%{__mkdir}   -v -p %{buildroot}/usr/share/licenses/siakhooi-buildo
%{__install} -v -m 0755 %{_topdir}/BUILD/usr/bin/* %{buildroot}%{_bindir}
%{__install} -v -m 0755 %{_topdir}/BUILD/usr/lib/buildo/* %{buildroot}%{_libdir}/buildo
%{__install} -v -m 644  %{_topdir}/BUILD/LICENSE                 %{buildroot}/usr/share/licenses/siakhooi-buildo

%files
%license LICENSE
%{_bindir}/buildo-config
%{_bindir}/buildo-config-edit
%{_bindir}/buildo-config-set
%{_bindir}/buildo-version
%{_bindir}/buildo-docker-build
%{_bindir}/buildo-docker-build-list
%{_bindir}/buildo-docker-images
%{_bindir}/buildo-completion
%{_bindir}/buildo-message
%{_bindir}/pip-purge-all
%{_bindir}/pip-upgrade-all
%{_bindir}/git-reset-very-hard
%{_libdir}/buildo/buildo-init

%changelog
* Fri Sep 12 2025 Siak Hooi <siakhooi@gmail.com> - 0.10.0
- update buildo-message with -p print filename

* Wed Sep 10 2025 Siak Hooi <siakhooi@gmail.com> - 0.9.0
- add buildo-message

* Thu Jul 3 2025 Siak Hooi <siakhooi@gmail.com> - 0.8.0
- add buildo-completion

* Sun Jun 29 2025 Siak Hooi <siakhooi@gmail.com> - 0.7.0
- add git-reset-very-hard

* Sun Jun 29 2025 Siak Hooi <siakhooi@gmail.com> - 0.6.0
- initial version
