# ?? CHEAT SHEET - EXAMEN FINAL (IMPRIMIR)

## ? WORKFLOW EXAMEN (45 MIN)

```
1. LEE EXAMEN ? 2. EDITA MODELO ? 3. ACTUALIZA DbContext ? 
4. EDITA CONTROLADOR ? 5. MIGRACIÓN ? 6. PRUEBA LOCAL ? 
7. GIT PUSH ? 8. ESPERA 3 MIN ? 9. VERIFICA AZURE ? 10. ENTREGA
```

---

## ?? COMANDOS ESENCIALES

### Migración y BD
```bash
dotnet ef migrations add [Nombre]    # Crear migración
dotnet ef database update            # Aplicar a BD
```

### Git
```bash
git add .                            # Agregar cambios
git commit -m "Implementar [X]"      # Confirmar
git push                             # Subir (auto-deploy)
```

### Script automático (recomendado)
```powershell
.\deploy-examen.ps1 -NombreEntidad "Producto"
```

---

## ?? PLANTILLA MODELO

```csharp
using System.ComponentModel.DataAnnotations;

public class Producto
{
    public int Id { get; set; }

    [Required]
    [StringLength(100)]
    public string Nombre { get; set; } = string.Empty;

    [StringLength(500)]
    public string Descripcion { get; set; } = string.Empty;

    [Range(0.01, 999999.99)]
    public decimal Precio { get; set; }

    [Range(0, int.MaxValue)]
    public int Stock { get; set; }

    public DateTime FechaCreacion { get; set; } = DateTime.Now;
    
    public bool Activo { get; set; } = true;
}
```

---

## ?? PROPIEDADES COMUNES

### Producto/Artículo
`Id, Nombre, Descripcion, Precio, Stock, Categoria, Activo, FechaCreacion`

### Cliente/Usuario
`Id, Nombre, Email, Telefono, Direccion, FechaRegistro, Activo`

### Pedido/Orden
`Id, ClienteId, FechaPedido, Total, Estado, DireccionEnvio`

### Libro
`Id, Titulo, Autor, ISBN, AñoPublicacion, Editorial, Paginas, Disponible`

---

## ?? CAMBIOS NECESARIOS

### 1. Modelo (Models/Item.cs ? Producto.cs)
- Renombrar archivo y clase
- Editar propiedades según examen

### 2. DbContext (Data/ApplicationDbContext.cs)
```csharp
public DbSet<Producto> Productos { get; set; }
```

### 3. Controlador (Controllers/ItemsController.cs ? ProductosController.cs)
- Renombrar: `ItemsController` ? `ProductosController`
- Cambiar: `Item` ? `Producto`
- Cambiar: `Items` ? `Productos`
- Cambiar: `_context.Items` ? `_context.Productos`

---

## ?? RESPUESTAS HTTP

| Operación | Éxito | Error |
|-----------|-------|-------|
| GET lista | 200 OK | 200 OK (vacío `[]`) |
| GET por ID | 200 OK | 404 Not Found |
| POST | 201 Created | 400 Bad Request |
| PUT | 204 No Content | 404/400 |
| DELETE | 204 No Content | 404 Not Found |

---

## ?? TROUBLESHOOTING

### Error compilación
```bash
dotnet clean && dotnet build
```

### Error migración
- Verifica cadena conexión en appsettings.json
- Verifica firewall Azure (tu IP agregada)

### Error 500 en Azure
- Azure Portal ? Web App ? Log Stream
- Ver error exacto

### Deployment falla
- GitHub ? Actions ? Ver logs
- Verifica que compile local

### Swagger no aparece
Verifica `Program.cs`:
```csharp
app.UseSwagger();      // Sin if(Development)
app.UseSwaggerUI();
```

---

## ?? ATAJOS VISUAL STUDIO

| Acción | Atajo |
|--------|-------|
| Compilar | `Ctrl + Shift + B` |
| Ejecutar | `F5` |
| Terminal | `Ctrl + ñ` |
| Renombrar | `Ctrl + R, R` |
| Formato | `Ctrl + K, D` |

---

## ?? URLS IMPORTANTES

```
Azure Portal:     https://portal.azure.com
GitHub Repo:      https://github.com/[USER]/api-examen-final
GitHub Actions:   https://github.com/[USER]/api-examen-final/actions
Swagger Azure:    https://api-examen-[NOMBRE].azurewebsites.net/swagger
```

---

## ? CHECKLIST FINAL

Antes de entregar:
- [ ] Compila sin errores
- [ ] Funciona en local (F5)
- [ ] Push exitoso
- [ ] GitHub Actions ? verde
- [ ] Swagger abre en Azure
- [ ] GET funciona
- [ ] POST funciona
- [ ] Datos persisten

---

## ?? TIPS

1. **LEE TODO** el examen primero
2. **PRUEBA LOCAL** antes de push
3. **COMMITS FRECUENTES**
4. **USA PLANTILLAS** (este documento)
5. **NO PÁNICO** - está todo documentado

---

**URLs de emergencia:**
- Documentos: carpeta `API EXAMEN FINAL\`
- Guía completa: `GUIA_EXAMEN_PASO_A_PASO.md`
- Referencia: `REFERENCIA_RAPIDA_VISUAL.md`

---

**?? ¡ÉXITO EN TU EXAMEN! ??**

_v1.0 - Imprime esta página y tenla a mano durante el examen_
