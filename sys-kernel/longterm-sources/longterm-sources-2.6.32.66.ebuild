# Copyright open-overlay 2015 by Alex

EAPI="5"
K_NOUSENAME="yes"
K_NOSETEXTRAVERSION="yes"
K_SECURITY_UNSUPPORTED="1"
K_DEBLOB_AVAILABLE="0"
ETYPE="sources"
inherit kernel-2
detect_version

DESCRIPTION="Longterm full sources for the Linux kernel"
HOMEPAGE="http://www.kernel.org"
SRC_URI="http://www.kernel.org/pub/linux/kernel/v2.6/longterm/v2.6.32/linux-${PV}.tar.xz"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE="deblob"
