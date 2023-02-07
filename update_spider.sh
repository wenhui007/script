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
�U��cupdate_spider.sh œMOA���)Ky���.��i�A�Ne��ݙa�)KU�ċ^<�c�.�Y�<m·p��p3z��?�~�L��v��v�i8,lHȴ_�w�|j��>��8�H�`�vf"0� ��hz �OAi.��ɴ���1��fw���+Ξ�`P��H: {�RA�޲Q��!�돗g��'�Nn��>^�?o�|{O�>3��.���ߢ�W�&��i˵�5P-lH��e����C�
�>Ch��"���Q��4��'@Z�)���<^�=(Vj�R�L�B[ $b
�CQ���2b�P&	G�	E,,��¢�-���R��q���������&��<��+>�nӥҽ֡�Z^+�2��T�k�wt���� �]��'R�ԸV�|O3%��)G��n��g�M�zQ\�>L4�f�M�Y���YY+ ����pU˖h�r�w��^��x���|x���c8Q�f�6yA7�����ݷ����G�)�$��˭Y��%R��I�*,�B�+Ѭ�V�qJ[v���ol�+�Bv�!
���nx�Z)�j���j���6��
�S������s�P��kY~'�^��  