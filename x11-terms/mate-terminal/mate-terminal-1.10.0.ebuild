# Copyright open-overlay 2015 by Alex

EAPI="5"

GCONF_DEBUG="no"

inherit gnome2 versionator

MATE_BRANCH="$(get_version_component_range 1-2)"

SRC_URI="http://pub.mate-desktop.org/releases/${MATE_BRANCH}/${P}.tar.xz"
DESCRIPTION="The MATE Terminal"
HOMEPAGE="http://mate-desktop.org"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="gtk3"

RDEPEND="app-text/rarian:0
	dev-libs/atk:0
	>=dev-libs/glib-2.25:2
	>=gnome-base/dconf-0.10:0
	>=mate-base/mate-desktop-1.9:0[gtk3?]
	x11-libs/gdk-pixbuf:2
	!gtk3? ( >=x11-libs/gtk+-2.18:2
	>=x11-libs/vte-0.27.1:0 )
	gtk3? ( x11-libs/gtk+:3 x11-libs/vte:2.90 )
	x11-libs/libICE:0
	x11-libs/libSM:0
	x11-libs/libX11:0
	x11-libs/pango:0"

DEPEND="${RDEPEND}
	>=app-text/scrollkeeper-dtd-1:1.0
	app-text/yelp-tools:0
	>=dev-util/intltool-0.40:*
	sys-devel/gettext:*
	virtual/pkgconfig:*"

DOCS="AUTHORS ChangeLog HACKING NEWS README"

src_configure() {
	local myconf

	use gtk3 && myconf="${myconf} --with-gtk=3.0"
	use !gtk3 && myconf="${myconf} --with-gtk=2.0"

	gnome2_src_configure ${myconf}
}
