# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit eutils toolchain-funcs

DESCRIPTION="A UCI chess engine"
HOMEPAGE="http://www.stockfishchess.com/"
SRC_URI="https://stockfish.s3.amazonaws.com/stockfish-${PV}-src.zip -> ${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE="sse debug bsfq popcnt pext prefetch"

RDEPEND=""
DEPEND="app-arch/unzip"

S="${WORKDIR}/stockfish-${PV}-src/src"

src_compile() {
	emake CXX="$(tc-getCXX)" CXXFLAGS="${CXXFLAGS}" \
		arch=any bits=$(usex amd64 "64" "32") \
		bsfq=$(usex bsfq "yes" "no") popcnt=$(usex popcnt "yes" "no") \
		prefetch=$(usex sse "yes" "no") sse=$(usex sse "yes" "no") \
		debug=$(usex debug "yes" "no") pext=$(usex pext "yes" "no") \
		all
}

src_install() {
	dobin ${PN}
	dodoc ../Readme.md
}

pkg_postinst() {
	elog
	elog "Stockfish is just a chess engine, which means, if you want to play against it,"
	elog "      you need to install a UCI/XBoard compatible user interface like XBoard, eboard or knights."
	elog "      Go ahead and install one."
	elog "      If you would like to have the stockfish opening book, look for it on ${HOMEPAGE}."
	elog "      However it does not get updated anymore it's still suitable for existing openings."
	elog
}
