# Copyright open-overlay 2015 by Alex

EAPI=5

inherit eutils versionator

SR=R
RNAME="luna"


DESCRIPTION="Eclipse IDE for C/C++"
HOMEPAGE="http://www.eclipse.org"

SRC_BASE="http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/${RNAME}/${SR}/eclipse-cpp-${RNAME}-${SR}-linux-gtk"

SRC_URI="
         amd64? ( ${SRC_BASE}-x86_64.tar.gz&r=1 -> ${P}-x86_64.tar.gz )
         x86? ( ${SRC_BASE}.tar.gz&r=1 -> ${P}.tar.gz )"

LICENSE="EPL-1.0"
SLOT="4.4"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=">=virtual/jdk-1.6
	 x11-libs/gtk+:2
         >=sys-devel/gcc-4.8.3"

S=${WORKDIR}/eclipse

src_install() {
	local dest=/opt/${PN}-${SLOT}

	insinto ${dest}
	doins -r features icon.xpm plugins artifacts.xml p2 eclipse.ini configuration dropins

	exeinto ${dest}
	doexe eclipse

	dohtml -r about.html about_files epl-v10.html notice.html readme/*

        newicon  "icon.xpm" "${PN}.xpm"
        make_wrapper ${PN} "${dest}/eclipse"
        make_desktop_entry ${PN} "Eclipse Cpp ${PV}" ${PN} "Development;IDE"
}



