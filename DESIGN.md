---
name: haroldperez.com
description: Marca personal de Harold David Pérez Ramírez — psicología, formación y recursos digitales
colors:
  salvia: "#3D7A55"
  salvia-light: "#52A86E"
  tinta: "#1A1A2E"
  tinta-soft: "#2A2A3E"
  arena: "#EBEBEB"
  blanco: "#FAFAF8"
  gris: "#6B7280"
  gris-claro: "#DEDEDE"
  footer-ink: "#0F0F1E"
typography:
  display:
    fontFamily: "Cormorant Garamond, Georgia, serif"
    fontSize: "clamp(2.5rem, 5vw, 4.5rem)"
    fontWeight: 600
    lineHeight: 1.05
    letterSpacing: "-0.01em"
  section-title:
    fontFamily: "Cormorant Garamond, Georgia, serif"
    fontSize: "clamp(2rem, 3.5vw, 3rem)"
    fontWeight: 600
    lineHeight: 1.1
    letterSpacing: "-0.01em"
  body:
    fontFamily: "Inter, system-ui, sans-serif"
    fontSize: "1rem"
    fontWeight: 400
    lineHeight: 1.85
  label:
    fontFamily: "Inter, system-ui, sans-serif"
    fontSize: "0.7rem"
    fontWeight: 600
    lineHeight: 1.4
    letterSpacing: "0.2em"
rounded:
  sm: "2px"
  md: "4px"
  lg: "10px"
  pill: "100px"
spacing:
  sm: "0.5rem"
  md: "1.25rem"
  lg: "2.5rem"
  xl: "4rem"
components:
  button-primary:
    backgroundColor: "{colors.salvia}"
    textColor: "{colors.blanco}"
    rounded: "{rounded.sm}"
    padding: "0.9rem 2rem"
  button-primary-hover:
    backgroundColor: "{colors.salvia-light}"
  button-dark:
    backgroundColor: "{colors.tinta}"
    textColor: "{colors.blanco}"
    rounded: "{rounded.sm}"
    padding: "0.9rem 2rem"
  button-dark-hover:
    backgroundColor: "{colors.salvia}"
  button-outline:
    backgroundColor: "transparent"
    textColor: "{colors.blanco}"
    rounded: "{rounded.sm}"
    padding: "0.9rem 2rem"
  nav-cta:
    backgroundColor: "{colors.salvia}"
    textColor: "{colors.blanco}"
    rounded: "{rounded.sm}"
    padding: "0.55rem 1.25rem"
---

# Design System: haroldperez.com

## 1. Overview

**Creative North Star: "El consultorio editorial"**

haroldperez.com se lee como un espacio clínico serio contado con lenguaje editorial: tinta profunda en el header y el footer, arena y blanco cálido en el cuerpo de las páginas, y el verde salvia como único acento que marca cada punto de contacto. El sistema evita la calidez plana de un sitio de bienestar genérico —nada de iconografía de manos sosteniendo corazones ni gradientes pastel difusos— y en su lugar apuesta por cortes geométricos (clip-path diagonal, notches de esquina), fotografía real del consultorio, y una tipografía display en cursiva Cormorant Garamond que puntúa las frases clave sin gritarlas.

El sitio nunca suena a "corporación": es la marca personal de un profesional, no una entidad. Esa distinción se nota en el tono de cada botón, cada CTA de WhatsApp y cada testimonio anónimo — cercanía humana con rigor clínico de fondo, tal como lo define PRODUCT.md ("cálido, sereno y confiable").

