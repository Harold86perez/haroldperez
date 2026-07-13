# haroldperez.com — Documento de identidad y arquitectura

> **Regla de oro:** Este archivo solo contiene identidad, axiomas y arquitectura.
> El avance del día a día, las decisiones de diseño y los checklists de cada tarea van en `fases_plan/`, no aquí.
> CLAUDE.md solo se actualiza cuando cambia algo estructural: el stack, los axiomas, o la arquitectura de carpetas.

---

## Identidad del proyecto

| Campo | Valor |
|---|---|
| Nombre | haroldperez.com |
| Propietario | Harold David Pérez Ramírez |
| Tipo de sitio | Marca personal + sitio informativo/comercial (psicología, formación y recursos digitales) |
| Audiencia | Personas en búsqueda de acompañamiento psicológico, empresas interesadas en membresías, profesionales de educación y salud |
| Idioma | Español exclusivamente |
| Editor actual | Solo Harold (con asistencia de Claude Code) |

## Stack técnico

| Capa | Tecnología |
|---|---|
| Frontend | HTML/CSS puro — sin frameworks |
| Tipografía | Cormorant Garamond (display) + Inter (body) — cargadas desde Google Fonts |
| Hosting | Cloudflare Pages — auto-deploy desde GitHub (rama `main`) |
| Repositorio | GitHub: Harold86perez/haroldperez, rama main |
| Backend / formularios | Cloudflare Workers (`haroldperez-formularios.hd-perezramirez.workers.dev`) |
| Almacenamiento | Cloudflare R2 — bucket `haroldperez-recursos` (privado) |
| Correo transaccional | Resend — dominio haroldperez.com verificado, región São Paulo |

## Identidad visual

| Token | Valor |
|---|---|
| Tinta | `#1A1A2E` |
| Salvia | `#3D7A55` |
| Salvia light | `#52A86E` |
| Arena | `#EBEBEB` |
| Blanco | `#FAFAF8` |
| Tipografía display | Cormorant Garamond |
| Tipografía body | Inter |

---

## Axiomas irrompibles

Estas reglas no se negocian ni se cambian sin aprobación explícita de Harold.

### Seguridad y negocio

1. **Privacidad:** El sitio no publica ningún dato identificable de pacientes o consultantes. Los testimonios son siempre anónimos o con descripción genérica (ej. "Paciente individual"). Nunca nombre completo real sin autorización escrita del paciente.

2. **Recursos protegidos:** Los archivos almacenados en R2 (PDFs, guías, ebooks) nunca tienen URL pública directa. Siempre se entregan después de que el usuario completa el formulario correspondiente a través del Worker.

3. **Datos de formularios:** Los datos capturados (nombre, correo, teléfono) se usan exclusivamente para contacto comercial con el usuario que los proveyó. Nunca se venden, ceden ni comparten con terceros.

4. **Datos de contacto:** El único número de WhatsApp/teléfono del sitio es `3054303746`. El orden de correos donde aparezcan juntos es siempre: info@haroldperez.com · harold@haroldperez.com · info@prosercps.org. Ninguno de estos cambia sin autorización explícita de Harold.

5. **Precios y condiciones de venta:** Cualquier precio, descripción de lo que incluye un producto o condición de membresía debe ser confirmado por Harold antes de publicarse.

6. **Idioma:** El sitio es 100 % en español. No se agrega contenido en otro idioma sin autorización de Harold.

7. **Responsable de datos:** El responsable del tratamiento de datos personales ante la Ley 1581 de 2012 es Harold David Pérez Ramírez, como persona natural (no ProSer como entidad). Ver `/privacidad/`.

### Axiomas de ingeniería (convenciones de código)

- **Sin frameworks:** No se introduce React, Vue, ni ningún framework de JS. El sitio es HTML/CSS puro con JS vanilla mínimo.
- **Un solo style.css:** Los estilos globales viven en `/style.css`. Los estilos específicos de una página van en un `<style>` dentro del `<head>` de esa página — no en archivos CSS separados por página.
- **Sin hardcodear URLs del Worker o R2:** Las URLs del Worker y del bucket R2 no se escriben directamente en el HTML del sitio público; se gestionan desde el Worker.
- **Commit siempre después de confirmar:** Ningún cambio se sube a GitHub sin que Harold haya revisado y aprobado el resultado. Todo commit a `main` dispara un deploy automático en Cloudflare Pages.
- **Sin emojis en el sitio:** No se usan emojis en ninguna página pública.
- **Mensajes de WhatsApp pre-llenados:** Nunca incluyen el nombre "Harold" — solo descripción del motivo de contacto.

