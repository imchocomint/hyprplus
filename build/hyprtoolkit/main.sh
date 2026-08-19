cd hyprtoolkit
git clone https://github.com/imchocomint/hyprtoolkit-debian
cd hyprtoolkit-debian
gbp buildpackage -us -uc --git-ignore-new --git-no-pristine-tar --git-upstream-tree=HEAD
rm -rf hyprtoolkit-debian
mv *.deb ../
