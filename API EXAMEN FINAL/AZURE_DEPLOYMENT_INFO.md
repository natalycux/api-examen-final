# ?? DEPLOYMENT A AZURE - CONFIGURACIÓN AUTOMÁTICA

## ?? CONFIGURACIÓN ACTUAL

Este proyecto está configurado para **deployment automático** desde GitHub a Azure.

### ?? Flujo de Deployment

```
Tu PC ? GitHub ? Azure
(Git Push) ? (GitHub Actions) ? (Web App)
```

Cada vez que hagas `git push`, automáticamente:
1. ? GitHub Actions compila tu código
2. ? Ejecuta tests (si existen)
3. ? Despliega a Azure Web App
4. ? Tu API está actualizada en 2-3 minutos

---

## ?? URLS DE TU PROYECTO

### Azure
- **Portal Azure**: https://portal.azure.com
- **Web App**: `https://api-examen-[TU-NOMBRE].azurewebsites.net`
- **Swagger**: `https://api-examen-[TU-NOMBRE].azurewebsites.net/swagger`

### GitHub
- **Repositorio**: `https://github.com/[TU-USUARIO]/api-examen-final`
- **Actions (Ver deployments)**: `https://github.com/[TU-USUARIO]/api-examen-final/actions`

---

## ?? RECURSOS EN AZURE

### Resource Group: `rg-examen-final`
Contiene todos los recursos:

1. **SQL Server**: `sql-examen-[TU-NOMBRE]`
   - Servidor de base de datos
   - Location: East US (recomendado)

2. **SQL Database**: `db-examen-final`
   - Base de datos de la aplicación
   - Tier: Basic (económico)

3. **App Service Plan**: `ASP-[nombre-generado]`
   - Plan de hosting
   - Tier: Free F1 o Basic B1

4. **App Service (Web App)**: `api-examen-[TU-NOMBRE]`
   - Aplicación .NET 8
   - Runtime: Windows
   - Deployment: GitHub Actions

---

## ?? CONFIGURACIÓN DE SEGURIDAD

### SQL Server Firewall
Para que funcione, debes configurar:
1. ? "Allow Azure services and resources to access this server"
2. ? Tu IP local (para desarrollo)

**Cómo agregar tu IP:**
1. Ve a Azure Portal ? SQL Server
2. Security ? Networking
3. Firewall rules ? **+ Add your client IPv4 address**
4. Save

### Connection String
En `appsettings.json`:
```json
"ConnectionStrings": {
  "DefaultConnection": "Server=tcp:sql-examen-[TU-NOMBRE].database.windows.net,1433;Initial Catalog=db-examen-final;User ID=adminexamen;Password=[TU-PASSWORD];MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;"
}
```

?? **IMPORTANTE**: Esta configuración ya debe estar en tu `appsettings.json`

---

## ??? DEPLOYMENT CENTER EN AZURE

### Configuración
- **Source**: GitHub
- **Organization**: Tu usuario de GitHub
- **Repository**: `api-examen-final`
- **Branch**: `main`

### Archivo de Workflow
Azure crea automáticamente: `.github/workflows/main_api-examen-[TU-NOMBRE].yml`

**NO necesitas editar este archivo manualmente.**

---

## ?? MONITOREO Y LOGS

### Ver logs en tiempo real
1. Azure Portal ? Tu Web App
2. Monitoring ? **Log stream**
3. Verás logs en tiempo real

### Ver métricas
1. Azure Portal ? Tu Web App
2. Monitoring ? **Metrics**
3. Puedes ver: CPU, memoria, requests, errores, etc.

### Ver Application Insights (Opcional)
Si lo habilitas, tendrás telemetría completa:
- Requests
- Dependencies
- Exceptions
- Performance

---

## ?? VERIFICAR QUE EL DEPLOYMENT FUNCIONÓ

### Después de hacer `git push`:

1. **En GitHub:**
   - Ve a la pestaña **Actions**
   - Verás un workflow ejecutándose
   - ?? Amarillo = En proceso
   - ? Verde = Exitoso
   - ? Rojo = Falló (revisa logs)

