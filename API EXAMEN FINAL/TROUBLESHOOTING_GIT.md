# ?? SOLUCIÓN DE PROBLEMAS GIT - GUÍA COMPLETA

## ?? ERROR ESPECÍFICO: "git add ." NO FUNCIONA

### Síntoma
- Ejecutas `git add .` y no pasa nada
- No ves mensajes de error, pero los archivos no se agregan
- `git status` sigue mostrando archivos "untracked"

### Causas Comunes y Soluciones

#### 1. ?? PROBLEMA MÁS COMÚN: Directorio Incorrecto

**Síntoma**: Estás en el directorio raíz del proyecto, no en "API EXAMEN FINAL"

**Cómo verificar:**
```bash
# En PowerShell
pwd

# En CMD
cd

# Deberías ver algo como:
# C:\Users\TU-USUARIO\...\API EXAMEN FINAL\API EXAMEN FINAL
#                                          ^^^^^^^^^^^^ importante
```

**Solución:**
```bash
# Navega al directorio correcto
cd "API EXAMEN FINAL"

# Verifica nuevamente
pwd

# Ahora sí, agrega archivos
git add .
```

---

#### 2. El punto (.) no funciona en tu terminal

**Causa**: Algunos terminales en Windows tienen problemas con el punto

**Solución A**: Usa `-A` en lugar de `.`
```bash
git add -A
```

**Solución B**: Usa `--all`
```bash
git add --all
```

**Solución C**: Especifica archivos individuales
```bash
git add *.cs
git add *.json
git add *.md
```

---

#### 3. Git no está inicializado

**Síntoma**: Error "fatal: not a git repository"

**Cómo verificar:**
```bash
# Busca la carpeta .git
ls -la   # PowerShell
dir /a   # CMD
```

**Solución:**
```bash
git init
git add .
```

---

#### 4. Estás en el terminal incorrecto

**Problema**: El terminal CMD puede tener problemas en Windows

**Solución**: Cambia a PowerShell
1. En Visual Studio: **View** ? **Terminal**
2. En la barra de terminal, clic en la flecha hacia abajo (?)
3. Selecciona **PowerShell** o **Git Bash**
4. Intenta de nuevo: `git add .`

---

#### 5. Todos los archivos ya están agregados

**Síntoma**: `git status` dice "nothing to commit, working tree clean"

**Solución**: Esto es normal si ya agregaste todo anteriormente
```bash
# Solo necesitas hacer commit y push
git commit -m "Tu mensaje"
git push
```

---

## ?? GUÍA PASO A PASO DESDE CERO

Si estás completamente perdido, sigue estos pasos:

### PASO 1: Verifica tu ubicación
```bash
# Abre PowerShell en Visual Studio (View ? Terminal)

# Verifica dónde estás
pwd

# Debes ver algo como:
# C:\Users\natal\OneDrive\...\DESARROLLO WEB\API EXAMEN FINAL\API EXAMEN FINAL
#                                                              ^^^^^^^^^^^^^^^^
```

### PASO 2: Navega al directorio correcto (si es necesario)
```bash
# Si no estás en "API EXAMEN FINAL\API EXAMEN FINAL", navega:

# Opción 1: Si estás en la raíz del proyecto
cd "API EXAMEN FINAL"

# Opción 2: Si estás en otro lugar
cd "C:\Users\natal\OneDrive\Documentos\UNIVERSIDAD\OCTAVO SEMESTRE\DESARROLLO WEB\API EXAMEN FINAL\API EXAMEN FINAL"

# Verifica de nuevo
pwd
```

### PASO 3: Ejecuta el diagnóstico
```bash
# Ejecuta el script de diagnóstico
.\diagnostico-git.ps1

# Esto te dirá exactamente qué está mal
```

### PASO 4: Inicializa Git (si no está inicializado)
```bash
# Verifica si existe .git
Test-Path .git

# Si devuelve False, inicializa:
git init
```

### PASO 5: Configura usuario (primera vez)
```bash
git config user.name "Tu Nombre Completo"
git config user.email "tuemail@ejemplo.com"

# Verifica
git config user.name
git config user.email
```

### PASO 6: Agrega archivos
```bash
# Intenta cada uno hasta que funcione:

# Opción 1
git add .

# Opción 2 (si la 1 falla)
git add -A

# Opción 3 (si la 2 falla)
git add --all

# Opción 4 (última alternativa)
git add *
```

### PASO 7: Verifica que se agregaron
```bash
git status

# Deberías ver archivos en verde bajo "Changes to be committed:"
```

### PASO 8: Haz commit
```bash
git commit -m "Setup inicial API para examen"
```

