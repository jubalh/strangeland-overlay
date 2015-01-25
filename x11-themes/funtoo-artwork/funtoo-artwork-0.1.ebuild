# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Collection of artwork for Funtoo"
HOMEPAGE=""
SRC_URI=" xfce? ( mirror://sourceforge/funtooartwork/LarrysHead-splash.tar.gz )"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="+xfce"

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_install() {
	if use xfce ; then
		insinto /usr/share/themes/
		cp -R "${S}"/* "${D}"/usr/share/themes/
	fi
}