**Key Characteristics:**
- Tinta (#1A1A2E) en nav y footer; arena/blanco en el cuerpo — nunca al revés.
- El salvia es el único acento de color; aparece en botones, eyebrows, dividers y el motivo SVG orgánico del hero, pero en menos del 15% de cada pantalla.
- Cortes geométricos (`clip-path`) reemplazan el uso de bordes o sombras duras como firma visual: franjas diagonales, notches de esquina, CTAs con corte diagonal.
- Cormorant Garamond en cursiva (`em`) marca la palabra que el visitante debe recordar en cada titular.

## 2. Colors

La paleta es restringida: dos neutros (tinta oscura, arena/blanco claro) y un único acento vivo (salvia), sin secundario ni terciario.

### Primary
- **Salvia** (#3D7A55): el acento de marca. Botones primarios, eyebrows, dividers, iconografía SVG del hero, franjas de marca. Es la única fuente de color saturado en el sitio.
- **Salvia Claro** (#52A86E): estado hover de todo lo que usa salvia como base, y variante de acento sobre fondos oscuros (nav, footer, `page-hero` con `em`).

### Neutral
- **Tinta** (#1A1A2E): fondo del nav, del footer y de dropdowns; texto sobre fondos claros en subtítulos display. Es el "negro" de marca — nunca `#000`.
- **Tinta Suave** (#2A2A3E): variante de tinta para superficies ligeramente elevadas (tarjetas oscuras, si existieran).
- **Arena** (#EBEBEB): fondo de `.page-hero` y superficies secundarias; también extremo inicial del degradado de `.foto-real-frame`.
- **Blanco** (#FAFAF8): fondo de body por defecto — un blanco cálido, no `#FFFFFF` puro.
- **Gris** (#6B7280): texto de párrafo (`.lead`) sobre fondo claro.
- **Gris Claro** (#DEDEDE): bordes y divisores discretos.
- **Tinta Footer** (#0F0F1E): fondo del footer, un paso más oscuro que la tinta base para separar la jerarquía visual del final de página.

### Named Rules
**La Regla del Acento Único.** El salvia es el único color saturado del sistema. Si una sección necesita más énfasis, se logra con tipografía (Cormorant en cursiva), corte geométrico o fotografía — nunca añadiendo un segundo color de marca.

## 3. Typography

**Display Font:** Cormorant Garamond (con fallback Georgia, serif)
**Body Font:** Inter (con fallback system-ui, sans-serif)

**Character:** Un serif editorial de alto contraste para los titulares, contra un sans-serif humanista neutro para el cuerpo — el par clásico "revista seria + texto legible", sin geometrismo de startup.

### Hierarchy
- **Display** (600, `clamp(2.5rem, 5vw, 4.5rem)`, line-height 1.05): titular de hero, una sola vez por página. La palabra clave va en `<em>` (cursiva 400, color salvia o salvia-claro).
- **Section title** (600, `clamp(2rem, 3.5vw, 3rem)`, line-height 1.1): encabezado de cada sección interna, mismo patrón de `<em>` que el display.
- **Eyebrow / Label** (600, 0.7rem, letter-spacing 0.2em, mayúsculas): antecede a cada titular de sección; color salvia sobre fondo claro, salvia-claro sobre fondo oscuro.
- **Body / Lead** (400, 1rem, line-height 1.85, max-width 560px): párrafo introductorio de cada sección; color gris sobre fondo claro, `rgba(250,250,248,0.6)` sobre fondo oscuro.
- **Nav / Botones** (500–600, 0.75–0.82rem, letter-spacing 0.06–0.08em, mayúsculas): enlaces de navegación y todos los botones (`.btn-primary`, `.btn-dark`, `.btn-salvia`, `.btn-outline`).

### Named Rules
**La Regla de la Cursiva Única.** Cada titular display o de sección tiene como máximo un fragmento en `<em>` — la palabra que el visitante debe recordar. Nunca dos, nunca el titular completo en cursiva.

## 4. Elevation

El sistema es mayormente plano; la profundidad se transmite con degradados sutiles y `clip-path`, no con sombras duras. Las pocas sombras que existen son difusas y de gran radio, casi ambientales — nunca el `box-shadow` corto y oscuro de una tarjeta Material.

### Shadow Vocabulary
- **Marco de foto** (`box-shadow: 0 20px 50px rgba(26,26,46,0.12)`): bajo `.foto-real-frame`, para despegar la fotografía real del fondo arena/blanco.
- **Dropdown de nav** (`box-shadow: 0 16px 40px rgba(0,0,0,0.35)`): bajo `.nav-dropdown`, sobre fondo tinta.
- **Botón flotante de WhatsApp** (`box-shadow: 0 6px 20px rgba(26,26,46,0.25)`): eleva `.wa-float` sobre cualquier contenido.

### Named Rules
**La Regla del Corte, no la Sombra.** Cuando una sección necesita separarse de la siguiente, el sistema usa `clip-path` diagonal (`.franja-marca`, `.cta-diagonal`) antes que una sombra o un borde. El corte es la firma visual del sitio.

## 5. Components

### Buttons
- **Shape:** esquinas casi rectas (`border-radius: 2px`), nunca pill excepto el botón flotante de WhatsApp (círculo completo).
- **Primary (`.btn-salvia`):** fondo salvia, texto blanco, padding `0.9rem 2rem`, mayúsculas, letter-spacing 0.06em.
- **Dark (`.btn-dark`):** fondo tinta, texto blanco; hover pasa a salvia — es el botón que "se enciende" al pasar el cursor.
- **Outline (`.btn-outline`):** transparente con borde `rgba(255,255,255,0.3)`, usado sobre fondos oscuros (hero); hover aclara el borde a blanco puro.
- **Nav CTA (`.nav-cta`):** versión compacta del botón salvia, padding `0.55rem 1.25rem`, dentro del nav fijo.
- **Hover / Focus:** todas las transiciones de color usan `transition: background 0.2s` o `all 0.2s`; no hay estados de focus visibles distintos del hover — pendiente de verificar accesibilidad de teclado.

### Cards
- **Corner Style:** `.card-notch` recorta la esquina superior derecha con `clip-path` (22px) y la rellena con un triángulo salvia que se aclara a salvia-claro en hover.
- **Spotlight:** `.card-notch::after` añade un radial-gradient que sigue el cursor (`--sx`/`--sy` vía JS de mousemove) — es el único componente interactivo con seguimiento de mouse del sistema.
- **Background:** blanco o arena, nunca tinta (las tarjetas oscuras no existen todavía).
- **Shadow Strategy:** ninguna; la separación viene del `clip-path`, no de elevación.

### Foto real (`.foto-real-frame`)
- **Marco:** degradado arena→blanco (155deg) con padding de 0.75rem y `border-radius: 10px`.
- **Imagen interna:** `border-radius: 6px`, `aspect-ratio: 4/3`, `object-fit: cover`.
- **Uso:** consulta, empresas, colegios, academia y sobre — siempre fotografía real optimizada (<100KB), nunca stock ni ilustración.

### Franjas y cortes de sección
- **`.franja-marca`:** barra de 46px (28px en mobile) con degradado salvia→salvia-claro y `clip-path` diagonal; separador de sección de marca.
- **`.cta-diagonal`:** bloque de CTA final con corte diagonal ascendente y radiales de salvia translúcido; requiere fondo `--arena` inmediatamente antes.

### Navigation
- **Style:** fondo tinta fijo con `backdrop-filter: blur(16px)`, enlaces en mayúsculas 0.78rem, opacidad 0.6 en reposo y blanco puro en hover.
- **Dropdown "Servicios":** se activa por hover (`.nav-dropdown-wrap:hover`), fondo tinta, aparece con fade + translateY de 6px.
- **Mobile:** el menú colapsa a un panel fijo de fondo tinta debajo del nav (`.nav-links.open`), toggle de 3 líneas (`.nav-toggle`).

### Page Hero (subpáginas)
- **Fondo:** arena, con un radial-gradient de salvia translúcido en la esquina superior derecha y un motivo SVG orgánico (círculos y trazos salvia) en la esquina inferior izquierda.
- **Eyebrow:** pill con borde y fondo salvia al 10%/30% de opacidad — único lugar donde el eyebrow lleva contenedor visible en vez de texto plano.

## 6. Do's and Don'ts

### Do:
- **Do** mantener el salvia (#3D7A55 / #52A86E) como único color saturado; todo énfasis adicional se logra con tipografía, corte geométrico o fotografía real.
- **Do** usar fotografía real y optimizada (<100KB) en vez de ilustración genérica — es la prueba de cercanía y seriedad profesional que exige PRODUCT.md.
- **Do** usar `clip-path` para separar secciones (franjas, notches, cortes diagonales) en vez de sombras o bordes de color.
- **Do** mantener los tres botones (`.btn-salvia`, `.btn-dark`, `.btn-outline`) con el mismo padding, radius (2px) y mayúsculas — la familia de botones es una sola.
- **Do** respetar `prefers-reduced-motion` en cualquier animación de scroll (`[data-reveal]`) y mostrar el contenido siempre visible si JS falla.

### Don't:
- **Don't** usar iconografía de stock (manos sosteniendo corazones, siluetas meditando) ni gradientes pastel difusos — es el cliché genérico de bienestar que PRODUCT.md pide evitar explícitamente.
- **Don't** introducir un segundo color de acento saturado; ni siquiera para diferenciar una línea de servicio (consulta vs. empresas vs. colegios) — todas comparten el mismo salvia.
- **Don't** usar `border-left`/`border-right` como franja de color decorativa en tarjetas o callouts; el sistema usa `clip-path`, no bordes laterales.
- **Don't** poner texto en cursiva Cormorant más allá de un fragmento por titular — la cursiva pierde su función de énfasis si se usa en el titular completo.
- **Don't** usar `#000000` o `#FFFFFF` puros; el sistema siempre pasa por tinta (#1A1A2E) o blanco cálido (#FAFAF8).
- **Don't** sonar a "corporación" en ningún copy que acompañe estos componentes — es la marca personal de Harold, nunca una entidad corporativa.
