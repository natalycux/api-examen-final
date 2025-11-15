# ?? ÍNDICE DE DOCUMENTACIÓN - EXAMEN FINAL

## ?? **INFORMACIÓN IMPORTANTE DEL EXAMEN**

### ?? **El examen incluye:**
- ? **Backend API** (.NET, Node.js u otro)
- ? **Frontend** (HTML/JS, React, Vue, etc.)
- ? **Base de datos** (SQL Server - te la proporcionan)
- ? **TODO publicado online** (Azure, Vercel, Netlify, etc.)

### ?? **Flujo completo a implementar:**
```
BD SQL Server ? Backend API ? Frontend ? Deploy Online
(Te la dan)     (Crear)       (Crear)    (Publicar)
```

---

## ?? EMPIEZA AQUÍ

Si es tu primera vez usando esta plantilla, **lee los documentos en este orden:**

### ?? FASE 1: PREPARACIÓN (Antes del examen)

```
1. README.md                                ? Vista general del proyecto

2. ?? PREGUNTA IMPORTANTE:
   ¿El examen incluye SOLO backend o backend + frontend?
   
   ? BACKEND + FRONTEND (examen completo):
     ?? GUIA_COMPLETA_BACKEND_FRONTEND.md   ? ? LEE ESTA PRIMERO
     
   ? SOLO BACKEND:
     GUIA_EXAMEN_BD_EXISTENTE.md            ? Si te dan BD existente
     O GUIA_EXAMEN_PASO_A_PASO.md           ? Si debes crear BD
     
3. CHECKLIST_EXAMEN.md                     ? Verificar que TODO esté listo
```

### ?? FASE 2: DURANTE EL EXAMEN
```
4. GUIA_COMPLETA_BACKEND_FRONTEND.md       ? Guía paso a paso completa
5. REFERENCIA_RAPIDA_VISUAL.md             ? Referencia rápida backend
6. COMANDOS_RAPIDOS.md                     ? Comandos esenciales
7. EJEMPLOS_ESCENARIOS.md                  ? Ejemplos de código
```

### ?? FASE 3: SI ALGO FALLA
```
8. TROUBLESHOOTING_GIT.md                  ? Problemas con Git
9. AZURE_DEPLOYMENT_INFO.md                ? Troubleshooting de Azure
10. Log Stream en Azure Portal             ? Ver errores en tiempo real
11. GitHub Actions logs                    ? Ver errores de deployment
```

---

## ?? DESCRIPCIÓN DE CADA DOCUMENTO

### ?? `GUIA_COMPLETA_BACKEND_FRONTEND.md` (30 min de lectura) ? NUEVO - ESENCIAL
**Para qué:** Guía completa para el examen que incluye backend + frontend  
**Cuándo usar:** Si tu examen requiere crear backend API + frontend  
**Contenido:**
- ? Información completa del examen
- ? Distribución del tiempo (backend 45 min + frontend 50 min)
- ? Backend: Conectar a BD, crear API, CRUD completo
- ? Frontend: HTML + JavaScript (plantilla completa)
- ? Consumir API desde el frontend
- ? Deploy backend (Azure) + frontend (Vercel/Netlify/GitHub Pages)
- ? Configurar CORS
- ? Checklist completo
- ?? **Tiempo estimado total: 2-3 horas**

**?? USA ESTA GUÍA SI:**
- Tu examen incluye backend + frontend
- Debes crear el flujo completo: BD ? API ? Frontend
- Debes publicar todo online
- **Este es tu escenario actual según la información del profesor**

---

### ?? `README.md` (5 min de lectura)
**Para qué:** Entender qué es esta plantilla y cómo funciona  
**Cuándo leer:** Primera vez que abres el proyecto  
**Contenido:**
- Descripción general del proyecto
- Estructura de archivos
- Tecnologías usadas
- Inicio rápido
- Ejemplo de uso

---

