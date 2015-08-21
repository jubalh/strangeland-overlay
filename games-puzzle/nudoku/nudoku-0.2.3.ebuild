# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit autotools

SLOT="0"

DESCRIPTION="ncurses based sudoku game."
HOMEPAGE="http://jubalh.github.io/nudoku"
SRC_URI="https://github.com/jubalh/${PN}/releases/download/${PV}/${P}.tar.xz"

LICENSE="GPL-3"
KEYWORDS="*"

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_install() {
	dobin ${WORKDIR}/${P}/src/${PN}
	doman ${WORKDIR}/${P}/man/${PN}.1
}
