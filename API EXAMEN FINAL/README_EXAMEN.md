# ?? GUÍA RÁPIDA PARA EL DÍA DEL EXAMEN

## ?? PASOS A SEGUIR CUANDO TE DEN LAS ESPECIFICACIONES:

### 1?? ACTUALIZAR LA CADENA DE CONEXIÓN
Edita los archivos:
- `appsettings.json`
- `appsettings.Development.json`

Reemplaza los valores:
```json
"DefaultConnection": "Server=SERVIDOR_REAL;Database=BASE_DATOS_REAL;User Id=USUARIO_REAL;Password=PASSWORD_REAL;MultipleActiveResultSets=True;TrustServerCertificate=True"
```

### 2?? RENOMBRAR EL MODELO (Models/Item.cs)
Si te piden trabajar con "Productos", "Clientes", "Empleados", etc.:
1. Renombra la clase `Item` al nombre que te indiquen
2. Ajusta las propiedades según los campos de la tabla
3. Asegúrate de que el `Id` coincida con la clave primaria

Ejemplo:
```csharp
public class Producto  // Cambiar "Item" por el nombre requerido
{
    public int Id { get; set; }
    public string Nombre { get; set; } = string.Empty;
    public decimal Precio { get; set; }
    // ... agregar más propiedades según el examen
}
```

### 3?? ACTUALIZAR EL DBCONTEXT (Data/ApplicationDbContext.cs)
Cambia el nombre del DbSet:
```csharp
public DbSet<Producto> Productos { get; set; }  // Ajustar según tu modelo
```

Si el nombre de la tabla en la BD es diferente al DbSet, especifícalo:
```csharp
modelBuilder.Entity<Producto>().ToTable("NombreTablaReal");
```

### 4?? RENOMBRAR EL CONTROLADOR (Controllers/ItemsController.cs)
1. Renombra `ItemsController` a `ProductosController` (o lo que te pidan)
2. Cambia la ruta: `[Route("api/Productos")]`
3. Actualiza todas las referencias de `Item` a tu nuevo modelo
4. Cambia `_context.Items` a `_context.Productos` (o tu DbSet)

### 5?? PROBAR LOCALMENTE
Ejecuta la API en Visual Studio (F5) y prueba en Swagger:
```
https://localhost:7209/swagger
```

Prueba las 5 operaciones:
- ? GET (todos)
- ? GET (por ID)
- ? POST (crear)
- ? PUT (actualizar)
- ? DELETE (eliminar)

### 6?? PUBLICAR A AZURE
1. Clic derecho en el proyecto ? **Publicar...**
2. Selecciona **Azure** ? **Azure App Service (Windows)**
3. Crea un nuevo App Service o selecciona uno existente
4. Asegúrate de que la cadena de conexión esté correcta
5. Publica

### 7?? VERIFICAR EN AZURE
URL de tu API en Azure:
```
https://TU_APP_SERVICE.azurewebsites.net/swagger
```

### 8?? SUBIR A GITHUB (ANTES DE PUBLICAR A AZURE)
```bash
git init
git add .
git commit -m "API Examen Final - Configuración inicial"
git branch -M main
git remote add origin https://github.com/TU_USUARIO/TU_REPOSITORIO.git
git push -u origin main
```

---

## ?? SI LA TABLA YA EXISTE EN LA BASE DE DATOS:

**NO necesitas hacer migraciones**. Solo:
1. Crea el modelo con las propiedades exactas de la tabla
2. Asegúrate de que los nombres coincidan (o usa anotaciones/Fluent API)
3. Conecta y prueba

**SI necesitas crear la tabla**, ejecuta en la Consola del Administrador de Paquetes:
```powershell
Add-Migration InitialCreate
Update-Database
```

---

## ?? CHECKLIST FINAL ANTES DE ENTREGAR:
- [ ] Cadena de conexión correcta
- [ ] Modelo con propiedades correctas
- [ ] DbContext actualizado
- [ ] Controlador renombrado y funcional
- [ ] Swagger habilitado en producción
- [ ] API publicada en Azure
- [ ] URL de Swagger accesible: `https://TU_APP.azurewebsites.net/swagger`
- [ ] CRUD completo probado (GET, POST, PUT, DELETE)
- [ ] Código subido a GitHub

---

## ?? ERRORES COMUNES Y SOLUCIONES:

### Error: "Cannot open database"
- Verifica la cadena de conexión
- Verifica que tienes permisos en la base de datos

### Error: "Invalid column name"
- Los nombres de las propiedades del modelo no coinciden con las columnas de la tabla
- Usa `[Column("NombreReal")]` sobre las propiedades

### Error: "Table does not exist"
- Si la tabla no existe, ejecuta `Update-Database`
- O verifica que el nombre del DbSet/ToTable() sea correcto

### Swagger no aparece en Azure
- Verifica que `app.UseSwagger()` y `app.UseSwaggerUI()` estén FUERA del `if (app.Environment.IsDevelopment())`

---

¡MUCHA SUERTE EN TU EXAMEN! ??
