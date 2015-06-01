# Copyright open-overlay 2015 by Alex

EAPI=5
CHROMIUM_LANGS="
	 am ar bg bn ca cs da de el en_GB en_US es_419 es et fa fil fi fr gu he hi
	 hr hu id it ja kn ko lt lv ml mr ms nb nl pl pt_BR pt_PT ro ru sk sl sr sv
	 sw ta te th tr uk vi zh_CN zh_TW
"
inherit chromium multilib unpacker toolchain-funcs

DESCRIPTION="A new browser for our friends"
HOMEPAGE="http://vivaldi.com/"
RNAME=Vivaldi_TP3
SRC_URI="
	amd64? ( ${HOMEPAGE}/download/${RNAME}.1.0.162.9-1_amd64.deb -> ${P}-amd64.deb )
	x86? ( ${HOMEPAGE}/download/${RNAME}.1.0.162.9-1_i386.deb -> ${P}-i386.deb )
"

LICENSE="Vivaldi"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RESTRICT="bindist mirror"

S=${WORKDIR}

RDEPEND="
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/nspr
	dev-libs/nss
	>=dev-libs/openssl-1.0.1:0
	gnome-base/gconf:2
	media-libs/alsa-lib
	media-libs/fontconfig
	media-libs/freetype
	net-misc/curl
	net-print/cups
	sys-apps/dbus
	sys-libs/libcap
	virtual/libudev
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+:2
	x11-libs/libX11
	x11-libs/libXScrnSaver
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXtst
	x11-libs/pango[X]
"

QA_PREBUILT="*"
S=${WORKDIR}
VIVALDI_HOME="opt/${PN}"

src_unpack() {
	unpack_deb ${A}
}

src_prepare() {
	sed -i \
		-e 's|vivaldi-preview|vivaldi|g' \
		usr/share/applications/${PN}-preview.desktop \
		usr/share/xfce4/helpers/${PN}.desktop || die

	mv usr/share/doc/${PN} usr/share/doc/${PF} || die
	rm usr/bin/${PN}-preview || die
	rm _gpgbuilder || die

	local c d
	for d in 16 22 24 32 48 64 128 256; do
		mkdir -p usr/share/icons/hicolor/${d}x${d}/apps || die
		cp \
			${VIVALDI_HOME}/product_logo_${d}.png \
			usr/share/icons/hicolor/${d}x${d}/apps/vivaldi.png || die
	done

	pushd "${VIVALDI_HOME}/locales" > /dev/null || die
	chromium_remove_language_paks
	popd > /dev/null || die

}

src_install() {
	mv * "${D}" || die
	dosym /${VIVALDI_HOME}/${PN} /usr/bin/${PN}

	dodir /${VIVALDI_HOME}/lib
	dosym /usr/$(get_libdir)/libudev.so /${VIVALDI_HOME}/lib/libudev.so.0

	fperms 4711 /${VIVALDI_HOME}/${PN}-sandbox
}

pkg_postinst() {
       echo 
       elog "Welcome to Vivaldi Browser"
       elog "This Technical Preview 3 version vivaldi browser"
       elog "Thanks open-overlay 2015 by Alex"
       echo 
}
