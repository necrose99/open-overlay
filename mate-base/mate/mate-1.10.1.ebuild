# Copyright open-overlay 2015 by Alex

EAPI="5"

inherit multilib

SRC_URI=""
DESCRIPTION="Meta ebuild for MATE, a traditional desktop environment"
HOMEPAGE="http://mate-desktop.org"

LICENSE="metapackage"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+base -bluetooth +themes +extras"

S="${WORKDIR}"

RDEPEND="
	>=mate-base/mate-desktop-1.10:0
	>=mate-base/mate-menus-1.10:0
	>=mate-base/mate-panel-1.10:0
	>=mate-base/mate-session-manager-1.10:0
	>=mate-base/mate-settings-daemon-1.10:0
	>=x11-wm/marco-1.10:0
	base? (
		>=mate-base/caja-1.10:0
		>=mate-base/mate-applets-1.10:0
		>=mate-base/mate-control-center-1.10:0
		>=mate-extra/mate-media-1.10:0
		>=x11-misc/mozo-1.10:0
		>=x11-terms/mate-terminal-1.10:0
	)
	bluetooth? ( net-wireless/blueman:0 )
	themes? (
		>=x11-themes/mate-backgrounds-1.10:0
		>=x11-themes/mate-icon-theme-1.10:0
		>=x11-themes/mate-themes-1.10:0
	)
	extras? (
		>=app-arch/engrampa-1.10:0
		>=app-editors/pluma-1.10:0
		>=app-text/atril-1.10:0
		>=mate-extra/mate-calc-1.8:0
		>=mate-extra/mate-power-manager-1.10:0
		>=mate-extra/mate-screensaver-1.10:0
		>=mate-extra/mate-system-monitor-1.8:0
		>=mate-extra/mate-utils-1.10:0
		>=media-gfx/eom-1.10:0
	)
"

PDEPEND="virtual/notification-daemon:0"

pkg_postinst() {
	elog "For installation, usage and troubleshooting details regarding MATE;"
	elog "read more about it at Gentoo Wiki: https://wiki.gentoo.org/wiki/MATE"
	elog ""
	elog "MATE 1.10 had some packages renamed, replaced and/or dropped; for more"
	elog "details, see http://mate-desktop.org/blog/2015-06-11-mate-1-10-released"
	elog ""
	elog "There is mate-conf-import that converts from mateconf to gsettings."
	elog ""
	elog "For support with mate-conf-import see the following MATE forum topic:"
	elog "http://forums.mate-desktop.org/viewtopic.php?f=16&t=1650"
        elog ""
        elog "For user guide information: emerge mate-user-guide-1.10.0"
        elog ""
        elog ""
        elog "Thanks open-overlay 2015 by Alex"
        elog ""
}
