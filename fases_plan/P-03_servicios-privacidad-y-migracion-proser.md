# P-03 — Páginas de Servicios, Política de Privacidad y migración de /proser/ y /organizacional/

## Origen y contexto

Al planificar la construcción de "página de consulta individual" y "página para clientes B2B" (prioridades 1 y 2 del roadmap de negocio de Harold), se descubrió que **ese contenido ya existía** en el sitio, pero oculto:

- `/proser/` tenía `noindex` y no estaba en el nav principal ni en el sitemap — pese a ser exactamente la página de consulta individual necesaria.
- `/organizacional/` era una página huérfana (no enlazada desde ningún nav, footer ni sitemap) que ya cubría el contenido B2B.

En vez de duplicar contenido, se decidió con Harold migrar y renombrar ambas páginas a una estructura pública y consistente bajo `/servicios/`, y aprovechar el trabajo para construir también la política de privacidad (obligatoria por Ley 1581/2012, dado que el sitio captura datos en formularios).

- **Solicitado por:** Harold (continuación de los puntos 4, 5 y 6 de la lista de priorización acordada)
- **Fecha de apertura:** 2026-07-12
- **Prioridad:** Alta
- **Páginas o archivos involucrados:** `/proser/` (eliminada), `/organizacional/` (eliminada), `/servicios/`, `/servicios/consulta/`, `/servicios/empresas/`, `/privacidad/`, `_redirects`, `sitemap.xml`, `robots.txt`, nav y footer de las 21 páginas existentes.

## Decisiones de diseño

| Decisión | Alternativa descartada | Razón |
|---|---|---|
| Renombrar `/proser/` → `/servicios/consulta/` y hacerla pública/indexable | Mantenerla oculta y crear una página nueva desde cero | Harold confirmó explícitamente esta opción; evita duplicar contenido ya construido y probado |
| Renombrar `/organizacional/` → `/servicios/empresas/` y hacerla pública | Fusionarla con `/membresia/` o dejarla como estaba | Harold delegó la decisión ("haz lo que consideres pertinente"); se eligió emparejarla con `/servicios/consulta/` para dar una estructura `/servicios/` consistente y fácil de navegar |
| Crear página hub `/servicios/` que enlaza a ambas | Poner las dos como ítems separados en el nav | Evita saturar el nav (ya son 8 ítems); un solo link "Servicios" lleva a un punto de decisión claro para el visitante |
| Responsable de datos en política de privacidad: Harold David Pérez Ramírez (persona natural) | ProSer como entidad | Confirmado explícitamente por Harold |
| Redirecciones 301 vía archivo `_redirects` (soportado nativamente por Cloudflare Pages) | Dejar las URLs viejas como página en blanco o 404 | Preserva cualquier tráfico o enlace externo existente a `/proser/` u `/organizacional/`; evita pérdida de SEO |
| Insertar link "Servicios" en el nav de las 21 páginas existentes, sin rediseñar el nav completo | Aprovechar para unificar todo el nav (fase 14 del roadmap) | Se mantiene el alcance de esta fase acotado; la unificación completa del nav queda como fase separada (14, ya en curso parcialmente) |

## Entregables

- [x] `/servicios/index.html` — página hub con 2 tarjetas (Consulta Individual, Empresas y organizaciones)
- [x] `/servicios/consulta/index.html` — contenido migrado de `/proser/`, sin noindex, indexable
- [x] `/servicios/empresas/index.html` — contenido migrado de `/organizacional/`, indexable
- [x] `/privacidad/index.html` — política de tratamiento de datos conforme a Ley 1581/2012
- [x] `_redirects` — 301 de `/proser/*` → `/servicios/consulta/` y `/organizacional/*` → `/servicios/empresas/`
- [x] Carpetas `/proser/` y `/organizacional/` eliminadas del repositorio
- [x] Enlaces a `/proser/` en todo el sitio (nav, footers, tarjetas de servicio del inicio) actualizados a `/servicios/consulta/`
- [x] Link "Servicios" agregado al nav de las 21 páginas existentes
- [x] Link "Política de privacidad" agregado al footer de todas las páginas (excepto `/links/`, que no tiene footer estándar)
- [x] `sitemap.xml` actualizado con las 4 URLs nuevas
- [x] `robots.txt` actualizado (ya no bloquea `/proser/`, que ya no existe)
- [x] Bug corregido de paso: la tarjeta "Recursos digitales" del inicio enlazaba por error a `/proser/` en vez de `/ebooks/`

