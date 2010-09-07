# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit qt4

DESCRIPTION="KDE Dropbox client"
HOMEPAGE="http://kdropbox.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${PN}-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	eqmake4
}

src_install() {
	eqmake4
    emake INSTALL_ROOT="${D}" install || die
}
