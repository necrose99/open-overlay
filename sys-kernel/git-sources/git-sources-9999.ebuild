# Copyright open-overlay 2015 by Alex

EAPI="5"
COMPRESSTYPE=".tar.xz"
UNIPATCH_STRICTORDER="yes"
K_NOUSENAME="yes"
K_NOSETEXTRAVERSION="don't_set_it"
K_NOUSEPR="yes"
K_SECURITY_UNSUPPORTED="yes"
K_DEBLOB_AVAILABLE=0
ETYPE="sources"
CKV='4.99'

inherit kernel-2 git-2
detect_version

DESCRIPTION="Live -git version of the Linux kernel"
HOMEPAGE="https://github.com/torvalds/linux"
EGIT_REPO_URI="git://github.com/torvalds/linux.git"

KEYWORDS=""
IUSE=""

K_EXTRAEINFO="GNU/Linux Kernel"

pkg_postinst() {
	postinst_sources
}
