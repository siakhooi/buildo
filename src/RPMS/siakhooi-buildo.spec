Name:           siakhooi-buildo
Version:        0.20.0
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
%{_bindir}/buildo-anacron-exec
%{_bindir}/buildo-anacron-log
%{_bindir}/buildo-anacron-run
%{_bindir}/buildo-anacron-status
%{_bindir}/buildo-checker-docker-usage
%{_bindir}/buildo-checker-path-usage
%{_bindir}/buildo-checker-space-left
%{_bindir}/buildo-completion
%{_bindir}/buildo-config
%{_bindir}/buildo-config-edit
%{_bindir}/buildo-config-set
%{_bindir}/buildo-docker-build
%{_bindir}/buildo-docker-build-list
%{_bindir}/buildo-docker-images
%{_bindir}/buildo-github-release-latest-get
%{_bindir}/buildo-git-pull
%{_bindir}/buildo-message
%{_bindir}/buildo-proxy
%{_bindir}/buildo-upgrade
%{_bindir}/buildo-version
%{_bindir}/buildo-jira-curl
%{_bindir}/buildo-jira-issue-get
%{_bindir}/buildo-jira-status-get
%{_bindir}/my-jira
%{_bindir}/pip-purge-all
%{_libdir}/buildo/buildo-init
%{_libdir}/buildo/buildo-init-git-functions

%changelog
* Thu Nov 27 2025 Siak Hooi <siakhooi@gmail.com> - 0.20.0
- add buildo-git-pull

* Sat Nov 22 2025 Siak Hooi <siakhooi@gmail.com> - 0.19.2
- remove git-reset-very-hard

* Fri Nov 21 2025 Siak Hooi <siakhooi@gmail.com> - 0.19.1
- remove pip-upgrade-all

* Wed Nov 12 2025 Siak Hooi <siakhooi@gmail.com> - 0.19.0
- add buildo-upgrade, fix quote issue in buildo-jira-issue-get

* Wed Nov 05 2025 Siak Hooi <siakhooi@gmail.com> - 0.18.0
- update buildo-proxy,buildo-jira-issue-get add my-jira

* Wed Nov 05 2025 Siak Hooi <siakhooi@gmail.com> - 0.17.0
- add buildo-jira-curl, buildo-jira-{issue,status}-get

* Tue Oct 14 2025 Siak Hooi <siakhooi@gmail.com> - 0.16.0
- add buildo-checker-{docker-usage,path-usage,space-left}

* Mon Oct 13 2025 Siak Hooi <siakhooi@gmail.com> - 0.15.1
- fix buildo-anacron-exec exported environment variables

* Sat Oct 11 2025 Siak Hooi <siakhooi@gmail.com> - 0.15.0
- add buildo-anacron-{exec,log,run,status}

* Fri Oct 10 2025 Siak Hooi <siakhooi@gmail.com> - 0.14.0
- add buildo-github-release-latest-get

* Wed Oct 08 2025 Siak Hooi <siakhooi@gmail.com> - 0.12.1
- fix buildo-proxy shell, remove newline

* Tue Oct 07 2025 Siak Hooi <siakhooi@gmail.com> - 0.12.0
- add buildo-proxy

* Thu Sep 25 2025 Siak Hooi <siakhooi@gmail.com> - 0.11.1
- fix bud: buildo-message

* Wed Sep 17 2025 Siak Hooi <siakhooi@gmail.com> - 0.11.0
- add buildo_shell_prompt_for_git_repo

* Fri Sep 12 2025 Siak Hooi <siakhooi@gmail.com> - 0.10.1
- fix some scripts to source buildo-init

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