## Checklist de testing manual

- [ ] Visitar `/servicios/` y confirmar que ambas tarjetas llevan a las páginas correctas
- [ ] Visitar `/servicios/consulta/` y `/servicios/empresas/` y confirmar que se ven igual que las páginas originales (mismo diseño, sin roturas de estilo)
- [ ] Confirmar que `/proser/` y `/organizacional/` redirigen automáticamente a las nuevas URLs (probar después del deploy en Cloudflare Pages)
- [ ] Revisar en escritorio y móvil que el nav en todas las páginas muestra "Servicios" en la posición correcta
- [ ] Confirmar que el footer de cada página tiene el link "Política de privacidad" y que lleva a `/privacidad/`
- [ ] Verificar que ningún enlace del sitio sigue apuntando a `/proser/` u `/organizacional/`
- [ ] Confirmar visualmente que no hay caracteres corruptos (mojibake) en ninguna página tras los reemplazos automatizados

## Bitácora de implementación

### 2026-07-12
- Al planear las páginas de consulta individual y B2B, se descubrió que `/proser/` y `/organizacional/` ya contenían ese contenido, completo y bien diseñado, pero ocultos (noindex / huérfana). Se consultó a Harold antes de construir nada nuevo.
- Harold confirmó: renombrar `/proser/` a algo bajo `/servicios/` (se eligió `/servicios/consulta/`) y hacerla pública e indexada. Para `/organizacional/` delegó la decisión; se eligió `/servicios/empresas/` para mantener consistencia de URL.
- Se preguntó a Harold quién es el responsable legal para la política de privacidad: confirmó que es él mismo como persona natural (Harold David Pérez Ramírez), no ProSer como entidad.
- Se crearon las 4 páginas nuevas conservando el diseño visual original de `/proser/` y `/organizacional/` (mismo CSS, misma estructura), ajustando solo rutas relativas (`../../style.css` por estar dos niveles de profundidad) y metadatos (canonical, Open Graph).
- Se automatizó con un script Perl el reemplazo de enlaces `/proser/` → `/servicios/consulta/` en las 21 páginas existentes (nav antiguo, footers, tarjetas del inicio), y la inserción del link "Servicios" en el nav estándar.
- **Problema de encoding:** el primer intento del script usó capas `:encoding(UTF-8)` para leer pero el archivo en disco no decodificaba igual (aparecían caracteres `�` en vocales acentuadas). Se resolvió leyendo y escribiendo en modo `:raw` (bytes crudos) en vez de decodificar/recodificar UTF-8, evitando así cualquier doble conversión.
- **Problema de terminadores de línea:** las expresiones regulares que buscaban insertar contenido después de un salto de línea (`\n`) no encontraban coincidencia inicialmente. Se diagnosticó value por valor con scripts de depuración aislados; la causa real no fueron los saltos de línea sino el problema de encoding anterior (una vez resuelto ese, las regex con `\n` funcionaron correctamente).
- Se detectó y corrigió un bug preexistente en `index.html`: la tarjeta de servicio "Recursos digitales" enlazaba por error a `/proser/` en vez de `/ebooks/`.
- Se creó `_redirects` con reglas 301 para no perder tráfico ni SEO de las URLs antiguas.
- Se eliminaron las carpetas `/proser/` y `/organizacional/` del repositorio tras confirmar que ningún enlace interno seguía apuntándoles.
- Se actualizaron `sitemap.xml`, `robots.txt` y `CLAUDE.md` (mapa de arquitectura, axiomas, roadmap) para reflejar la nueva estructura.
- Verificación final por script: 0 referencias rotas a `/proser/` u `/organizacional/`, 0 mojibake, sitemap con 22 URLs.

**Estado final:** ✅ Completado — 2026-07-12 (pendiente verificación visual post-deploy por Harold, ver checklist)
