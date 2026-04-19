#!/bin/bash

# Arreglar problemas comunes de markdown

for file in *.md; do
  # 1. Eliminar espacios al final de líneas (ya hecho)
  # 2. Asegurar que haya línea en blanco después de headings
  sed -i '/^#+ /a\' "$file"
  
  # 3. Asegurar que haya línea en blanco antes de headings
  sed -i '/^#+ /{x;/^$/{x;b};x;i\
}
}' "$file"
  
  # 4. Eliminar múltiples líneas en blanco consecutivas
  cat "$file" | cat -s > "${file}.tmp" && mv "${file}.tmp" "$file"
done

echo "✓ Markdown arreglado"
