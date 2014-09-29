# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Software originally designed for recording and streaming live video content, efficiently."
HOMEPAGE="https://github.com/jp9000/obs-studio"
# SRC_URI="mirror://sourceforge/ctags/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~sparc ~x86 ~amd64"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/jp9000/obs-studio.git"
	KEYWORD=""
	inherit git-r3
fi

src_prepare(){
	CMAKE_USE_DIR="${S}"
	BUILD_DIR="${S}"_build
}


src_configure() {
	# econf --with-posix-regex

	cmake -DUNIX_STRUCTURE=1 -DCMAKE_INSTALL_PREFIX=/usr
}
src_compile(){
	CMAKE_USE_DIR="${S}"
	BUILD_DIR="${S}"_build
	cmake-utils_src_compile
}
# src_install() {
# 	emake DESTDIR="${D}" install

# 	dodoc FAQ NEWS README
# 	dohtml EXTENDING.html ctags.html
# }
