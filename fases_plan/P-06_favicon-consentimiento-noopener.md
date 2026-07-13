# P-06 — Favicon, consentimiento explícito en formularios y rel=noopener

## Origen y contexto

Tras probar el 404 personalizado, Harold pidió una auditoría de qué otras cosas importantes faltaban para futuras implementaciones. Se revisó el código del sitio y se encontraron 4 hallazgos concretos de seguridad/confianza/accesibilidad. Harold pidió resolver los 3 más rápidos ahora mismo (favicon, `rel="noopener"`, checkbox de consentimiento) y dejar el resto (auditoría de contraste, `_headers`, sistema de plantillas) documentado en el backlog para más adelante.

- **Solicitado por:** Harold
- **Fecha de apertura:** 2026-07-13
- **Prioridad:** Media-Alta
- **Páginas o archivos involucrados:** las 26 páginas del sitio (favicon + noopener), `recurso-act5/`, `recurso-dbt/` (checkbox de consentimiento), `favicon.svg` (nuevo)

## Decisiones de diseño

| Decisión | Alternativa descartada | Razón |
|---|---|---|
| Favicon como SVG inline (`favicon.svg`) con una "H" en tinta/salvia | Generar un PNG/ICO a partir de `harold.png` | Un SVG simple con la inicial de marca es más nítido en cualquier tamaño de pestaña, no depende de recortar una foto, y es coherente con la tipografía del logo del nav |
| Checkbox de consentimiento con atributo HTML `required`, sin tocar el JavaScript de envío | Agregar validación manual en JS antes del `fetch` | La validación nativa del navegador bloquea el evento `submit` completo si un campo `required` no está marcado — el `submit` handler existente (que hace `e.preventDefault()`) ni siquiera se ejecuta hasta que el checkbox esté marcado. Cero riesgo de romper el envío existente |
| `rel="noopener noreferrer"` aplicado a los 154 links `target="_blank"` de una sola pasada con script | Revisar y decidir caso por caso | Se verificó primero que ningún link tuviera ya un atributo `rel` en conflicto (0 coincidencias) — al no haber excepciones, aplicar a todos por igual es seguro y no requiere criterio caso por caso |

## Entregables

- [x] `favicon.svg` creado y enlazado (`<link rel="icon">`) en las 26 páginas del sitio
- [x] `rel="noopener noreferrer"` agregado a los 154 links `target="_blank"` del sitio
- [x] Checkbox de consentimiento obligatorio (enlazando a `/privacidad/`) en los formularios de `/recurso-act5/` y `/recurso-dbt/`, reemplazando el texto de advertencia pasivo que tenían antes
- [x] `fases_plan/BACKLOG.md` actualizado con los 3 hallazgos restantes de la auditoría (contraste de color, `_headers`, sistema de plantillas) para resolver más adelante

## Checklist de testing manual

- [ ] Confirmar en el navegador que la pestaña muestra el favicon "H" en vez del ícono genérico
- [ ] Intentar enviar el formulario de `/recurso-act5/` o `/recurso-dbt/` sin marcar el checkbox y confirmar que el navegador bloquea el envío con su mensaje nativo
- [ ] Confirmar que el link de la política de privacidad dentro del checkbox abre `/privacidad/` en una pestaña nueva sin romper el formulario
- [ ] Verificar en un par de links externos (WhatsApp, Instagram) que siguen funcionando igual que antes tras agregar `rel="noopener noreferrer"`

## Bitácora de implementación

### 2026-07-13
- Se auditó el código en busca de brechas de seguridad/accesibilidad no cubiertas aún: se confirmó ausencia total de favicon, ausencia de cabeceras de seguridad (`_headers`), links `target="_blank"` sin `rel="noopener noreferrer"` (154 casos), y un consentimiento de formulario basado en texto pasivo en vez de checkbox explícito.
- Se creó `favicon.svg` y se insertó el `<link rel="icon">` en las 26 páginas vía script, usando la línea del `<meta name="viewport">` (presente exactamente una vez en cada página) como punto de inserción confiable.
- Se aplicó `rel="noopener noreferrer"` a los 154 `target="_blank"` del sitio con un script, tras confirmar que ninguno tenía ya un atributo `rel` que pudiera generar conflicto.
- Se reemplazó el `<p class="form-disclaimer">` de `/recurso-act5/` y `/recurso-dbt/` por un checkbox `required` con label que enlaza a `/privacidad/`. Se verificó que el handler de envío existente (`form.addEventListener('submit', ...)` con `e.preventDefault()`) no necesitaba cambios, porque la validación nativa del navegador impide que el evento `submit` se dispare si el checkbox no está marcado.
- Se documentaron en `BACKLOG.md` los 3 hallazgos que quedaron pendientes de esta misma auditoría: contraste de color sin medir, falta de archivo `_headers`, y el riesgo estructural de no tener un sistema de plantillas a medida que el sitio crece.

**Estado final:** ✅ Completado — 2026-07-13 (pendiente verificación visual de Harold: favicon en pestaña, bloqueo del formulario sin checkbox)
