#!/bin/sh
exec >>/root/post.out 2>&1
set -x
echo sysprep > /sysprep.txt
exit 0
