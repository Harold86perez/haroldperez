# Backlog de mejoras — haroldperez.com

> Este archivo es distinto a las fases `P-XX_*.md`. No documenta trabajo hecho — es la lista viva de ideas y mejoras que se han discutido con Harold pero aún no se han construido. Cuando Harold pregunte "¿qué está pendiente?", este es el archivo de referencia.
>
> Cuando un ítem se construye, se mueve de aquí a un archivo de fase nuevo en `fases_plan/` y se elimina de esta lista (o se marca `[hecho el AAAA-MM-DD, ver P-XX]`).

Última actualización: 2026-07-13

---

## Seguridad y accesibilidad (nuevo — auditoría del 2026-07-13)

- [x] **Favicon** — no existía en ninguna página. Agregado `favicon.svg` (marca "H" en tinta/salvia) enlazado en las 26 páginas. *(Hecho 2026-07-13, ver P-06)*
- [x] **Checkbox de consentimiento explícito** en los formularios de `/recurso-act5/` y `/recurso-dbt/` — antes solo había un texto de advertencia pasivo, no una casilla que el usuario marca y que enlaza a `/privacidad/`. Bajo la Ley 1581/2012 el consentimiento debe ser expreso; una casilla obligatoria es más defendible legalmente. *(Hecho 2026-07-13, ver P-06)*
- [x] **`rel="noopener noreferrer"`** en los 154 links `target="_blank"` del sitio — protege contra "reverse tabnabbing" (la página abierta podía, en teoría, manipular la pestaña de origen). *(Hecho 2026-07-13, ver P-06)*
- [ ] **Auditar contraste de color** — varios textos secundarios usan opacidad 0.4–0.45 sobre fondo oscuro (subtítulos, footer, dropdown). No se ha medido con una herramienta de contraste (ej. Lighthouse); candidato a no cumplir WCAG AA para usuarios con baja visión.
- [ ] **Archivo `_headers` con cabeceras de seguridad** — Cloudflare permite declarar protecciones explícitas (anti-clickjacking, forzar HTTPS, etc.) vía un archivo `_headers` en la raíz. Hoy el sitio depende solo de los valores por defecto de Cloudflare. No es urgente, pero es una capa barata de agregar.

## Arquitectura (para considerar si el sitio sigue creciendo)

- [ ] **Sistema de plantillas** — cada página repite manualmente el botón de WhatsApp, el nav completo y el script de apertura de menú. Es consecuencia de la decisión (correcta hasta ahora) de mantener HTML puro sin build tools. Funciona porque los cambios masivos se automatizan con scripts, pero con 26+ páginas cualquier cambio sitio-completo es más lento y más fácil de dejar una página desincronizada (ya pasó dos veces: el nav y el hueco del dropdown). Si el sitio sigue creciendo, valdría la pena evaluar un generador de sitio estático simple (ej. Eleventy/Astro) que siga produciendo HTML puro al final, pero con plantillas reales durante el desarrollo. No es urgente ahora.

## Visual / estética

- [ ] **Fotografía real adicional** — fotos de sesiones, talleres o del espacio físico (si Harold tiene disponibles), para dar más textura al sitio más allá del retrato personal.
- [x] **Ilustraciones o iconografía propia** — motivo ilustrado propio (círculos/curvas orgánicas en salvia) agregado como acento decorativo en los heroes del inicio y de todas las subpáginas. *(Hecho 2026-07-13, ver P-05)*
- [x] **Micro-animaciones al hacer scroll** — las secciones ahora aparecen suavemente al entrar en el viewport, en las 24 páginas. *(Hecho 2026-07-13, ver P-05)*

## Conversión / ventas

- [ ] **Video corto (60–90 seg)** de Harold hablando a cámara en el inicio — genera más confianza que solo texto.
- [ ] **Testimonios en video o audio**, no solo texto escrito.
- [ ] **Casos de éxito con datos medibles** (ej. "3 de cada 4 personas que completan el proceso reportan X").
- [ ] **Vista previa de contenido de ebooks** — índice de capítulos o muestra de páginas antes de comprar, para reducir la incertidumbre de compra.
- [ ] **CTA al final de cada artículo del blog** — confirmar que los 6 artículos actuales siempre terminan en una acción concreta (descarga, agendar, leer otro artículo). Revisar consistencia.

## Funcionalidad / técnico

- [x] **Página 404 personalizada** — `/404.html` con la identidad visual del sitio y links de salida (inicio, servicios, blog, ebooks, sobre mí). *(Hecho 2026-07-13, ver P-05)*
- [ ] **Newsletter propia** — Resend ya está configurado; falta el formulario de suscripción y la lógica de captura, para construir audiencia propia sin depender de redes sociales.
- [ ] **Formulario de contacto propio** en `/contacto/` — hoy todo redirige a WhatsApp o `mailto:`; no hay forma de capturar un lead sin salir del sitio.
- [ ] **Google Analytics (GA4)** — Search Console ya está conectado (mide qué busca la gente y cómo aparece el sitio en Google), pero GA4 es distinto: mide qué hacen los visitantes *dentro* del sitio. Sin GA4 no se puede medir conversión real de formularios o botones.
- [ ] **Página `/gracias/`** — de confirmación tras enviar un formulario. Solo tiene sentido una vez esté GA4 conectado, para poder medirla como conversión.
- [ ] **Revisar el nav en pantallas de 1366px** (la resolución más común en Colombia) — confirmar que no se ve apretado con los 9 ítems + dropdown ya implementados.

## Contenido / páginas nuevas (solo cuando haya contenido real que poner)

- [ ] **`/sobre/cv/`** — hoja de vida académica completa (publicaciones, formación, cargos). Requiere que Harold provea el contenido real; no se debe inventar.
- [ ] **`/academia/talleres/`** — catálogo de talleres con fecha, modalidad y precio. Tiene sentido cuando haya talleres agendados con esos datos reales.
- [ ] **Categorías/etiquetas en el blog** — filtro simple dentro de `/blog/` (sin crear rutas nuevas tipo `/blog/categoria/ansiedad/`) para no generar mantenimiento extra.

## Explícitamente descartado (no construir salvo que Harold lo pida de nuevo)

- ~~`/kline/lista-de-espera/`~~ — Harold confirmó que no es necesaria.
- ~~Dividir `/contacto/` en `/contacto/individual/` y `/contacto/institucional/`~~ — ya está resuelto con tarjetas separadas en una sola página.
- ~~Meter Academia dentro del dropdown de Servicios~~ — Academia tiene identidad propia en el nav, no debe enterrarse.
- ~~Renombrar `/ebooks/` a `/recursos/`~~ — ya existe una página `/recursos/` con otro propósito (noindex); generaría confusión.
