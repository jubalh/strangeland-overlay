# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit autotools

SLOT="0"

DESCRIPTION="ncurses based sudoku game."
SRC_URI="https://github.com/jubalh/${PN}/releases/download/${PV}/${P}.tar.xz"

LICENSE="GPL-3"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_install() {
	dobin ${WORKDIR}/${P}/src/${PN}
}
