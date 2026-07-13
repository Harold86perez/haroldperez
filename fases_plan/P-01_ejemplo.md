# P-01 — Plantilla de fase (ejemplo)

> Copia este archivo y renómbralo con el número y nombre de tu nueva fase.
> Ejemplo: `P-03_formulario-contacto.md`
> Llena las secciones **antes** de empezar a escribir código. La bitácora se llena **durante** el trabajo.

---

## Origen y contexto

_¿Por qué existe esta fase? ¿Qué problema resuelve o qué funcionalidad agrega?_

Ejemplo: "El formulario de contacto actual no envía los datos a ningún lado. Necesitamos conectarlo al Worker para que los mensajes lleguen al correo de Harold y queden registrados para la base de datos."

- **Solicitado por:** Harold
- **Fecha de apertura:** AAAA-MM-DD
- **Prioridad:** Alta / Media / Baja
- **Páginas o archivos involucrados:** (ej. `/contacto/index.html`, Worker `haroldperez-formularios`)

---

## Decisiones de diseño

_Las decisiones importantes que se tomaron y el porqué. Esto es lo más valioso del archivo: el razonamiento detrás de cada elección._

| Decisión | Alternativa descartada | Razón |
|---|---|---|
| Ejemplo: Usar Resend para el correo | Usar Gmail SMTP | Resend tiene dominio verificado y mejor entregabilidad |
| | | |

---

## Entregables

_Lista concreta de lo que debe existir cuando esta fase esté terminada._

- [ ] El formulario de `/contacto/` envía los datos al Worker
- [ ] El Worker reenvía el mensaje al correo info@haroldperez.com
- [ ] El usuario recibe un correo de confirmación automático
- [ ] Los datos quedan registrados para la base de datos de leads

---

## Checklist de testing manual

_Antes de hacer el commit final, verificar cada punto en el navegador real (no solo en el código)._

- [ ] Probar el formulario en escritorio (Chrome / Edge)
- [ ] Probar el formulario en móvil
- [ ] Verificar que el correo llega a info@haroldperez.com
- [ ] Verificar que el correo de confirmación llega al usuario
- [ ] Comprobar que los campos requeridos no se pueden omitir
- [ ] Revisar que el mensaje de éxito/error se muestra correctamente

---

## Bitácora de implementación

_Se va llenando durante el trabajo. Anota qué hiciste, qué problema encontraste y cómo lo resolviste._

### AAAA-MM-DD
- Se creó la estructura base del formulario en `/contacto/index.html`
- Problema: el Worker devolvía error 403 — causa: faltaba el header CORS
- Solución: se agregó `Access-Control-Allow-Origin` en la respuesta del Worker

### AAAA-MM-DD
- Se conectó Resend con el dominio haroldperez.com
- Pendiente: definir el texto exacto del correo de confirmación con Harold

---

**Estado final:** ⏳ Pendiente / 🟡 En curso / ✅ Completado — fecha: AAAA-MM-DD