### ?? `GUIA_EXAMEN_BD_EXISTENTE.md` (15 min de lectura)
**Para qué:** Guía corta si SOLO necesitas backend (BD ya existe)  
**Cuándo usar:** Si el examen es SOLO backend y te dan BD existente  
**Contenido:**
- ? Configurar conexión a BD existente
- ? Crear modelos sin migraciones
- ? Mapear tablas existentes
- ? CRUD con datos existentes
- ? Deployment solo de la API
- ?? **Tiempo estimado: 35-45 min**

**?? USA ESTA GUÍA SI:**
- Solo necesitas backend (sin frontend)
- Te dan una cadena de conexión
- La tabla ya existe en la BD

---

### ?? `GUIA_EXAMEN_PASO_A_PASO.md` (45 min de lectura + configuración)
**Para qué:** Guía completa si debes crear backend desde cero con tu propia BD  
**Cuándo usar:** Si debes crear tu propia base de datos en Azure (solo backend)  
**Contenido:**
- ? Crear SQL Database en Azure
- ? Crear Web App en Azure
- ? Configurar Firewall
- ? Conectar GitHub con Azure
- ? Configurar Deployment Center
- ? Crear migraciones
- ? Verificación completa

**?? USA ESTA GUÍA SI:**
- Solo necesitas backend (sin frontend)
- Debes crear tu propia BD en Azure
- Necesitas hacer migraciones

---

### ? `CHECKLIST_EXAMEN.md` (10 min de revisión)
**Para qué:** Verificar que no olvidaste nada  
**Cuándo usar:** Después de completar la guía, la noche antes del examen  
**Contenido:**
- Lista completa de verificación pre-examen
- Checklist para durante el examen
- Checklist de emergencia
- Estimación de tiempos
- Objetivos mínimos y extras

**?? TIP: Imprime esto y márcalo con un bolígrafo**

---

### ?? `REFERENCIA_RAPIDA_VISUAL.md` (Referencia constante)
**Para qué:** Tener a mano durante el examen como guía rápida (backend)  
**Cuándo usar:** DURANTE el examen (abierto en una pestaña o impreso)  
**Contenido:**
- Flujo visual de trabajo backend (45 min)
- Plantillas de código para copiar/pegar
- Comandos esenciales
- Atajos de teclado
- Tabla de respuestas HTTP
- Propiedades comunes por tipo de entidad
- Troubleshooting rápido

**?? RECOMENDACIÓN: IMPRIME ESTE DOCUMENTO**

---

### ? `COMANDOS_RAPIDOS.md` (Referencia constante)
**Para qué:** Copiar y pegar comandos sin pensar  
**Cuándo usar:** Durante todo el examen  
**Contenido:**
- Comandos Git
- Comandos Entity Framework
- Comandos dotnet
- Comandos Azure CLI
- Comandos npm/vercel/netlify
- Secuencia típica
- Comandos de emergencia

**?? TIP: Ten esto abierto en Visual Studio en una pestaña**

---

### ?? `EJEMPLOS_ESCENARIOS.md` (Consulta según necesites)
**Para qué:** Ver ejemplos completos de implementaciones backend  
**Cuándo usar:** Si tu caso es similar o necesitas inspiración  
**Contenido:**
- Escenario 1: API de Productos
- Escenario 2: API de Clientes
- Escenario 3: API de Libros
- Escenario 4: Con relaciones entre entidades
- Código completo de cada ejemplo

---

### ?? `TROUBLESHOOTING_GIT.md` (Consulta si hay problemas)
**Para qué:** Solucionar problemas con Git  
**Cuándo usar:** Si `git add .` u otro comando falla  
**Contenido:**
- Soluciones detalladas para errores de Git
- Guía paso a paso desde cero
- Alternativa: Usar GitHub Desktop
- Script de diagnóstico

---

### ?? `AZURE_DEPLOYMENT_INFO.md` (Consulta si hay problemas)
**Para qué:** Entender la configuración de Azure y resolver problemas  
**Cuándo usar:** Si algo falla en Azure o quieres entender el deployment  
**Contenido:**
- Configuración de Azure SQL
- Configuración de Web App
- Deployment Center
- Monitoreo y logs
- Troubleshooting detallado

---

