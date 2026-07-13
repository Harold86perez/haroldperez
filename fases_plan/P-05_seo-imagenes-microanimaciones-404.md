# P-05 — SEO técnico, optimización de imágenes, micro-animaciones, iconografía propia y 404

## Origen y contexto

Tras conectar Google Search Console, Harold pidió: (1) revisar por qué la foto del hero no se ve en móvil vertical, (2) hacer Schema markup y optimización de imágenes para SEO, (3) crear un archivo de pendientes consolidado, y (4) empezar a construir 3 mejoras puntuales: micro-animaciones al hacer scroll, iconografía/ilustraciones propias, y una página 404 personalizada.

- **Solicitado por:** Harold
- **Fecha de apertura:** 2026-07-13
- **Prioridad:** Alta
- **Páginas o archivos involucrados:** `style.css`, `index.html`, `recurso-dbt/`, `logos/*`, imágenes de `/proyectos-sociales/`, las 24 páginas del sitio (script de scroll-reveal), `404.html` (nuevo), `fases_plan/BACKLOG.md` (nuevo)

## Decisiones de diseño

| Decisión | Alternativa descartada | Razón |
|---|---|---|
| Foto del hero visible en móvil vertical (antes `display:none`) | Dejarla oculta como estaba | Harold reportó el problema directamente; ocultarla escondía contenido de marca en el dispositivo más usado por la audiencia |
| Optimización de imágenes con PowerShell + .NET `System.Drawing` | Instalar ImageMagick/cwebp | No había herramientas de imagen disponibles en el entorno; .NET ya viene con Windows y permitió redimensionar/recomprimir sin instalar nada nuevo |
| Mantener formato JPEG/PNG en vez de convertir a WebP | Convertir todo a WebP | Sin herramientas de conversión WebP disponibles (`cwebp` no instalado). La reducción de tamaño ya se logró vía resize + recompresión; WebP queda como mejora futura si se instala tooling adecuado |
| Verificación de seguridad en el script de optimización (descartar el resultado si sale más pesado) | Aplicar el resize a ciegas | La primera corrida sin esta verificación empeoró `harold.png` (72KB → 370KB) y `logo-ucp.png`; se corrigió el script para todas las corridas siguientes |
| Scroll-reveal a nivel de `<section>` completa, vía JS que auto-detecta secciones (sin tocar el HTML de cada página) | Marcar manualmente cada tarjeta/elemento con una clase en cada página | Con 24 páginas de estructura distinta, marcar elemento por elemento era inviable y propenso a error; revelar la sección completa da el mismo efecto visual con cero riesgo de romper markup existente |
| Progressive enhancement: el contenido es visible por defecto; solo se anima si JS carga (clase `.js-ready` en `<html>`) | Ocultar por CSS puro desde el inicio | Si JS falla o tarda, el contenido nunca debe quedar invisible — es más importante la accesibilidad/SEO que la animación |
| Iconografía propia como un único motivo SVG inline (data URI) reutilizado en todos los heroes, en vez de un ícono por sección | Diseñar un ícono distinto para cada página | Con el tiempo disponible, un motivo cohesivo y consistente en todo el sitio da más identidad de marca que muchos íconos sueltos sin relación entre sí |
| `404.html` en la raíz del proyecto | Configurar una redirección en `_redirects` | Cloudflare Pages sirve automáticamente `/404.html` para cualquier ruta no encontrada — es la convención nativa, no requiere configuración adicional |
| `fases_plan/BACKLOG.md` como lista viva separada de las fases `P-XX` | Meter la lista de pendientes dentro de CLAUDE.md | CLAUDE.md es solo para identidad/arquitectura (regla de oro del proyecto); un backlog de ideas cambia constantemente y no debería vivir ahí |

## Entregables

