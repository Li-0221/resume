#!/usr/bin/env bash
set -euo pipefail

resume_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
pdf_name='李立-简历-v10.pdf'
remote_host='server-134'
remote_dir='/var/www/resume.inwe-ai.com'

for file in index.html "$pdf_name"; do
  if [[ ! -s "$resume_dir/$file" ]]; then
    printf 'Missing or empty file: %s\n' "$resume_dir/$file" >&2
    exit 1
  fi
done

if ! rg -q -F "$pdf_name" "$resume_dir/index.html"; then
  printf 'The PDF link in index.html does not match %s\n' "$pdf_name" >&2
  exit 1
fi

ssh -o BatchMode=yes "$remote_host" "install -d -m 755 '$remote_dir'"
rsync -av -e 'ssh -o BatchMode=yes' "$resume_dir/index.html" "$resume_dir/$pdf_name" "$remote_host:$remote_dir/"
ssh -o BatchMode=yes "$remote_host" "chmod 644 '$remote_dir/index.html' '$remote_dir/$pdf_name' && test -s '$remote_dir/index.html' && test -s '$remote_dir/$pdf_name'"

printf 'Uploaded resume to %s:%s\n' "$remote_host" "$remote_dir"
printf 'Site URL: https://resume.inwe-ai.com/\n'