### ?? `QUE_GUIA_SEGUIR.md` (Diagrama de decisión)
**Para qué:** Decidir qué guía seguir según tu escenario  
**Cuándo usar:** Si no sabes qué guía leer primero  
**Contenido:**
- Diagrama de decisión visual
- Comparación de escenarios
- Ejemplos de enunciados

---

### ?? `preparar-examen.ps1` (Script - ejecutar una vez)
**Para qué:** Verificar que tienes todo instalado y configurado  
**Cuándo ejecutar:** Después de leer la guía, antes del examen  
**Qué hace:**
- Verifica .NET SDK, Git, EF Core Tools
- Restaura paquetes y compila
- Verifica configuración de Git

---

### ?? `deploy-examen.ps1` (Script - usar durante examen)
**Para qué:** Automatizar el deployment del backend  
**Cuándo ejecutar:** Durante el examen, después de editar el código  
**Qué hace:**
- Compila, crea migración, aplica a BD
- Git add + commit + push
- Trigger auto-deployment a Azure

---

### ?? `diagnostico-git.ps1` (Script - troubleshooting)
**Para qué:** Diagnosticar problemas con Git  
**Cuándo ejecutar:** Si tienes problemas con Git  
**Qué hace:**
- Verifica instalación de Git
- Verifica configuración
- Verifica repositorio
- Ofrece soluciones automáticas

---

## ??? MAPA DE NAVEGACIÓN ACTUALIZADO

```
???????????????????????????????????????????????????????????????
?                      EMPIEZA AQUÍ                          ?
?                      README.md                             ?
???????????????????????????????????????????????????????????????
                       ?
        ????????????????????????????????
        ? ¿Qué incluye tu examen?     ?
        ????????????????????????????????
                       ?
       ?????????????????????????????????????
       ?                                   ?
???????????????????            ????????????????????
? BACKEND +       ?            ? SOLO             ?
? FRONTEND        ?            ? BACKEND          ?
? (Completo)      ?            ?                  ?
???????????????????            ????????????????????
         ?                               ?
GUIA_COMPLETA_         QUE_GUIA_SEGUIR.md
BACKEND_FRONTEND.md                     ?
         ?                    ???????????????????????
    ? LEE ESTA              ?                     ?
         ?           GUIA_EXAMEN_     GUIA_EXAMEN_
    (Backend +       BD_EXISTENTE     PASO_A_PASO
     Frontend +           (BD dada)    (Crear BD)
     Deploy)
         ?
??????????????????????
? CHECKLIST_EXAMEN   ?
??????????????????????
         ?
??????????????????????
? DÍA DEL EXAMEN     ?
? Sigue la guía      ?
? paso a paso        ?
??????????????????????
```

---

## ?? PRIORIDADES ACTUALIZADAS

### ?? CRÍTICOS (Debes leerlos SÍ o SÍ):
1. **README.md** - Entender el proyecto
2. **GUIA_COMPLETA_BACKEND_FRONTEND.md** ? ? **TU EXAMEN ES ESTE**
3. **CHECKLIST_EXAMEN.md** - Verificar preparación

### ?? IMPORTANTES (Muy útiles durante el examen):
4. **REFERENCIA_RAPIDA_VISUAL.md** - Referencia rápida backend
5. **COMANDOS_RAPIDOS.md** - Comandos esenciales
6. **EJEMPLOS_ESCENARIOS.md** - Código de ejemplo

### ?? OPCIONALES (Solo si hay problemas):
7. **TROUBLESHOOTING_GIT.md** - Problemas con Git
8. **AZURE_DEPLOYMENT_INFO.md** - Problemas con Azure
9. **QUE_GUIA_SEGUIR.md** - Si tienes dudas sobre qué guía usar

---

## ?? COMPARACIÓN DE GUÍAS

| Guía | Para qué examen | Incluye Backend | Incluye Frontend | Incluye Deploy | Tiempo |
|------|-----------------|-----------------|------------------|----------------|---------|
| **GUIA_COMPLETA_BACKEND_FRONTEND** | Backend + Frontend | ? SÍ | ? SÍ | ? Ambos | 2-3h |
| **GUIA_EXAMEN_BD_EXISTENTE** | Solo Backend | ? SÍ | ? NO | ? Backend | 45min |
| **GUIA_EXAMEN_PASO_A_PASO** | Solo Backend (crear BD) | ? SÍ | ? NO | ? Backend | 60+min |