### PASO 9: Conecta con GitHub
```bash
# Solo si aún no lo has hecho
git remote add origin https://github.com/TU-USUARIO/api-examen-final.git

# Verifica
git remote -v
```

### PASO 10: Sube a GitHub
```bash
git branch -M main
git push -u origin main
```

---

## ?? ALTERNATIVA: USA GITHUB DESKTOP

Si Git por terminal te da muchos problemas, usa la interfaz gráfica:

### OPCIÓN 1: GitHub Desktop (Recomendado)

1. **Descarga e instala:**
   - https://desktop.github.com/

2. **Inicia sesión:**
   - Abre GitHub Desktop
   - File ? Options ? Sign in
   - Autoriza con tu cuenta de GitHub

3. **Agrega tu repositorio:**
   - File ? Add Local Repository
   - Navega a: `C:\Users\natal\...\API EXAMEN FINAL`
   - Selecciona la carpeta y clic en **Add Repository**

4. **Publica a GitHub:**
   - Clic en **Publish repository** (esquina superior)
   - Elige nombre: `api-examen-final`
   - Selecciona Private o Public
   - Clic en **Publish**

5. **Para subir cambios futuros:**
   - GitHub Desktop detecta cambios automáticamente
   - Escribe mensaje de commit abajo a la izquierda
   - Clic en **Commit to main**
   - Clic en **Push origin** (arriba)

### OPCIÓN 2: Visual Studio Git UI

1. **Habilita Git en Visual Studio:**
   - View ? Git Changes (o presiona `Ctrl + 0, Ctrl + G`)

2. **En la ventana Git Changes:**
   - Verás todos los archivos modificados
   - Escribe mensaje de commit arriba
   - Clic en **Commit All**
   - Clic en **Push** (arriba)

---

## ?? EMERGENCIA: Nada funciona

Si absolutamente nada funciona, aquí está el plan B:

### PLAN B: Crear repositorio desde cero

```bash
# 1. Elimina configuración Git actual
Remove-Item -Recurse -Force .git

# 2. Empieza de nuevo
git init

# 3. Configura usuario
git config user.name "Tu Nombre"
git config user.email "tu@email.com"

# 4. Crea .gitignore si no existe
@"
bin/
obj/
.vs/
*.user
"@ | Out-File -FilePath .gitignore -Encoding utf8

# 5. Agrega archivos
git add -A

# 6. Verifica (DEBE mostrar archivos)
git status

# 7. Si muestra archivos, continúa:
git commit -m "Inicial"
git remote add origin https://github.com/TU-USUARIO/api-examen-final.git
git branch -M main
git push -u origin main
```

---

## ?? CONTACTO DE EMERGENCIA

Si NADA de esto funciona:

1. **Captura pantallas:**
   - Captura el error exacto
   - Captura el resultado de `pwd`
   - Captura el resultado de `git status`

2. **Ejecuta diagnóstico completo:**
   ```bash
   .\diagnostico-git.ps1 > diagnostico-resultado.txt
   ```

3. **Información a proporcionar:**
   - Sistema operativo
   - Terminal que usas (CMD, PowerShell, Git Bash)
   - Mensajes de error exactos
   - Resultado del diagnóstico

---

## ? VERIFICACIÓN FINAL

Cuando TODO esté funcionando, verifica:

```bash
# 1. Verifica que Git funciona
git status
# Debe decir: "On branch main, nothing to commit, working tree clean"

# 2. Verifica el remote
git remote -v
# Debe mostrar: origin https://github.com/TU-USUARIO/...

# 3. Verifica los commits
git log --oneline
# Debe mostrar tu commit

# 4. Verifica en GitHub
# Ve a https://github.com/TU-USUARIO/api-examen-final
# Debes ver todos tus archivos
```

---

## ?? TIPS FINALES

1. **Siempre usa PowerShell** en lugar de CMD
2. **Verifica tu ubicación** antes de cada comando: `pwd`
3. **Usa GitHub Desktop** si el terminal te causa problemas
4. **Ejecuta diagnostico-git.ps1** cuando tengas dudas
5. **Guarda tu Personal Access Token** en un lugar seguro
6. **Practica ANTES del examen** para no tener sorpresas

---

## ?? RECURSOS ADICIONALES

- **Git Documentation**: https://git-scm.com/doc
- **GitHub Guides**: https://guides.github.com/
- **GitHub Desktop**: https://desktop.github.com/
- **Git Cheat Sheet**: https://education.github.com/git-cheat-sheet-education.pdf

---

**?? RECUERDA**: Git es una herramienta, no debe ser un obstáculo. Si te causa mucho problema, usa GitHub Desktop durante el examen. Lo importante es que tu código llegue a GitHub y Azure.
