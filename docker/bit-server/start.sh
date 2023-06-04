
if [ ! $SCOPE ]; then
  echo scope must be exists.
  exit 1;
fi

cd /root/${SCOPE}

if [ "`ls -A /root/${SCOPE}`" = "" ]; then
  echo new socpe: ${SCOPE}. init /root/${SCOPE};
  bit init --bare;
  echo done.
fi

echo resolve remote scope...
node /root/bin/remote-resolve.js
echo done.

echo start bit server...
bit start