---

## ?? ORDEN DE LECTURA PARA TU EXAMEN

### Primera sesión (30 min):
```
README.md (5 min)
    ?
GUIA_COMPLETA_BACKEND_FRONTEND.md (30 min)
    ?
Revisar plantillas de código
```

### Segunda sesión (20 min):
```
CHECKLIST_EXAMEN.md (10 min)
    ?
REFERENCIA_RAPIDA_VISUAL.md (10 min)
```

### Tercera sesión (Práctica - 2 horas):
```
Crear backend con BD de prueba (45 min)
    ?
Crear frontend que consume API (50 min)
    ?
Deploy ambos (15 min)
    ?
Probar integración (10 min)
```

---

## ?? TIPS ESPECÍFICOS PARA TU EXAMEN

1. **Backend primero** (45 min) - Es la base del sistema
2. **Frontend después** (50 min) - Consume el backend
3. **Deploy al final** (15 min) - Backend ya funciona en Azure, solo falta frontend
4. **Guarda URLs** a medida que las obtienes
5. **Frontend simple** es mejor que complejo sin terminar
6. **Usa plantillas** de código proporcionadas
7. **CORS configurado** desde el inicio en el backend

---

## ?? AYUDA RÁPIDA POR SITUACIÓN

### "No sé por dónde empezar"
? Lee **README.md** y luego **GUIA_COMPLETA_BACKEND_FRONTEND.md**

### "Solo necesito backend"
? Lee **GUIA_EXAMEN_BD_EXISTENTE.md** (más probable)

### "Necesito backend + frontend"
? Lee **GUIA_COMPLETA_BACKEND_FRONTEND.md** ?

### "¿Está todo listo?"
? Revisa **CHECKLIST_EXAMEN.md**

### "Estoy en el examen"
? Sigue **GUIA_COMPLETA_BACKEND_FRONTEND.md** paso a paso

### "Necesito un comando específico"
? Busca en **COMANDOS_RAPIDOS.md**

### "Algo falló con Git"
? Consulta **TROUBLESHOOTING_GIT.md**

### "Algo falló en Azure"
? Consulta **AZURE_DEPLOYMENT_INFO.md**

---

## ? VERIFICACIÓN FINAL PARA TU EXAMEN

Antes del examen, asegúrate de haber:

### Backend:
- [ ] ? Leída GUIA_COMPLETA_BACKEND_FRONTEND.md (Parte 1)
- [ ] ? GitHub configurado y funcionando
- [ ] ? Azure Web App creada
- [ ] ? Deployment Center conectado con GitHub
- [ ] ? Sabes crear modelos y controladores CRUD
- [ ] ? Sabes configurar CORS

### Frontend:
- [ ] ? Leída GUIA_COMPLETA_BACKEND_FRONTEND.md (Parte 2)
- [ ] ? Plantillas HTML/CSS/JS descargadas o guardadas
- [ ] ? Sabes conectar frontend con API (fetch)
- [ ] ? Sabes hacer deploy a Vercel/Netlify/GitHub Pages
- [ ] ? Tienes cuenta en Vercel o Netlify (opcional)

### General:
- [ ] ? Impreso REFERENCIA_RAPIDA_VISUAL.md
- [ ] ? COMANDOS_RAPIDOS.md abierto en una pestaña
- [ ] ? Has practicado el flujo completo al menos una vez

---

**?? ¡AHORA SÍ ESTÁS LISTO PARA EL EXAMEN COMPLETO! ??**

**Siguiente paso:** 
1. Lee **GUIA_COMPLETA_BACKEND_FRONTEND.md** completa
2. Practica crear backend + frontend
3. Practica el deploy de ambos
4. Verifica CHECKLIST_EXAMEN.md

**?? ¡Éxito en tu examen! ??**
