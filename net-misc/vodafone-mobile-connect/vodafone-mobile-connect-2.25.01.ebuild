# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils

DESCRIPTION="Vodafone Mobile Connect Card driver for Linux"
HOMEPAGE="https://forge.betavine.net/projects/vodafonemobilec/"
SRC_URI="https://forge.betavine.net/frs/download.php/626/${PN}_2.25.01-1_all.deb"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lang/python:2.6
	dev-python/twisted
	dev-python/twisted-conch
	dev-python/pyserial
	dev-python/pytz
	net-dialup/wvdial
	sys-apps/usb_modeswitch"

S=${WORKDIR}

src_unpack() {
	unpack ${A}
	unpack ./data.tar.gz
	rm -f control.tar.gz data.tar.gz debian-binary
	chmod a+x usr/bin/vmc-cli-client.py
	epatch "${FILESDIR}/E1762.rules"
}

src_install() {
	cp -a * "${D}"/ || die "installing failed"
}
