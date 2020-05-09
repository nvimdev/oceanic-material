#!/bin/sh

set -e

framework_file=$1

# cat ${framework_file}

# Custom temporary runtime path for vim
custom_rtp=$(mktemp -d)

# Add color scheme to runtime part
mkdir -p "${custom_rtp}/colors"
cp "${framework_file}" "${custom_rtp}/colors"

# Minimum vimrc file
cat > "${custom_rtp}/.vimrc" <<- EOF
set rtp+=${custom_rtp}
syntax on
color PaperColor
EOF

# Go to temporary directory
cd "$(mktemp -d)" || exit 1

###############################
printf "Check startup status... "
echo | vim -Nu "$custom_rtp/.vimrc" +qa 1>/dev/null 2>err.txt
if grep -q Error err.txt
then
  echo "$framework_file caused starup error"
  sed 's/^.*Error/Error/' err.txt
  exit 1
fi
rm err.txt
echo "ok"
