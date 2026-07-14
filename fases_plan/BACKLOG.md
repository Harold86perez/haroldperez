# Backlog de mejoras — haroldperez.com

> Este archivo es distinto a las fases `P-XX_*.md`. No documenta trabajo hecho — es la lista viva de ideas y mejoras que se han discutido con Harold pero aún no se han construido. Cuando Harold pregunte "¿qué está pendiente?", este es el archivo de referencia.
>
> Cuando un ítem se construye, se mueve de aquí a un archivo de fase nuevo en `fases_plan/` y se elimina de esta lista (o se marca `[hecho el AAAA-MM-DD, ver P-XX]`).

Última actualización: 2026-07-13

---

## 🐛 Bugs de móvil confirmados (nuevo — cruce contra checklist de prosercps.org, 2026-07-13)

- [x] **5 grids con `grid-template-columns` fijo escrito inline en el HTML** — corregido creando la clase compartida `.grid-header-2col` en `style.css` (colapsa a 1 columna en móvil) y aplicándola en `academia/`, `contacto/`, `servicios/colegios/`, `servicios/consulta/`, `servicios/empresas/`. *(Hecho 2026-07-14, ver rediseño visual)*
- [x] **Foto de `/sobre/` oculta en móvil** — quitado el `display:none`; ahora se muestra centrada con `max-width` en el media query. *(Hecho 2026-07-14, ver rediseño visual)*
- [ ] **Probar cada página en un ancho de 375px real** — no se ha hecho de forma sistemática, más allá de los casos puntuales ya encontrados arriba.

## Seguridad y accesibilidad

- [x] **Favicon** — no existía en ninguna página. Agregado `favicon.svg` (marca "H" en tinta/salvia) enlazado en las 26 páginas. *(Hecho 2026-07-13, ver P-06)*
- [x] **Checkbox de consentimiento explícito** en los formularios de `/recurso-act5/` y `/recurso-dbt/` — antes solo había un texto de advertencia pasivo, no una casilla que el usuario marca y que enlaza a `/privacidad/`. Bajo la Ley 1581/2012 el consentimiento debe ser expreso; una casilla obligatoria es más defendible legalmente. *(Hecho 2026-07-13, ver P-06)*
- [x] **`rel="noopener noreferrer"`** en los 154 links `target="_blank"` del sitio — protege contra "reverse tabnabbing" (la página abierta podía, en teoría, manipular la pestaña de origen). *(Hecho 2026-07-13, ver P-06)*
- [ ] **Honeypot anti-spam en los formularios** — `/recurso-act5/` y `/recurso-dbt/` están conectados al Worker pero no tienen ningún campo trampa para bots. Cualquier bot que encuentre el formulario puede enviarlo sin filtro.
- [ ] **Auditar contraste de color** — varios textos secundarios usan opacidad 0.4–0.45 sobre fondo oscuro (subtítulos, footer, dropdown). No se ha medido con una herramienta de contraste (ej. Lighthouse); candidato a no cumplir WCAG AA para usuarios con baja visión.
- [ ] **Archivo `_headers` con cabeceras de seguridad y caché** — Cloudflare permite declarar protecciones explícitas (anti-clickjacking, forzar HTTPS) y reglas de caché para que CSS/JS no se queden "pegados" en el navegador de un visitante cuando el sitio se actualiza. Hoy no existe este archivo; el sitio depende solo de los valores por defecto de Cloudflare.

## SEO — niveles geográficos (nuevo — cruce contra checklist de prosercps.org, 2026-07-13)

- [ ] **`areaServed` en el Schema markup** — el JSON-LD del inicio tiene dirección y teléfono, pero no declara explícitamente el área de servicio (Pereira + Eje Cafetero + alcance internacional para consultas virtuales).
- [ ] **Meta descriptions con más niveles geográficos** — hoy mencionan "Pereira, Colombia" pero no ciudades cercanas ni el alcance internacional de las consultas virtuales, de forma consistente en todas las páginas.
- [ ] **Reforzar menciones geográficas en texto visible** (footer, hero, contacto) — existen 10 menciones de "Risaralda"/"Eje Cafetero" y 4 de "cualquier parte del mundo" en el sitio, pero no aparecen de forma sistemática en cada página.
- [ ] **Google Business Profile** — no se puede verificar desde el código; confirmar con Harold si ya existe y está verificado.
- [ ] **Consistencia NAP (nombre/dirección/teléfono) en directorios externos** — tema externo al sitio, no verificable desde el código.
- ➖ *Meta keywords: no se agregará — Google dejó de usarlas desde 2009, ningún sitio moderno las necesita, aunque aparezca en checklists antiguos.*

