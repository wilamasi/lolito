# Lolito

*Tu aliado en tu manejo de minutos interpretados.*

Lleva la cuenta de lo trabajado como intérprete: shifts (bloques de :00 a :00, se cobra cada segundo) y freelance OPI/VRI (se cobran minutos completos), el plan de la semana, la meta del ciclo y lo cobrado mes a mes.

Es un solo `index.html`, sin instalar nada. Los datos se guardan en Supabase (o, sin configurarlo, solo en el navegador).

## Ponerla en marcha

### 1. Supabase
1. Crea un proyecto nuevo en [supabase.com](https://supabase.com).
2. En **SQL Editor**, pega el contenido de `supabase.sql` y pulsa **Run**.
3. En **Authentication → Users → Add user → Create new user**, crea tu usuario (correo y contraseña) y marca **Auto Confirm User**.
4. En **Authentication → Sign In / Providers**, desactiva **Allow new users to sign up**, así nadie más puede crear una cuenta.
5. En **Project Settings → API**, copia la **Project URL** y la **Publishable key**.

### 2. Conectar la app
En `index.html`, busca estas dos líneas y pega ahí los datos del paso anterior:

```js
var SUPABASE_URL = '';
var SUPABASE_KEY = '';
```

La clave publicable puede ir en el código: los permisos de la base de datos solo dejan ver a cada usuario sus propios datos. **Nunca pongas la clave secreta (service_role).**

### 3. Publicar en GitHub Pages
1. Crea un repositorio nuevo en GitHub y sube `index.html`, `supabase.sql` y este `README.md`.
2. En **Settings → Pages**, elige la rama `main` y la carpeta `/ (root)`.
3. En un minuto la app queda en `https://TU-USUARIO.github.io/NOMBRE-DEL-REPOSITORIO/`.

### Pasar datos que ya tenías en el navegador
Antes de conectar Supabase, en **⚙ → Descargar copia**. Después de entrar con tu usuario, **⚙ → Restaurar copia**.