- [x] Foto del hero visible en móvil vertical, con badge de "16+ años" reposicionado para no desbordar
- [x] Corregido doble `<h1>` en `/recurso-dbt/` (SEO)
- [x] Schema markup JSON-LD: `ProfessionalService` + `Person` en el inicio, `Article` en los 6 artículos del blog
- [x] Imágenes de `/logos/` optimizadas (1.5 MB → 488 KB)
- [x] Imágenes de `/proyectos-sociales/` optimizadas (4 fotos, de 166–363 KB a 65–123 KB)
- [x] `loading="lazy"` en logos y fotos de autor del blog (no en el hero, que debe cargar de inmediato)
- [x] `fases_plan/BACKLOG.md` creado con todas las mejoras pendientes discutidas hasta ahora
- [x] Micro-animaciones de scroll-reveal en las 24 páginas del sitio (CSS + JS vanilla, sin frameworks)
- [x] Motivo ilustrado propio (círculos/curvas en salvia) en el hero del inicio y en el hero compartido de todas las subpáginas
- [x] `/404.html` con identidad visual del sitio y links de salida

## Checklist de testing manual

- [ ] Confirmar en un celular real, en vertical, que la foto del hero se ve bien y el badge no se sale de la pantalla
- [ ] Revisar cada página del sitio y confirmar que las secciones aparecen suavemente al hacer scroll, sin parpadeos ni saltos
- [ ] Confirmar que con JavaScript deshabilitado el contenido de cada página sigue siendo completamente visible (verificación de accesibilidad)
- [ ] Visitar una URL inexistente del dominio (ej. `haroldperez.com/pagina-que-no-existe`) y confirmar que se ve la página 404 personalizada, no la de Cloudflare
- [ ] Verificar en [Rich Results Test de Google](https://search.google.com/test/rich-results) que el Schema markup del inicio y de un artículo del blog no tiene errores
- [ ] Revisar visualmente 2–3 logos optimizados en el navegador para confirmar que no perdieron nitidez
- [ ] Confirmar que el motivo ilustrado del hero no interfiere con la lectura del texto en ningún tamaño de pantalla

## Bitácora de implementación

### 2026-07-13
- Se corrigió `hero-photo-wrap { display: none; }` en móvil — causa raíz de que la foto solo se viera en horizontal. Se reemplazó por un ancho máximo centrado.
- Se auditó el SEO del sitio: canonical y alt-text ya estaban bien en todas las páginas; se encontró y corrigió un doble `<h1>` en `/recurso-dbt/`.
- No había herramientas de optimización de imágenes en el entorno (`ImageMagick`, `cwebp` no disponibles). Se usó PowerShell con `System.Drawing` de .NET para redimensionar y recomprimir.
- Primera corrida del script sin verificación de seguridad empeoró `harold.png` y `logo-ucp.png` (los volvió más pesados al re-codificar un PNG ya bien comprimido con un encoder más simple). Se detectó al revisar los resultados, se revirtieron esos dos archivos con `git checkout`, y se agregó una verificación en las corridas siguientes que descarta el resultado si termina pesando más que el original.
- Se agregó Schema markup JSON-LD, validado sintácticamente con `JSON::PP` de Perl antes de confirmar.
- Se creó `fases_plan/BACKLOG.md` consolidando todas las ideas de mejora discutidas en conversaciones anteriores (visual, ventas, funcionalidad, contenido) más lo explícitamente descartado, para no reconstruir la lista de memoria cada vez que Harold pregunte qué falta.
- Se implementó scroll-reveal como mejora progresiva: por defecto todo el contenido es visible (sin JS o si falla, nada se oculta); solo si el JS carga se agrega la clase `.js-ready` y las secciones (excepto la primera de cada página) se animan al entrar en el viewport vía `IntersectionObserver`. Se incluyó `prefers-reduced-motion` para respetar la preferencia de accesibilidad del sistema operativo.
- Se diseñó un motivo SVG propio (círculos y curvas orgánicas en salvia, estilo línea fina) como watermark decorativo, agregado vía `background-image` a `.hero-bg::after` (inicio) y `.page-hero::after` (compartido por todas las subpáginas) — cambio centralizado en CSS que no requirió tocar el HTML de cada página individual.
- Se creó `/404.html` siguiendo el mismo sistema visual del sitio (nav, WhatsApp flotante, tipografía), con CTA de vuelta al inicio y links a las secciones más relevantes.

**Estado final:** ✅ Completado — 2026-07-13 (pendiente verificación visual de Harold: foto en móvil, scroll-reveal, 404, y validación del Schema markup en Rich Results Test)