## Diseño y estética — nivel prosercps.org (nuevo — cruce del 2026-07-13)

*(Actualizado 2026-07-14 — primera pasada de rediseño construida en el inicio y replicada al resto del sitio)*

- [x] **Tarjetas y secciones con más personalidad** — nueva clase compartida `.card-notch` (esquina cortada con `clip-path` + triángulo salvia + spotlight) aplicada a las tarjetas principales de casi todas las páginas. *(Ver style.css)*
- [~] **Mayor protagonismo de la tipografía de marca** (Cormorant Garamond) — reforzado en la cita y el separador de comillas de `/` (inicio); no se replicó de forma sistemática al resto de páginas.
- [~] **Uso más variado de los colores de marca por sección** — Harold pidió explícitamente revertir el ciclo de colores en las cifras del inicio; queda pendiente explorar esto con más cuidado más adelante.
- [x] **Franja/elemento de marca con más presencia** — nueva clase compartida `.franja-marca` (banda diagonal en degradado salvia) colocada entre el hero y la siguiente sección en prácticamente todas las páginas.
- [~] **Romper la simetría de layouts** — hecho en el inicio (grid de servicios, "Sobre mí") y ya existía en `/proyectos/` y `/proyectos-sociales/`; el resto de páginas mantiene sus grids simétricos originales.
- [x] **Micro-interacción de "spotlight" que sigue el cursor** — implementada vía CSS variables (`--sx`/`--sy`) + JS de `mousemove`, parte de `.card-notch`, aplicada en todo el sitio.
- [x] **Secciones con corte diagonal y textura** — `.franja-marca` y la nueva clase `.cta-diagonal` (corte diagonal + degradado radial verde, usada en CTAs sobre fondo arena) ya se usan en la mayoría de páginas.
- [ ] **Duotono real en fotos** — sigue sin construirse.

## Arquitectura (NO construir salvo que sea estrictamente necesario)

- [ ] **Sistema de plantillas (Eleventy/Astro)** — cada página repite manualmente el botón de WhatsApp, el nav completo y el script de apertura de menú. Es consecuencia de la decisión (correcta hasta ahora) de mantener HTML puro sin build tools. Funciona porque los cambios masivos se automatizan con scripts, pero con 26+ páginas cualquier cambio sitio-completo es más lento y más fácil de dejar una página desincronizada (ya pasó dos veces: el nav y el hueco del dropdown).
  - **Harold decidió explícitamente (2026-07-13) NO hacer esto todavía.** Implica: instalar Node.js y las dependencias del framework (rompe el axioma actual de "sin frameworks"), agregar un paso de build antes de cada deploy, y que Cloudflare tenga que ejecutar ese build en cada push. Se gana consistencia; se pierde la simplicidad de que cualquier archivo `.html` se entiende con solo abrirlo.
  - **Criterio para revisarlo:** solo si el sitio crece mucho más (ej. 60–80+ páginas) o si aparece contenido muy repetitivo (muchos talleres, muchos artículos con la misma estructura) que haga que mantenerlo a mano sea insostenible incluso con scripts. Antes de proponerlo de nuevo, explicar de nuevo qué implica (ver arriba) y esperar confirmación explícita.

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
- ~~Meta keywords~~ — Google no las usa desde 2009; no se agregarán aunque aparezcan en checklists antiguos.

## Ya verificado como correcto (no volver a auditar salvo que algo cambie)

*Confirmado en la auditoría cruzada del 2026-07-13 contra el checklist de prosercps.org:*

- Nav idéntico en las 24 páginas indexables (9 ítems + dropdown de Servicios).
- Cloudflare Pages con auto-deploy desde GitHub funcionando (probado varias veces en esta sesión).
- Los 9 colores hex usados en `style.css` corresponden exactamente a la paleta oficial de marca, no son aproximaciones.
- Cero imágenes por encima de 150 KB en todo el sitio.
- Todas las imágenes tienen texto `alt`.
- Search Console conectado, sitemap enviado y correcto (23 páginas reconocidas).
