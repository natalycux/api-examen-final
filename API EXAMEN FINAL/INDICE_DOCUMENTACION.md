# ?? ÍNDICE DE DOCUMENTACIÓN - EXAMEN FINAL

## ?? EMPIEZA AQUÍ

Si es tu primera vez usando esta plantilla, **lee los documentos en este orden:**

### ?? FASE 1: PREPARACIÓN (Antes del examen)
```
1. README.md                          ? Vista general del proyecto
2. GUIA_EXAMEN_PASO_A_PASO.md       ? IMPORTANTE: Configurar Azure y GitHub
3. CHECKLIST_EXAMEN.md               ? Verificar que TODO esté listo
```

### ?? FASE 2: DURANTE EL EXAMEN
```
4. REFERENCIA_RAPIDA_VISUAL.md      ? Imprime esto, úsalo durante el examen
5. COMANDOS_RAPIDOS.md               ? Ten esto abierto en una pestaña
6. EJEMPLOS_ESCENARIOS.md            ? Consulta si tu caso es similar
```

### ?? FASE 3: SI ALGO FALLA
```
7. AZURE_DEPLOYMENT_INFO.md         ? Troubleshooting de Azure
8. Log Stream en Azure Portal        ? Ver errores en tiempo real
9. GitHub Actions logs               ? Ver errores de deployment
```

---

## ?? DESCRIPCIÓN DE CADA DOCUMENTO

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

### ?? `GUIA_EXAMEN_PASO_A_PASO.md` (30-45 min de lectura + configuración)
**Para qué:** Configurar Azure, GitHub y hacer el primer deployment  
**Cuándo leer:** HOY, antes del examen  
**Contenido:**
- ? Crear SQL Database en Azure
- ? Crear Web App en Azure
- ? Configurar Firewall
- ? Conectar GitHub con Azure
- ? Configurar Deployment Center
- ? Primera migración
- ? Verificación completa
- ? Workflow del día del examen

**?? CRÍTICO: Debes completar esta guía ANTES del examen**

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
**Para qué:** Tener a mano durante el examen como guía rápida  
**Cuándo usar:** DURANTE el examen (abierto en una pestaña o impreso)  
**Contenido:**
- Flujo visual de trabajo (45 min)
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
- Secuencia típica
- Comandos de emergencia
- URLs importantes

**?? TIP: Ten esto abierto en Visual Studio en una pestaña**

---

### ?? `EJEMPLOS_ESCENARIOS.md` (Consulta según necesites)
**Para qué:** Ver ejemplos completos de implementaciones  
**Cuándo usar:** Si tu caso es similar o necesitas inspiración  
**Contenido:**
- Escenario 1: API de Productos
- Escenario 2: API de Clientes
- Escenario 3: API de Libros
- Escenario 4: Con relaciones entre entidades
- Código completo de cada ejemplo

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
- Costos estimados

---

### ?? `preparar-examen.ps1` (Script - ejecutar una vez)
**Para qué:** Verificar que tienes todo instalado y configurado  
**Cuándo ejecutar:** Después de leer la guía, antes del examen  
**Cómo ejecutar:**
```powershell
.\preparar-examen.ps1
```
**Qué hace:**
- Verifica .NET SDK
- Verifica Git
- Verifica EF Core Tools
- Restaura paquetes
- Compila el proyecto
- Verifica configuración de Git
- Muestra próximos pasos

---

### ?? `deploy-examen.ps1` (Script - usar durante examen)
**Para qué:** Automatizar todo el proceso de deployment  
**Cuándo ejecutar:** Durante el examen, después de editar el código  
**Cómo ejecutar:**
```powershell
.\deploy-examen.ps1 -NombreEntidad "Producto"
```
**Qué hace:**
- Compila el proyecto
- Crea migración
- Aplica migración a BD
- Git add + commit
- Git push
- Te dice cuándo estará listo en Azure

---

## ??? MAPA DE NAVEGACIÓN

```
???????????????????????????????????????????????????????????????
?                      EMPIEZA AQUÍ                          ?
?                      README.md                             ?
???????????????????????????????????????????????????????????????
                       ?
        ????????????????????????????????
        ? ¿Qué fase estás?            ?
        ????????????????????????????????
                       ?
       ?????????????????????????????????
       ?                               ?
???????????????              ???????????????????
? ANTES DEL   ?              ? DURANTE EL      ?
? EXAMEN      ?              ? EXAMEN          ?
???????????????              ???????????????????
       ?                               ?
1. GUIA_EXAMEN_         4. REFERENCIA_RAPIDA_
   PASO_A_PASO.md          VISUAL.md (IMPRIME)
       ?                               ?
2. preparar-examen.ps1   5. COMANDOS_RAPIDOS.md
       ?                               ?
3. CHECKLIST_           6. deploy-examen.ps1
   EXAMEN.md                (cuando termines)
       ?                               ?
   ? LISTO                     ? VERIFICAR EN AZURE
```

---

## ?? ESTIMACIÓN DE TIEMPO

