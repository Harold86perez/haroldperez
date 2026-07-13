# P-04 — Dropdown de Servicios, página de Colegios, unificación de membresía y WhatsApp

## Origen y contexto

Tras publicar `/servicios/consulta/` y `/servicios/empresas/` (fase P-03), Harold revisó el resultado y pidió 4 ajustes:

1. Que el nav despliegue las subpáginas de Servicios al pasar el cursor.
2. Separar el contenido educativo (que había quedado mezclado dentro de `/servicios/empresas/`) en su propia página y tarjeta: `/servicios/colegios/`.
3. Entender de dónde salía la tabla de precios por tamaño de empresa vista en `/servicios/empresas/`, porque no coincidía con la página `/membresia/`.
4. Unificar el número de WhatsApp en todos los botones, detectando que algunos usaban un número distinto al oficial.

Al investigar el punto 3 se encontró que **dos páginas describían el mismo producto (la Membresía de Bienestar) con precios y condiciones distintas**: `/membresia/` con precio fijo mensual + descuentos por prepago, y la sección dentro de `/servicios/empresas/` con precios escalonados por tamaño de empresa. Se consultó con Harold antes de resolverlo.

- **Solicitado por:** Harold
- **Fecha de apertura:** 2026-07-12
- **Prioridad:** Alta
- **Páginas o archivos involucrados:** `style.css`, nav de las 24 páginas del sitio, `/servicios/empresas/`, `/servicios/colegios/` (nueva), `/servicios/index.html`, `/membresia/`, `/proyectos-sociales/`

## Decisiones de diseño

| Decisión | Alternativa descartada | Razón |
|---|---|---|
| Dropdown de Servicios con CSS puro (`:hover`), estático en mobile | JavaScript para manejar el menú | Consistente con el axioma "sin frameworks"; un dropdown de hover no necesita JS, y en mobile no hay hover, así que se muestra siempre expandido |
| `/servicios/colegios/` como página propia + tarjeta propia en el hub | Mantenerlo como ítem dentro de `/servicios/empresas/` | Harold lo pidió explícitamente; el contenido educativo (orientación vocacional, bienestar escolar, formación docente) merece su propio espacio y no compite bien al lado de riesgo psicosocial/talleres corporativos |
| Una sola página de membresía: `/membresia/` con precios; `/servicios/empresas/` solo describe servicios y enlaza a `/membresia/` | Mantener dos tablas de precios distintas, o fusionar todo el contenido de precios dentro de `/servicios/empresas/` | Harold lo confirmó explícitamente como la opción recomendada; evita mostrarle al mismo cliente dos precios distintos para lo que se supone es el mismo producto |
| WhatsApp único: `3054303746` en todo el sitio | Mantener un número distinto para ProSer/empresarial | Harold confirmó que es el mismo número que ya usa para lo laboral; se corrigió `/membresia/` y `/proyectos-sociales/`, que usaban por error `3103700817` |

## Entregables

- [x] CSS de dropdown agregado a `style.css` (`.nav-dropdown-wrap`, `.nav-dropdown`), con comportamiento distinto en desktop (hover) y mobile (siempre visible, indentado)
- [x] Dropdown con 3 links (Consulta Individual, Empresas y organizaciones, Colegios) insertado en el ítem "Servicios" del nav de las 24 páginas del sitio
- [x] `/servicios/colegios/index.html` — página nueva con 5 servicios educativos (orientación vocacional grupal, bienestar socioemocional escolar, formación docente, primera respuesta emocional, evaluación neuropsicológica)
- [x] `/servicios/empresas/`: se removió el ítem "Programas para Instituciones Educativas" (movido a colegios) y se agregó nota cruzada hacia `/servicios/colegios/`
- [x] `/servicios/empresas/`: sección de precios escalonados reemplazada por un bloque simple que enlaza a `/membresia/`
- [x] `/servicios/index.html`: hub actualizado de 2 a 3 tarjetas (Consulta, Empresas, Colegios)
- [x] Footers de las páginas de servicios actualizados con el link a Colegios
- [x] Número de WhatsApp corregido en `/membresia/` y `/proyectos-sociales/` (de `3103700817` a `3054303746`)
- [x] Correo corregido en `/membresia/` (de `harold.perez@prosercps.org` a `info@haroldperez.com`, respetando el orden de correos del axioma)

## Checklist de testing manual

- [ ] En escritorio, pasar el cursor sobre "Servicios" en el nav y confirmar que despliega los 3 links correctamente, sin parpadeos ni saltos de layout
- [ ] En móvil, abrir el menú y confirmar que el submenú de Servicios aparece siempre visible e indentado debajo del link principal
- [ ] Visitar `/servicios/colegios/` y confirmar que se ve consistente con el resto de páginas de servicios
- [ ] Confirmar que `/servicios/empresas/` ya no menciona precios escalonados y que el botón "Conocer la Membresía de Bienestar" lleva a `/membresia/`
- [ ] Revisar que todos los botones de WhatsApp del sitio (incluyendo `/membresia/` y `/proyectos-sociales/`) usan el número `3054303746`
- [ ] Confirmar visualmente que no quedaron caracteres corruptos tras los reemplazos automatizados

