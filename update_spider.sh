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
����cupdate_spider.sh œ�n1����4�E�3�DQ�HAHMK"�&J��ԙq3&3�k;�P	�6,*E!� k�y�o�sU�������\�n9ʜV�E��C��������{��"ey�iL�e�p��s�E$�3�q����iH��&fn����,��W<�#.Ai	���}n����斉2bM�^�<��?�dtU��y�{v���{��6�&Qc��.���EG���ͤ��n�*� p���k���jv ��DC[�X���F(S�!th(�NiRmk�R�_,����lM�@�'B�B��Py��O��"��DX�ln���V�lf��'��U��$�&��+��R�UN�dcK�^��Ϊ�J���f��~P�kҠ����n+��k��p�ce�鸎$�+G�T��u%�O�,�o�3���b�Y$$9nSI"´��m�oa\��md��"1e0&R�8ݹ܁�SG4$�.�?����1��q#m��4̚�;.ؓY|����b�!��h3@䖗�AD".�b,
+���I2d+�0Ɖ�"���^�\-��4�Y�w���F��wP�(,�z���Tw���$�\S���Z�_'�z|�  