### Reglas de redacción (aplicar siempre en cualquier texto del sitio)

- Nunca "corporación" — siempre solo "ProSer"
- Reemplazar "24 horas" → "lo antes posible"
- Reemplazar "toda Colombia" → "cualquier parte del mundo"
- Reemplazar "Con base en Pereira" → "Ubicado en Pereira, Risaralda"
- No usar "conversación de 20 minutos" en CTAs
- Reemplazar "triple perfil profesional" → "tres líneas de trabajo especializadas"
- Emails en tags `<p>` individuales, nunca separados por `<br>`
- En español: siempre usar ambos signos de interrogación (¿...?). En inglés solo el de cierre (?)

---

## Mapa de arquitectura de carpetas

```
haroldperez/
│
├── index.html              → Página de inicio (/)
├── style.css               → Hoja de estilos global — única fuente de estilos compartidos
├── harold.png              → Foto de Harold usada en hero y artículos del blog
├── sitemap.xml             → Mapa del sitio para buscadores
├── robots.txt              → Instrucciones para rastreadores (noindex en /links/, /recursos/)
├── _redirects              → Redirecciones 301 de Cloudflare Pages (ej. /proser/ → /servicios/consulta/)
├── wrangler.jsonc          → Configuración de Cloudflare Workers/Pages
│
├── servicios/              → Página hub /servicios/ — enlaza a consulta y empresas
│   ├── consulta/           → Página /servicios/consulta/ — consulta psicológica individual (antes /proser/)
│   ├── empresas/           → Página /servicios/empresas/ — servicios B2B (antes /organizacional/)
│   └── colegios/           → Página /servicios/colegios/ — servicios para instituciones educativas
├── sobre/                  → Página /sobre/ — bio extendida
├── academia/               → Página /academia/ — oferta formativa
├── ebooks/                 → Página /ebooks/ — tienda de recursos digitales
├── membresia/              → Página /membresia/ — planes para empresas
├── kline/                  → Página /kline/ — plataforma Kliné (en desarrollo)
├── proyectos-sociales/     → Página /proyectos-sociales/
├── proyectos/              → Página /proyectos/ — portafolio organizacional
├── contacto/               → Página /contacto/
├── privacidad/             → Página /privacidad/ — política de tratamiento de datos (Ley 1581/2012)
│
├── blog/                   → Índice del blog (/blog/) + subcarpetas por artículo
│   ├── index.html
│   ├── ansiedad-no-es-tu-enemiga/
│   ├── por-que-la-ansiedad-no-es-el-enemigo/
│   ├── regulacion-emocional-que-es-y-por-que-cuesta/
│   ├── que-es-act-y-como-puede-ayudarte/
│   ├── por-que-las-relaciones-de-pareja-se-desgastan/
│   └── aprender-diferente-no-es-aprender-menos/
│
├── recurso-act5/           → Landing de descarga: "5 herramientas ACT" (requiere formulario)
├── recurso-dbt/            → Landing de descarga: recurso DBT (requiere formulario)
│
├── logos/                  → Logos de instituciones/empresas aliadas (usados en proyectos)
│
├── recursos/               → Página de recursos internos (noindex)
├── links/                  → Página de links en bio (noindex)
│
├── 404.html                → Página de error 404 personalizada (Cloudflare Pages la sirve automáticamente)
│
└── fases_plan/             → Documentación de trabajo por fases (no se despliega, solo referencia)
    ├── P-01_ejemplo.md
    └── BACKLOG.md          → Lista viva de mejoras pendientes discutidas con Harold, aún no construidas
```

**Cómo agregar una página nueva:** crear una carpeta con el slug de la URL y un `index.html` dentro. El deploy es automático al hacer push a `main`.

---

## Protocolo de trabajo con fases_plan/

`fases_plan/` es el registro de todo lo que se construye o modifica en el sitio. Su propósito es que en cualquier sesión futura — aunque hayan pasado semanas — sea posible retomar el trabajo sin perder contexto.

**`fases_plan/BACKLOG.md`** es distinto: es la lista viva de ideas y mejoras pendientes que Harold ha mencionado pero aún no se construyen. Cuando Harold pregunte "¿qué está pendiente?", ese es el archivo de referencia — no hay que reconstruir la lista de memoria en cada conversación.

### Cómo abrir una fase

