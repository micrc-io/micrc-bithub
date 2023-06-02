
if [ ! $SCOPE ]; then
  echo scope must be exists.
  exit 1;
fi

cd /root/${SCOPE}

if [ "`ls -A /root/${SCOPE}`" = "" ]; then \
  echo new socpe: ${SCOPE}. init /root/${SCOPE}
  bit init --bare; \
fi

# todo remote resolve

bit start
