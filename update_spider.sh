#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�R��cupdate_spider.sh œێ�0���S�=�rB�"U���� ���5�����ٴ�g������Um�<���?���WތoF��a�RB��
N(R.��F͇�H�+�A �MWp�����?_ښ펁x]�~�9_x8s���.��t �������U���Σ��4��	]0�*�x.�-"���(�'ag���p)E#p��[w���@�CX��"���C��4�a� �)e��*����C�;/�z��n�0�,@H�.��%�2�eĦ�L�L�$����R��r�o<��I��!�tj77��/��;<�[����~�=�I�*nG�{���(���9�kCRf��.M�)hj\+y��LI�a��O����쿈^���a�Dh���%L�q�	��^��=m���U��5Ѹ��m���Ӛ����!��<�� �66>���m�*�R�&&,�:#&��Y�K��,gi�8��}-����;h��Ҡ�	�ޖG�n�=�������0�oU�WS�w�@��:��'Y~ tVi��  