1. Crear un archivo nuevo en `fases_plan/` con el formato `P-XX_nombre-corto.md` (ejemplo: `P-03_formulario-contacto.md`).
2. Llenar las secciones de Origen, Decisiones de diseño y Entregables **antes** de empezar a escribir código.
3. Mencionar el archivo al inicio de la sesión de trabajo para que Claude tenga contexto.

### Cómo registrar avance

- La sección **Bitácora de implementación** se va llenando durante el trabajo: qué se hizo, qué problema apareció, qué se decidió en el camino.
- Si hay una decisión importante que cambia el enfoque original, se registra en **Decisiones de diseño** con la fecha.

### Cómo cerrar una fase

- Completar el **Checklist de testing manual**.
- Cambiar el estado en la tabla de roadmap de este archivo (🟡 → ✅).
- Hacer el commit final y push a GitHub.
- No borrar el archivo de fase — queda como historial.

---

## Roadmap

| # | Fase | Descripción | Estado |
|---|---|---|---|
| 01 | Sitio base | Páginas públicas, estilos globales, nav, footer, robots, sitemap | ✅ Hecho |
| 02 | Blog | Índice del blog + primeros 6 artículos | ✅ Hecho |
| 03 | Formulario de contacto | Integración con Worker + envío por Resend | 🟡 En curso |
| 04 | Descarga de recursos (R2) | Formulario → Worker → entrega de PDF desde R2 (recurso-act5, recurso-dbt) | 🟡 En curso |
| 05 | Ebooks / tienda digital | Página de venta de recursos digitales con pasarela de pago | 🟡 En curso |
| 06 | Membresía | Página de venta de membresías para empresas | 🟡 En curso |
| 07 | Kliné | Plataforma en desarrollo — sección de venta desde el sitio | 🟡 En curso |
| 08 | Página organizacional | Migrada e integrada en `/servicios/empresas/` y `/servicios/colegios/` (ver fases 12 y 15) | ✅ Hecho |
| 09 | Base de datos / CRM de leads | Consolidación de contactos captados por formularios | ⏳ Pendiente |
| 10 | Consistencia + WhatsApp flotante + Open Graph | Emojis, frases prohibidas, sitemap, botón flotante y metadatos OG en las 21 páginas | ✅ Hecho |
| 11 | Página de consulta individual | `/servicios/consulta/` — antes oculta en `/proser/`, ahora pública e indexable | ✅ Hecho |
| 12 | Página para clientes B2B | `/servicios/empresas/` — antes huérfana en `/organizacional/`, ahora pública e indexable | ✅ Hecho |
| 13 | Política de privacidad | Página `/privacidad/` — requerida por Ley 1581 de 2012 | ✅ Hecho |
| 14 | Nav unificado + dropdown de Servicios | Mismo menú en todas las páginas, con dropdown al pasar el cursor sobre "Servicios" (Consulta, Empresas, Colegios) | ✅ Hecho |
| 15 | Página de Colegios | `/servicios/colegios/` — contenido educativo separado de `/servicios/empresas/` | ✅ Hecho |
| 16 | Consolidación de Membresía | Una sola fuente de precios en `/membresia/`; `/servicios/empresas/` solo enlaza a ella | ✅ Hecho |
| 17 | Ebooks en Hotmart | Los 3 ebooks ya tienen precio, link de Hotmart y compra directa por WhatsApp — verificado en `/ebooks/`, no requería trabajo adicional | ✅ Hecho |
| 18 | Google Search Console | Conectado y sitemap enviado (23 páginas descubiertas) | ✅ Hecho |
| 19 | SEO técnico (Schema markup) | JSON-LD `ProfessionalService`/`Person` en el inicio, `Article` en los 6 artículos del blog | ✅ Hecho |
| 20 | Optimización de imágenes | Logos y fotos de `/proyectos-sociales/` redimensionados/recomprimidos; `loading="lazy"` agregado | ✅ Hecho |
| 21 | Micro-animaciones de scroll | Secciones con aparición suave al hacer scroll, en las 24 páginas | ✅ Hecho |
| 22 | Iconografía/ilustración propia | Motivo SVG propio en los heroes del sitio (inicio + subpáginas) | ✅ Hecho |
| 23 | Página 404 personalizada | `/404.html` con identidad visual del sitio | ✅ Hecho |
| 24 | Nuevas fases | Por definir según prioridades de Harold. Ver también `fases_plan/BACKLOG.md` para ideas pendientes de construir | ⏳ Pendiente |
