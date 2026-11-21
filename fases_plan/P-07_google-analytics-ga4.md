# P-07 — Google Analytics 4 (GA4)

## Origen

Harold reportó que la guía de DBT (`/recurso-dbt/`) se ha descargado varias veces
y que varios usuarios mencionaron haber llegado por una recomendación de ChatGPT.
Sin GA4 no había forma de confirmar ni medir ese tráfico: Search Console mide
qué busca la gente en Google, pero no qué hace dentro del sitio (tasa de
conversión del formulario, origen real de la visita, etc.). Item tomado de
`fases_plan/BACKLOG.md` → sección "Funcionalidad / técnico".

## Decisiones de diseño

- **Cuenta y propiedad nuevas**, creadas desde cero en la cuenta de Google de
  Harold (no existía ninguna previa para haroldperez.com). Nombre de cuenta:
  "Harold Pérez". Nombre de propiedad: "haroldperez.com". Zona horaria:
  Colombia (GMT-05:00). Sector: Salud. Tamaño: Pequeña (1-10 empleados).
  Objetivos de negocio: "Generar oportunidades de venta" + "Conocer el
  tráfico web".
- **ID de medición:** `G-Q57673S9VT`.
- **Medición mejorada activada** (config. por defecto de GA4): vistas de
  página, desplazamientos, clics de salida, descargas de archivo, entre
  otros — se activa automáticamente sin tocar código adicional. Esto permite
  medir descargas de PDF (recurso-act5, recurso-dbt) sin instrumentación manual.
- **Snippet gtag.js** insertado manualmente justo después de la línea del
  `<link rel="icon">` en el `<head>` de cada página — mismo punto de anclaje
  en las 25 páginas, consistente con cómo ya se insertan otros tags globales
  (favicon, OG) en este proyecto HTML puro sin build step.
- Se insertó en las 24 páginas públicas indexables **más `404.html`**, para
  medir también errores 404 (útil para detectar links rotos).
- No se tocó ningún archivo CSS ni el worker de formularios — este cambio es
  exclusivamente de medición, no afecta el flujo de descarga de recursos.

## Entregables

- [x] Cuenta y propiedad GA4 creadas.
- [x] Script gtag.js instalado en 24 `index.html` + `404.html` (25 archivos).
- [x] Verificado en servidor local: el `<script src="...googletagmanager...">`
      está presente en el DOM, sin errores de consola.
- [x] Commit y push a `main` (deploy automático vía Cloudflare Pages).

## Bitácora de implementación

- Se creó la cuenta/propiedad GA4 usando el navegador integrado de Claude
  Code, con Harold iniciando sesión manualmente en su cuenta de Google
  (Claude nunca tuvo ni necesitó la contraseña).
- Punto de anclaje elegido: línea `<link rel="icon" type="image/svg+xml"
  href="/favicon.svg" />`, presente de forma idéntica en las 25 páginas —
  permitió insertar el snippet con un script simple sin tocar nada más.
- Verificado que ninguna página tenía ya un script de `googletagmanager.com`
  o llamada a `gtag(` antes de insertar (cero falsos duplicados).
- La petición de red a `googletagmanager.com` no se vio en el navegador de
  prueba local (sandbox puede bloquear salida a dominios externos), pero se
  confirmó que el `<script>` está correctamente en el DOM — se verificará el
  tráfico real en el panel de GA4 ("Tiempo real") una vez el deploy esté
  propagado en producción.

## Checklist de testing manual

- [ ] Abrir haroldperez.com en producción y confirmar en GA4 → Informes →
      Tiempo real que la visita aparece.
- [ ] Completar el formulario de `/recurso-dbt/` o `/recurso-act5/` y
      confirmar que el evento `file_download` aparece en GA4 (medición
      mejorada debería capturarlo automáticamente al abrirse el PDF).
- [ ] Revisar en unos días el informe de adquisición de tráfico para ver si
      aparece tráfico "Direct" o "Referral" coincidente con las menciones de
      ChatGPT.

## Próximos pasos relacionados (quedan en BACKLOG.md)

- Página `/gracias/` de confirmación tras formulario, para medir como
  conversión explícita en GA4.
- Honeypot anti-spam en los formularios de recurso-act5 / recurso-dbt.