## Bitácora de implementación

### 2026-07-12
- Se revisó `/membresia/` a fondo para responder la pregunta de Harold sobre el origen de los precios: se confirmó que existían dos modelos de precio distintos para lo que aparenta ser el mismo producto.
- Se detectó de paso que `/membresia/` y `/proyectos-sociales/` usaban un número de WhatsApp incorrecto (`3103700817`) y un correo no estándar (`harold.perez@prosercps.org`), lo cual viola axiomas del proyecto. Se corrigieron ambos con `perl -i -pe`.
- Se agregó el CSS del dropdown a `style.css`, con una versión de escritorio (position:absolute, hover) y una versión mobile dentro del media query existente (position:static, siempre visible).
- Se automatizó con un script Perl (modo `:raw` para evitar problemas de encoding ya conocidos de fases anteriores) la inserción del dropdown en el ítem "Servicios" del nav, cubriendo tanto la variante activa (con estilo de página actual) como la variante normal.
- 4 páginas con un patrón de nav más antiguo (`blog/index.html`, `blog/regulacion-emocional-que-es-y-por-que-cuesta/`, `recurso-act5/`) no coincidieron con el patrón del script y se corrigieron manualmente uno por uno. `links/index.html` no tiene nav (es una página de bio-links) y se dejó sin cambios correctamente.
- Se creó `/servicios/colegios/` con 5 servicios educativos, reutilizando el mismo sistema visual (`org-servicios`/`org-item`) que ya existía en `/servicios/empresas/`.
- Se removió el ítem educativo de `/servicios/empresas/` y se renumeraron los ítems restantes.
- Se reemplazó la sección de precios escalonados de `/servicios/empresas/` por un bloque simple con CTA hacia `/membresia/`, siguiendo la opción que Harold confirmó como recomendada.
- Verificación final por script: 24 páginas con dropdown, 0 páginas con nav sin dropdown (excepto `/links/`, correctamente excluida), 0 mojibake, un solo número de WhatsApp en todo el sitio, 0 referencias rotas a URLs antiguas.

### 2026-07-12 (continuación — bug del dropdown + puntos 7 y 8)
- Harold reportó que el dropdown se veía pero no se podía interactuar con los links: al bajar el cursor hacia el menú, este se cerraba antes de llegar. Causa: el `margin-top` entre el trigger y el `.nav-dropdown` dejaba un hueco no-hoverable donde el `:hover` del `<li>` se perdía.
- Corregido con la técnica estándar de "puente invisible": `.nav-dropdown-wrap` ahora tiene `padding-bottom: 14px; margin-bottom: -14px` (el padding extiende el área hoverable del `<li>` sin afectar el layout de los hermanos, gracias al margen negativo que lo compensa). Se agregó también `pointer-events: none/auto` como refuerzo. La versión mobile resetea estos valores a 0 ya que ahí el submenú es siempre estático y visible.
- **Punto 7 (nav unificado):** se auditaron las 24 páginas y se encontraron inconsistencias reales: `servicios/index.html`, `servicios/consulta/`, `servicios/empresas/`, `servicios/colegios/` y `privacidad/` no tenían el link "Proyectos"; `blog/index.html` y `blog/regulacion-emocional-que-es-y-por-que-cuesta/` conservaban un nav antiguo mucho más corto (sin Ebooks, Membresía, Kliné, Proyectos) heredado de antes de esta serie de cambios; `recurso-act5/` usaba `/#sobre` en vez de `/sobre/` (un ancla que solo existe en la home, rota en cualquier otra página). Se corrigieron los 3 casos. El nav de las 24 páginas quedó con el mismo set de 9 ítems (Sobre mí, Servicios + dropdown, Academia, Ebooks, Membresía, Kliné, Proyectos, Blog, Contacto).
  - Nota: al automatizar la corrección de `blog/index.html` con un script, una verificación mal diseñada (`unless ($c =~ m{href="/ebooks/"})`) buscaba en todo el archivo en vez de solo en el nav — como el footer de esas páginas ya tenía un link a `/ebooks/`, el script asumió que el nav ya estaba completo y no hizo nada. Se detectó al verificar el resultado y se corrigió aplicando la sustitución directamente sin esa guarda.
- **Punto 8 (ebooks en Hotmart):** antes de pedir links de checkout a Harold, se revisó `/ebooks/index.html` y se encontró que **ya estaba completamente conectado** — los 3 ebooks tienen precio visible, botón "Comprar en Hotmart" con el link real de checkout (`go.hotmart.com/...`) y botón alternativo de compra directa por WhatsApp, más un CTA final a la tienda de Hotmart (`hotmart.com/es/club/prosercps`). No se requería ningún trabajo adicional; se corrigió el diagnóstico previo que asumía lo contrario.
- Verificación final: 24/24 páginas con exactamente 9 ítems de nav estándar, 0 mojibake.

**Estado final:** ✅ Completado — 2026-07-12 (pendiente confirmación visual de Harold sobre el dropdown ya funcional)