### Preparación (Antes del examen):
- Leer README.md: **5 min**
- Leer y seguir GUIA_EXAMEN_PASO_A_PASO.md: **45 min**
- Ejecutar preparar-examen.ps1: **2 min**
- Verificar CHECKLIST_EXAMEN.md: **10 min**
- Familiarizarse con REFERENCIA_RAPIDA_VISUAL.md: **10 min**
- **TOTAL: ~70 minutos** (1 hora y 10 minutos)

### Durante el examen:
- Seguir flujo en REFERENCIA_RAPIDA_VISUAL.md: **45 min**
- Buffer para imprevistos: **15 min**
- **TOTAL: ~60 minutos**

---

## ?? PRIORIDADES POR DOCUMENTO

### ?? CRÍTICOS (Debes leerlos SÍ o SÍ):
1. README.md
2. GUIA_EXAMEN_PASO_A_PASO.md
3. CHECKLIST_EXAMEN.md
4. REFERENCIA_RAPIDA_VISUAL.md

### ?? IMPORTANTES (Muy útiles):
5. COMANDOS_RAPIDOS.md
6. EJEMPLOS_ESCENARIOS.md

### ?? OPCIONALES (Solo si hay problemas):
7. AZURE_DEPLOYMENT_INFO.md

---

## ?? PESTAÑAS RECOMENDADAS EN EL NAVEGADOR

Durante el examen, ten abiertas estas pestañas:

1. **Azure Portal** - Portal principal
   - https://portal.azure.com
   
2. **GitHub Repositorio** - Ver código
   - https://github.com/[USER]/api-examen-final
   
3. **GitHub Actions** - Ver deployment en tiempo real
   - https://github.com/[USER]/api-examen-final/actions
   
4. **Swagger Azure** - Probar API en producción
   - https://api-examen-[NOMBRE].azurewebsites.net/swagger
   
5. **Esta documentación** - Referencia rápida
   - REFERENCIA_RAPIDA_VISUAL.md en GitHub o local

---

## ?? CONSEJOS DE USO

### Para estudiar:
1. Lee README.md para entender el proyecto
2. Sigue GUIA_EXAMEN_PASO_A_PASO.md paso por paso
3. Practica cambiando de "Item" a otra entidad
4. Verifica con CHECKLIST_EXAMEN.md

### Para el examen:
1. Ten impreso REFERENCIA_RAPIDA_VISUAL.md
2. Ten abierto en VS Code: COMANDOS_RAPIDOS.md
3. Consulta EJEMPLOS_ESCENARIOS.md si tu caso es similar
4. Usa deploy-examen.ps1 para automatizar

### Si algo falla:
1. Consulta sección TROUBLESHOOTING en REFERENCIA_RAPIDA_VISUAL.md
2. Revisa AZURE_DEPLOYMENT_INFO.md
3. Ve a Azure Portal ? Log Stream
4. Revisa logs en GitHub Actions

---

## ?? ORDEN DE LECTURA RECOMENDADO

### Primera sesión (1 hora):
```
README.md (5 min)
    ?
GUIA_EXAMEN_PASO_A_PASO.md (45 min)
    ?
Ejecutar preparar-examen.ps1 (2 min)
    ?
CHECKLIST_EXAMEN.md (10 min)
```

### Segunda sesión (30 min):
```
REFERENCIA_RAPIDA_VISUAL.md (15 min)
    ?
COMANDOS_RAPIDOS.md (5 min)
    ?
EJEMPLOS_ESCENARIOS.md (10 min)
```

### Antes del examen (10 min):
```
Revisar CHECKLIST_EXAMEN.md
    ?
Imprimir REFERENCIA_RAPIDA_VISUAL.md
    ?
Verificar que Azure y GitHub funcionen
```

---

## ?? AYUDA RÁPIDA POR SITUACIÓN

### "No sé por dónde empezar"
? Lee **README.md** primero

### "Necesito configurar Azure"
? Sigue **GUIA_EXAMEN_PASO_A_PASO.md**

### "¿Está todo listo?"
? Revisa **CHECKLIST_EXAMEN.md**

### "Estoy en el examen, ¿qué hago?"
? Usa **REFERENCIA_RAPIDA_VISUAL.md**

### "Necesito un comando específico"
? Busca en **COMANDOS_RAPIDOS.md**

### "Mi caso es similar a un ejemplo"
? Mira **EJEMPLOS_ESCENARIOS.md**

### "Algo falló en Azure"
? Consulta **AZURE_DEPLOYMENT_INFO.md**

---

## ? VERIFICACIÓN FINAL

Antes del examen, asegúrate de haber:

- [ ] ? Leído README.md
- [ ] ? Completado GUIA_EXAMEN_PASO_A_PASO.md
- [ ] ? Ejecutado preparar-examen.ps1 sin errores
- [ ] ? Marcado CHECKLIST_EXAMEN.md
- [ ] ? Impreso REFERENCIA_RAPIDA_VISUAL.md
- [ ] ? Probado deploy-examen.ps1 al menos una vez
- [ ] ? Verificado que Azure funciona
- [ ] ? Verificado que GitHub Actions funciona

---

**?? ¡AHORA SÍ ESTÁS LISTO! ??**

**Siguiente paso:** Lee **README.md** si aún no lo has hecho.
