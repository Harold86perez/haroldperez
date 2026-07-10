# haroldperez.com — Reglas del proyecto

## Stack
HTML/CSS puro (sin frameworks) · GitHub (Harold86perez/haroldperez, rama main) · Cloudflare Pages (auto-deploy desde GitHub) · Cloudflare Workers · Cloudflare R2 · Resend (correos transaccionales)

## Estructura del sitio
Páginas públicas: /, /sobre/, /academia/, /ebooks/, /membresia/, /proyectos-sociales/, /proyectos/, /contacto/, /kline/, /recurso-act5/, /recurso-dbt/
Páginas noindex: /links/, /proser/, /recursos/

## Identidad visual
- Tinta: #1A1A2E
- Salvia: #3D7A55 · Salvia light: #52A86E
- Arena: #EBEBEB · Blanco: #FAFAF8
- Tipografía: Cormorant Garamond (display) + Inter (body)

## Reglas de contenido (aplicar siempre)
- Nunca usar "corporación" — siempre solo "ProSer"
- No emojis en ninguna parte del sitio
- WhatsApp: mensajes pre-llenados nunca incluyen "Harold" por nombre
- Reemplazar "24 horas" → "lo antes posible"
- Reemplazar "toda Colombia" → "cualquier parte del mundo"
- Reemplazar "Con base en Pereira" → "Ubicado en Pereira, Risaralda"
- No usar "conversación de 20 minutos" en CTAs
- Reemplazar "triple perfil profesional" → "tres líneas de trabajo especializadas"
- Emails en tags <p> individuales, nunca separados por <br>
- Orden de correos donde aparezcan: info@haroldperez.com, harold@haroldperez.com, info@prosercps.org
- Un solo número de WhatsApp/teléfono: 3054303746, sin excepciones
- En español: siempre usar ambos signos de interrogación (¿...?), sin excepción. En inglés solo el de cierre (?)

## Contacto
info@haroldperez.com · harold@haroldperez.com · info@prosercps.org
WhatsApp: +57 305 430 3746
Instagram ProSer: @prosercps · Instagram personal: @haroldperez_
LinkedIn: linkedin.com/in/harold86perez

## Infraestructura backend
Worker: haroldperez-formularios.hd-perezramirez.workers.dev
R2 bucket: haroldperez-recursos (privado)
Resend: dominio haroldperez.com verificado, región São Paulo

## Deploy
Cualquier commit a la rama main despliega automáticamente en Cloudflare Pages. Siempre hacer commit y push después de confirmar los cambios con Harold.
