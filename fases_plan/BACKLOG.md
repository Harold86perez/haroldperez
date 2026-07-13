# Backlog de mejoras — haroldperez.com

> Este archivo es distinto a las fases `P-XX_*.md`. No documenta trabajo hecho — es la lista viva de ideas y mejoras que se han discutido con Harold pero aún no se han construido. Cuando Harold pregunte "¿qué está pendiente?", este es el archivo de referencia.
>
> Cuando un ítem se construye, se mueve de aquí a un archivo de fase nuevo en `fases_plan/` y se elimina de esta lista (o se marca `[hecho el AAAA-MM-DD, ver P-XX]`).

Última actualización: 2026-07-13

---

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