2. **En Azure:**
   - Ve a tu Web App ? Deployment Center
   - Verás el historial de deployments
   - Último deployment debe estar "Success"

3. **En tu navegador:**
   - Ve a: `https://api-examen-[TU-NOMBRE].azurewebsites.net/swagger`
   - Deberías ver Swagger UI con tus endpoints
   - Prueba GET, POST, PUT, DELETE

---

## ? COMANDOS ÚTILES

### Ver logs de Azure desde terminal (Azure CLI)
```bash
# Instalar Azure CLI primero: https://aka.ms/installazurecliwindows

# Login
az login

# Ver logs en tiempo real
az webapp log tail --name api-examen-[TU-NOMBRE] --resource-group rg-examen-final
```

### Reiniciar Web App
```bash
az webapp restart --name api-examen-[TU-NOMBRE] --resource-group rg-examen-final
```

O desde el Portal:
- Azure Portal ? Tu Web App ? **Restart** (arriba)

---

## ?? TROUBLESHOOTING

### Problema: Deployment falla en GitHub Actions
**Solución:**
1. Ve a Actions ? Clic en el workflow fallido
2. Expande los pasos para ver el error
3. Errores comunes:
   - **Compilación falla**: Revisa que compile localmente (`dotnet build`)
   - **Tests fallan**: Omite tests o corrígelos
   - **Credenciales incorrectas**: Re-configura Deployment Center

### Problema: Error 500 en Azure pero funciona local
**Solución:**
1. Verifica la cadena de conexión en `appsettings.json`
2. Revisa que la IP de Azure esté en el firewall de SQL
3. Ve a Log stream para ver el error exacto

### Problema: Cambios no se reflejan en Azure
**Solución:**
1. Verifica que el push se hizo: `git log --oneline`
2. Verifica que GitHub Actions terminó exitosamente
3. Espera 2-3 minutos adicionales
4. Limpia caché del navegador (Ctrl + F5)
5. Si nada funciona, reinicia la Web App

### Problema: Swagger no aparece en Azure
**Solución:**
Verifica en `Program.cs`:
```csharp
// Debe estar FUERA de if (Development)
app.UseSwagger();
app.UseSwaggerUI();
```

---

## ?? COSTOS ESTIMADOS

### Con Free Tier:
- **App Service (F1)**: $0/mes (gratis)
- **SQL Database (Basic)**: ~$5/mes
- **Total**: ~$5/mes

### Con Basic Tier (Mejor rendimiento):
- **App Service (B1)**: ~$13/mes
- **SQL Database (Basic)**: ~$5/mes
- **Total**: ~$18/mes

?? **TIP**: Después del examen, puedes eliminar todos los recursos para no generar costos:
1. Azure Portal ? Resource Groups
2. Selecciona `rg-examen-final`
3. **Delete resource group**

---

## ?? CHECKLIST DE CONFIGURACIÓN

Antes del examen, verifica:

- [ ] ? SQL Server creado y firewall configurado
- [ ] ? SQL Database creada y accesible
- [ ] ? Cadena de conexión en `appsettings.json`
- [ ] ? Web App creada
- [ ] ? Deployment Center configurado con GitHub
- [ ] ? Código subido a GitHub
- [ ] ? Primer deployment exitoso (check verde en Actions)
- [ ] ? Swagger funciona en Azure (`/swagger`)
- [ ] ? Puedo crear y leer datos de prueba

---

## ?? WORKFLOW DURANTE EL EXAMEN

```
1. Editar código en Visual Studio
   ?
2. Probar localmente (F5)
   ?
3. git add . && git commit -m "mensaje" && git push
   ?
4. Esperar 2-3 minutos (GitHub Actions)
   ?
5. Verificar en Azure: https://...azurewebsites.net/swagger
   ?
6. ? LISTO
```

---

**?? ¡Buena suerte en tu examen!**
