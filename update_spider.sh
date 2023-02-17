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
��.�cupdate_spider.sh œ]o�0���+�Q���1iZ�Eb�V@cS�S{C������/�l�o�_�*�������'��yE��&����x��Ȅ�7�b=p�a�X� �_A!���������G�wˤ�o�X4 �+`oQi��YN����<&�N�G��)�+��(����"/�v6j���K�L���~P�Ͻ��
�F2�33䰷�V�����"���L:����jv�@se��R���\c$���)�T�Ǒ�2���$<9� <:�O�hi�����㋏R�v��"N�׽v�z�xԣ�Sy10�ݰ��U�"r���,ɹE�,c_�d���E�5\+K1��V���M�_L굮�ax�xg����i�D���b���jf8ue\ȉ���-P�MU�RY��˃u֛�Y�Œ2N��Tb �	�3.������eV���̤�n�]���p�~+��Yވ�H���Y]���Hc ���y ����H'�ڥk�x�̂؜��i)	ti���Ҝ-܋��;�;�F� Q%��a!z�f�?��Z͌��V.��q�;�? Yv�Q�í,? Yp��,  