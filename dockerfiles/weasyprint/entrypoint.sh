#! /bin/bash
if [ "$#" -ne 2 ]; then
  echo "Usage: docker run -v $(pwd):/src weasyprint source.md out.pdf"
  exit 1
fi

pandoc \
  --from gfm \
  --pdf-engine weasyprint \
  --output $2 $1
