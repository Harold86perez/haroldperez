# P-02 — Correcciones de consistencia + WhatsApp flotante + Open Graph

## Origen y contexto

Tras el diagnóstico del sitio (propio y uno externo que Harold compartió), se identificaron 3 grupos de mejoras rápidas, de alto impacto y sin necesidad de decisiones adicionales de Harold. Se acordó ejecutarlas en este orden porque no bloquean nada y mejoran consistencia y conversión de inmediato.

- **Solicitado por:** Harold
- **Fecha de apertura:** 2026-07-12
- **Prioridad:** Alta
- **Páginas o archivos involucrados:** Todas las páginas del sitio (21 archivos `index.html`), `style.css`, `sitemap.xml`

## Decisiones de diseño

| Decisión | Alternativa descartada | Razón |
|---|---|---|
| Reemplazar emojis de `/contacto/` por iconos SVG en línea con los colores del sitio | Dejar emojis o usar una librería de iconos externa | Los emojis rompen el axioma "sin emojis"; una librería externa rompe el axioma "sin frameworks/dependencias" |
| Botón de WhatsApp flotante como snippet de HTML/CSS repetido en cada página (no un include, porque el sitio es HTML puro sin build step) | Crear un sistema de includes con JS que inyecte el botón | Mantener la simplicidad del stack; no agregar complejidad de build a un sitio HTML puro |
| Open Graph con imagen genérica (foto de Harold) para todas las páginas, salvo que en el futuro se pidan imágenes específicas por artículo de blog | Diseñar una imagen OG por página desde ya | No hay imágenes personalizadas listas; usar `harold.png` da cobertura inmediata y correcta |
| CTA final del inicio: cambiar "Una conversación de 20 minutos es suficiente..." por una frase sin duración específica | Borrar la sección | El axioma solo prohíbe mencionar "20 minutos", no la sección en sí |

## Entregables

- [ ] `/contacto/index.html`: iconos SVG reemplazan los 5 emojis en las tarjetas de contacto
- [ ] `/index.html`: frase del CTA final ya no menciona "conversación de 20 minutos"
- [ ] `sitemap.xml`: se agrega la URL del artículo `/blog/por-que-la-ansiedad-no-es-el-enemigo/`
- [ ] Botón de WhatsApp flotante visible en las 21 páginas del sitio, con estilo consistente definido en `style.css`
- [ ] Meta tags Open Graph (`og:title`, `og:description`, `og:image`, `og:url`, `og:type`) en las 21 páginas

## Checklist de testing manual

- [ ] Verificar visualmente que el botón de WhatsApp aparece en escritorio y móvil, sin tapar contenido ni el nav
- [ ] Confirmar que el botón abre WhatsApp con el número correcto (3054303746)
- [ ] Compartir un link del sitio (ej. en un chat propio) y verificar que se ve la imagen/título de vista previa
- [ ] Revisar `/contacto/` visualmente: los iconos se ven bien y mantienen la identidad visual
- [ ] Revisar que la frase del CTA final del inicio ya no dice "20 minutos"
- [ ] Verificar que `sitemap.xml` es XML válido después de la edición

## Bitácora de implementación

### 2026-07-12
- Se abre la fase. Se listaron las 21 páginas HTML del sitio.
- Se agregó CSS del botón flotante de WhatsApp en `style.css` (clase `.wa-float`, con versión responsive para móvil).
- Se escribió un script en Perl (no había Node/Python disponibles en el entorno) que recorrió las 21 páginas y:
  - Insertó bloque de meta tags Open Graph (`og:type`, `og:title`, `og:description`, `og:image`, `og:url`) + `twitter:card` justo después del `<meta name="description">` de cada página, usando el título/descripción/canonical existentes de cada una.
  - Para 4 páginas sin `<link rel="canonical">` (`/links/`, `/organizacional/`, `/proser/`, `/recursos/`) se construyó la URL canónica manualmente dentro del script.
  - Insertó el botón de WhatsApp flotante justo después de la apertura de `<body>` en las 21 páginas.
- Se reemplazaron los 5 emojis de `/contacto/index.html` (💬 🏢 🎓 🌍 ✉️) por iconos SVG en línea, con el mismo trazo y color (`var(--blanco)`) para mantener la identidad visual.
- Se detectó que la frase "conversación de 20 minutos" aparecía en dos lugares, no solo el CTA final del inicio: también en `/organizacional/index.html` describiendo un paso del proceso. Se corrigieron ambos (inicio: frase reescrita sin mención de duración; organizacional: "reunión breve sin costo").
- Se agregó a `sitemap.xml` la URL del artículo `/blog/por-que-la-ansiedad-no-es-el-enemigo/`, que faltaba desde su creación en una fase anterior.
- Verificación final por script: 0 emojis restantes en contacto, 0 apariciones de "20 minutos" en el sitio, 21/21 páginas con `wa-float`, 21/21 páginas con `og:title`, sitemap con el artículo agregado.

**Estado final:** ✅ Completado — 2026-07-12
